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
    public class KlijentViewModel : BindableBase
    {
        #region Polja & atributi

        private string adresa { get; set; }
        private string ime { get; set; }
        private string prezime { get; set; }
        private int jmbg { get; set; }

        private Klijent selectedItem;
        private string btnContent;
        private bool isUpdated = false;

        private ObservableCollection<Klijent> klijenti = new ObservableCollection<Klijent>();

        private int currentIndex;

        public string Adresa
        {
            get { return adresa; }
            set
            {
                if (adresa != value)
                {
                    adresa = value;
                    OnPropertyChanged("Adresa");
                }
            }
        }
        public string Ime
        {
            get { return ime; }
            set
            {
                if (ime != value)
                {
                    ime = value;
                    OnPropertyChanged("Ime");
                }
            }
        }

        public string Prezime
        {
            get { return prezime; }
            set
            {
                if (prezime != value)
                {
                    prezime = value;
                    OnPropertyChanged("Prezime");
                }
            }
        }

        public int Jmbg
        {
            get { return jmbg; }
            set
            {
                if (jmbg != value)
                {
                    jmbg = value;
                    OnPropertyChanged("Jmbg");
                }
            }
        }

        public ObservableCollection<Klijent> Klijenti
        {
            get { return klijenti; }
            set
            {
                if (klijenti != value)
                {
                    klijenti = value;
                    OnPropertyChanged("Klijenti");
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
        public Klijent SelectedItem
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


        public KlijentViewModel()
        {
            BtnContent = "Add";
            AddCommand = new MyICommand(OnAdd);
            ChangeCommand = new MyICommand(OnSaveChanges);
            DeleteCommand = new RelayCommand(OnDelete);

            DbHandler.Instance.GetAllKlijents().ForEach(klijent => Klijenti.Add(klijent));


        }

        public void OnAdd()
        {
            if (Validate())
            {
                if (!isUpdated)
                {
                    DbHandler.Instance.CreateKlijent(Adresa, Ime, Prezime, Jmbg);
                    Klijenti.Clear();
                    DbHandler.Instance.GetAllKlijents().ForEach(klijent => Klijenti.Add(klijent));
                }
                else if (isUpdated)
                {
                    BtnContent = "Update";
                    MessageBox.Show("Update data!");
                    DbHandler.Instance.UpdateKlijent(SelectedItem.Id, Adresa, Ime, Prezime, Jmbg);

                    Klijenti.Clear();
                    DbHandler.Instance.GetAllKlijents().ForEach(klijent => Klijenti.Add(klijent));

                    isUpdated = false;
                    Adresa = "";
                    Ime = "";
                    Prezime = "";
                    Jmbg = 0;
                    BtnContent = "Add";
                }
            }

        }

        public void OnSaveChanges()
        {
            Adresa = SelectedItem.Adresa;
            Ime = SelectedItem.Ime;
            Prezime = SelectedItem.Prezime;
            Jmbg = SelectedItem.Jmbg;

            isUpdated = true;
            BtnContent = "Update";
        }

        public void OnDelete()
        {
            int klijentID = Klijenti.ElementAt(currentIndex).Id;
            DbHandler.Instance.DeleteKlijent(klijentID);
            Klijenti.RemoveAt(CurrentIndex);
        }

        private bool Validate()
        {
            if (Adresa.Equals(string.Empty))
            {
                System.Windows.MessageBox.Show("Adresa ne sme biti prazna!", "Greska!", MessageBoxButton.OK, MessageBoxImage.Error);
                return false;
            }
            else if (Ime.Equals(String.Empty))
            {
                System.Windows.MessageBox.Show("Ime ne sme biti prazna!", "Greska!", MessageBoxButton.OK, MessageBoxImage.Error);
                return false;
            }
            else if (Prezime.Equals(String.Empty))
            {
                System.Windows.MessageBox.Show("Prezime ne sme biti prazna!", "Greska!", MessageBoxButton.OK, MessageBoxImage.Error);
                return false;
            }
            else if (Jmbg <= 0 || string.IsNullOrWhiteSpace(Jmbg.ToString()))
            {
                System.Windows.MessageBox.Show("Prezime ne sme biti prazna!", "Greska!", MessageBoxButton.OK, MessageBoxImage.Error);
                return false;
            }

            return true;

        }

        #endregion
    }
}
