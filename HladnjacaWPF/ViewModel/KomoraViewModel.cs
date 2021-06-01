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
    public class KomoraViewModel : BindableBase
    {

        #region Polja & atributi
        private string nazivKomore { get; set; }
        private int choosenHlID { get; set; }

        private ObservableCollection<int> hladnjacaIds = new ObservableCollection<int>();

        private Komora selectedItem;
        private string btnContent;
        private bool isUpdated = false;

        private ObservableCollection<Komora> komore = new ObservableCollection<Komora>();

        private int currentIndex;
        public string NazivKomore
        {
            get { return nazivKomore; }
            set
            {
                if (nazivKomore != value)
                {
                    nazivKomore = value;
                    OnPropertyChanged("NazivKomore");
                }
            }
        }
        public int ChoosenHlID
        {
            get { return choosenHlID; }
            set
            {
                if (choosenHlID != value)
                {
                    choosenHlID = value;
                    OnPropertyChanged("ChoosenHlID");
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
        public ObservableCollection<Komora> Komore
        {
            get { return komore; }
            set
            {
                if (komore != value)
                {
                    komore = value;
                    OnPropertyChanged("Komore");
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
        public Komora SelectedItem
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

        public KomoraViewModel()
        {
            BtnContent = "Add";
            AddCommand = new MyICommand(OnAdd);
            ChangeCommand = new MyICommand(OnSaveChanges);
            DeleteCommand = new RelayCommand(OnDelete);

            DbHandler.Instance.GetAllKomoras().ForEach(komora => Komore.Add(komora));
            DbHandler.Instance.GetAllHlIds().ForEach(hlid => hladnjacaIds.Add(hlid));
        }

        public void OnAdd()
        {
            if (!isUpdated)
            {
                DbHandler.Instance.CreateKomora(NazivKomore, ChoosenHlID);
                Komore.Clear();
                DbHandler.Instance.GetAllKomoras().ForEach(komora => Komore.Add(komora));
            }
            else if (isUpdated)
            {
                BtnContent = "Update";
                MessageBox.Show("Updated data!");
                DbHandler.Instance.UpdateKomora(SelectedItem.Id, NazivKomore, ChoosenHlID);

                Komore.Clear();
                DbHandler.Instance.GetAllKomoras().ForEach(komora => Komore.Add(komora));

                isUpdated = false;
                NazivKomore = "";
                BtnContent = "Add";
            }
        }

        public void OnSaveChanges()
        {
            NazivKomore = SelectedItem.NazivKomore;
            ChoosenHlID = SelectedItem.HladnjacaId;

            isUpdated = true;
            BtnContent = "Update";
        }

        public void OnDelete()
        {
            int komoraID = Komore.ElementAt(currentIndex).Id;
            DbHandler.Instance.DeleteKomora(komoraID);
            Komore.RemoveAt(CurrentIndex);
        }

        #endregion
    }
}
