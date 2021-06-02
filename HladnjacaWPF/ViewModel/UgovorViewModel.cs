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
    public class UgovorViewModel : BindableBase
    {
        #region Polja & atributi
        private string tip { get; set; }
        private DateTime datumPotpisivanja { get; set; }
        private int choosenKlijentID { get; set; }
        private int choosenHladnjacaID { get; set; }


        private ObservableCollection<int> klijentIds = new ObservableCollection<int>();
        private ObservableCollection<int> hladnjacaIds = new ObservableCollection<int>();

        private Ugovor selectedItem;
        private string btnContent;
        private bool isUpdated = false;

        private ObservableCollection<Ugovor> ugovors = new ObservableCollection<Ugovor>();

        private int currentIndex;

        public string Tip
        {
            get { return tip; }
            set
            {
                if (tip != value)
                {
                    tip = value;
                    OnPropertyChanged("Tip");
                }
            }
        }
        public DateTime DatumPotpisivanja
        {
            get { return datumPotpisivanja; }
            set
            {
                if (datumPotpisivanja != value)
                {
                    datumPotpisivanja = value;
                    OnPropertyChanged("DatumPotpisivanja");
                }
            }
        }
        public int ChoosenKlijentID
        {
            get { return choosenKlijentID; }
            set
            {
                if (choosenKlijentID != value)
                {
                    choosenKlijentID = value;
                    OnPropertyChanged("ChoosenKlijentID");
                }
            }
        }
        public int ChoosenHladnjacaID
        {
            get { return choosenHladnjacaID; }
            set
            {
                if (choosenHladnjacaID != value)
                {
                    choosenHladnjacaID = value;
                    OnPropertyChanged("ChoosenHladnjacaID");
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
        public ObservableCollection<Ugovor> Ugovors
        {
            get { return ugovors; }
            set
            {
                if (ugovors != value)
                {
                    ugovors = value;
                    OnPropertyChanged("Ugovors");
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
        public Ugovor SelectedItem
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

        public UgovorViewModel()
        {
            BtnContent = "Add";
            AddCommand = new MyICommand(OnAdd);
            ChangeCommand = new MyICommand(OnSaveChanges);
            DeleteCommand = new RelayCommand(OnDelete);

            DbHandler.Instance.GetAllUgovors().ForEach(ugovor => Ugovors.Add(ugovor));
            DbHandler.Instance.GetAllHlIds().ForEach(hlid => HladnjacaIds.Add(hlid));
            DbHandler.Instance.GetAllKlIds().ForEach(klid => KlijentIds.Add(klid));
        }

        public void OnAdd()
        {
            if (Validate())
            {
                if (!isUpdated)
                {
                    DbHandler.Instance.CreateUgovor(Tip, ChoosenKlijentID, ChoosenHladnjacaID);
                    Ugovors.Clear();
                    DbHandler.Instance.GetAllUgovors().ForEach(u => Ugovors.Add(u));
                }
                else if (isUpdated)
                {
                    BtnContent = "Update";
                    MessageBox.Show("Updated data!");
                    DbHandler.Instance.UpdateUgovor(SelectedItem.Id, Tip);

                    Ugovors.Clear();
                    DbHandler.Instance.GetAllUgovors().ForEach(u => Ugovors.Add(u));

                    isUpdated = false;
                    Tip = "";
                    BtnContent = "Add";
                }
            }
        }
        public void OnSaveChanges()
        {
            Tip = SelectedItem.Tip;
            ChoosenHladnjacaID = SelectedItem.HladnjacaId;
            ChoosenKlijentID = SelectedItem.KlijentId;

            isUpdated = true;
            BtnContent = "Update";
        }
        public void OnDelete()
        {
            int ugovorID = Ugovors.ElementAt(currentIndex).Id;
            DbHandler.Instance.DeleteUgovor(ugovorID);
            Ugovors.RemoveAt(CurrentIndex);
        }

        private bool Validate()
        {
            if (string.IsNullOrEmpty(Tip))
            {
                System.Windows.MessageBox.Show("Tip ne sme biti prazan!", "Greska!", MessageBoxButton.OK, MessageBoxImage.Error);
                return false;
            }
            else if (ChoosenHladnjacaID <= 0 || string.IsNullOrWhiteSpace(ChoosenHladnjacaID.ToString()))
            {
                System.Windows.MessageBox.Show("ID Hladnnjace Id ne sme biti prazan!", "Greska!", MessageBoxButton.OK, MessageBoxImage.Error);
                return false;
            }
            else if (ChoosenKlijentID <= 0 || string.IsNullOrWhiteSpace(ChoosenKlijentID.ToString()))
            {
                System.Windows.MessageBox.Show("ID Klijenta Id ne sme biti prazan!", "Greska!", MessageBoxButton.OK, MessageBoxImage.Error);
                return false;
            }
            return true;
        }
        #endregion
    }
}
