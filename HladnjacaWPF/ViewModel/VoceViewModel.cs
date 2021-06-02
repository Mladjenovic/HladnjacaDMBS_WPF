using DBModel;
using DBModel.Helpers;
using GalaSoft.MvvmLight.Command;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace HladnjacaWPF.ViewModel
{
    public class VoceViewModel : BindableBase
    {
        #region Polja & atributi

        private string vrsta { get; set; }

        private Voce selectedItem;
        private string btnContent;
        private bool isUpdated = false;

        private ObservableCollection<Voce> voces = new ObservableCollection<Voce>();

        private int currentIndex;
        public string Vrsta
        {
            get { return vrsta; }
            set
            {
                if (vrsta != value)
                {
                    vrsta = value;
                    OnPropertyChanged("Vrsta");
                }
            }
        }


        public ObservableCollection<Voce> Voces
        {
            get { return voces; }
            set
            {
                if (voces != value)
                {
                    voces = value;
                    OnPropertyChanged("Voces");
                }
            }
        }
        public int CurrentIndex
        {
            get { return currentIndex; }
            set
            {
                if (currentIndex != value)
                {
                    currentIndex = value;
                    OnPropertyChanged("CurrentIndex");
                }
            }
        }
        public Voce SelectedItem
        {
            get { return selectedItem; }
            set
            {
                if (selectedItem != value)
                {
                    selectedItem = value;
                    OnPropertyChanged("SelectedItem");
                }
            }
        }
        public string BtnContent
        {
            get { return btnContent; }
            set
            {
                if (btnContent != value)
                {
                    btnContent = value;
                    OnPropertyChanged("BtnContent");
                }
            }
        }

        #endregion

        public MyICommand AddCommand { get; set; }
        public static RelayCommand DeleteCommand { get; set; }
        public MyICommand ChangeCommand { get; set; }

        public VoceViewModel()
        {
            BtnContent = "Add";
            AddCommand = new MyICommand(OnAdd);
            ChangeCommand = new MyICommand(OnSaveChanges);
            DeleteCommand = new RelayCommand(OnDelete);

            DbHandler.Instance.getAllVoces().ForEach(voce => Voces.Add(voce));
        }

        public void OnAdd()
        {
            if (Validate())
            {
                if (!isUpdated)
                {
                    DbHandler.Instance.CreateVoce(Vrsta);
                    Voces.Clear();
                    DbHandler.Instance.getAllVoces().ForEach(voce => Voces.Add(voce));
                }
                else if (isUpdated)
                {
                    BtnContent = "Update";
                    MessageBox.Show("Updated data!");
                    DbHandler.Instance.UpdateVoce(SelectedItem.Id, Vrsta);

                    Voces.Clear();
                    DbHandler.Instance.getAllVoces().ForEach(voce => Voces.Add(voce));

                    isUpdated = false;
                    Vrsta = "";
                    BtnContent = "Add";
                }
            }
        }

        public void OnSaveChanges()
        {
            Vrsta = SelectedItem.Vrsta;

            isUpdated = true;
            BtnContent = "Update";
        }
        public void OnDelete()
        {
            int voceid = Voces.ElementAt(currentIndex).Id;
            DbHandler.Instance.DeleteVoce(voceid);
            Voces.RemoveAt(CurrentIndex);
        }

        private bool Validate()
        {
            if (string.IsNullOrEmpty(Vrsta))
            {
                System.Windows.MessageBox.Show("Vrsta ne sme biti prazan!", "Greska!", MessageBoxButton.OK, MessageBoxImage.Error);
                return false;
            }
            return true;
        }




    }
}
