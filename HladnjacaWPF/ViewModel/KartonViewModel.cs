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
    public class KartonViewModel : BindableBase
    {
        #region Polja & atributi

        private string vrsta { get; set; }
        private int ugovorId { get; set; }
        private int ugovorKlijentId { get; set; }
        private int ugovorHladnjacaId { get; set; }

        private ObservableCollection<int> ugovorIds = new ObservableCollection<int>();
        private ObservableCollection<int> klijentIds = new ObservableCollection<int>();
        private ObservableCollection<int> hladnjacaIds = new ObservableCollection<int>();

        private Karton selectedItem;
        private string btnContent;
        private bool isUpdated = false;

        private ObservableCollection<Karton> kartons = new ObservableCollection<Karton>();

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


        public int UgovorId
        {
            get { return ugovorId; }
            set
            {
                if (ugovorId != value)
                {
                    ugovorId = value;
                    OnPropertyChanged("UgovorId");
                }
            }
        }
        public int UgovorKlijentId
        {
            get { return ugovorKlijentId; }
            set
            {
                if (ugovorKlijentId != value)
                {
                    ugovorKlijentId = value;
                    OnPropertyChanged("UgovorKlijentId");
                }
            }
        }
        public int UgovorHladnjacaId
        {
            get { return ugovorHladnjacaId; }
            set
            {
                if (ugovorHladnjacaId != value)
                {
                    ugovorHladnjacaId = value;
                    OnPropertyChanged("UgovorHladnjacaId");
                }
            }
        }

        public ObservableCollection<int> UgovorIds
        {
            get { return ugovorIds; }
            set
            {
                if (ugovorIds != value)
                {
                    ugovorIds = value;
                    OnPropertyChanged("UgovorIds");
                }
            }
        }
        public ObservableCollection<int> KlijentIds
        {
            get { return klijentIds; }
            set
            {
                if (klijentIds != value)
                {
                    klijentIds = value;
                    OnPropertyChanged("KlijentIds");
                }
            }
        }
        public ObservableCollection<int> HladnjacaIds
        {
            get { return hladnjacaIds; }
            set
            {
                if (hladnjacaIds != value)
                {
                    hladnjacaIds = value;
                    OnPropertyChanged("HladnjacaIds");
                }
            }
        }

        public ObservableCollection<Karton> Kartons
        {
            get { return kartons; }
            set
            {
                if (kartons != value)
                {
                    kartons = value;
                    OnPropertyChanged("Kartons");
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
        public Karton SelectedItem
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

        #region Contructori i Metode

        public MyICommand AddCommand { get; set; }
        public static RelayCommand DeleteCommand { get; set; }
        public MyICommand ChangeCommand { get; set; }

        public KartonViewModel()
        {
            BtnContent = "Add";
            AddCommand = new MyICommand(OnAdd);
            ChangeCommand = new MyICommand(OnSaveChanges);
            DeleteCommand = new RelayCommand(OnDelete);

            DbHandler.Instance.GetAllKartons().ForEach(k => Kartons.Add(k));
            DbHandler.Instance.GetAllUgovorIds().ForEach(k => UgovorIds.Add(k));
            DbHandler.Instance.GetAllHlIds().ForEach(k => HladnjacaIds.Add(k));
            DbHandler.Instance.GetAllKlIds().ForEach(k => KlijentIds.Add(k));
        }

        public void OnAdd()
        {
            if (Validate())
            {
                if (!isUpdated)
                {
                    DbHandler.Instance.CreateKarton(Vrsta, UgovorId, UgovorKlijentId, UgovorHladnjacaId);
                    Kartons.Clear();
                    DbHandler.Instance.GetAllKartons().ForEach(k => Kartons.Add(k));

                }
                else if (isUpdated)
                {
                    BtnContent = "Update";
                    MessageBox.Show("Updated data!");
                    DbHandler.Instance.UpdateKarton(SelectedItem.Id, SelectedItem.Vrsta);

                    Kartons.Clear();
                    DbHandler.Instance.GetAllKartons().ForEach(k => Kartons.Add(k));

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
            int kartonID = Kartons.ElementAt(currentIndex).Id;
            DbHandler.Instance.DeleteHladnjaca(kartonID);
            Kartons.RemoveAt(CurrentIndex);
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

        #endregion


    }
}
