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
    public class HladnjacaViewModel : BindableBase
    {

        #region Polja & atributi

        private string nazivHladnjace { get; set; }

        private int choosenOjID { get; set; }

        private ObservableCollection<int> orgJediniceIDs = new ObservableCollection<int>();

        private Hladnjaca selectedItem;
        private string btnContent;
        private bool isUpdated = false;

        private ObservableCollection<Hladnjaca> hladnjace = new ObservableCollection<Hladnjaca>();

        private int currentIndex;
        public string NazivHladnjace
        {
            get { return nazivHladnjace; }
            set
            {
                if (nazivHladnjace != value)
                {
                    nazivHladnjace = value;
                    OnPropertyChanged("NazivHladnjace");
                }
            }
        }
        public int ChoosenOjID
        {
            get { return choosenOjID; }
            set
            {
                if (choosenOjID != value)
                {
                    choosenOjID = value;
                    OnPropertyChanged("ChoosenOjID");
                }
            }
        }
        public ObservableCollection<int> OrgJediniceIDs
        {
            get { return orgJediniceIDs; }
            set
            {
                if (orgJediniceIDs != value)
                {
                    orgJediniceIDs = value;
                    OnPropertyChanged("OrgJediniceIDs");
                }
            }
        }
        public ObservableCollection<Hladnjaca> Hladnjace
        {
            get { return hladnjace; }
            set
            {
                if (hladnjace != value)
                {
                    hladnjace = value;
                    OnPropertyChanged("Hladnjace");
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
        public Hladnjaca SelectedItem
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


        public HladnjacaViewModel()
        {
            BtnContent = "Add";
            AddCommand = new MyICommand(OnAdd);
            ChangeCommand = new MyICommand(OnSaveChanges);
            DeleteCommand = new RelayCommand(OnDelete);

            DbHandler.Instance.GetAllHladnjacas().ForEach(hladnjaca => Hladnjace.Add(hladnjaca));
            DbHandler.Instance.GetAllOJIDS().ForEach(ojid => OrgJediniceIDs.Add(ojid));
            
        }


        public void OnAdd()
        {
            if (Validate())
            {
                if (!isUpdated)
                {
                    DbHandler.Instance.CreateHladnjaca(NazivHladnjace, ChoosenOjID);
                    Hladnjace.Clear();
                    DbHandler.Instance.GetAllHladnjacas().ForEach(hladnjaca => Hladnjace.Add(hladnjaca));
                }
                else if (isUpdated)
                {
                    BtnContent = "Update";
                    MessageBox.Show("Updated data!");
                    DbHandler.Instance.UpdateHladnnjaca(SelectedItem.Id, NazivHladnjace, ChoosenOjID);

                    Hladnjace.Clear();
                    DbHandler.Instance.GetAllHladnjacas().ForEach(hladnjaca => Hladnjace.Add(hladnjaca));

                    isUpdated = false;
                    NazivHladnjace = "";
                    BtnContent = "Add";
                }
            }
            
        }

        public void OnSaveChanges()
        {
            NazivHladnjace = SelectedItem.NazivHladnjace;
            ChoosenOjID = SelectedItem.OrganizacionaJedinicaId;

            isUpdated = true;
            BtnContent = "Update";
        }

        public void OnDelete()
        {
            int hladnjacaID = Hladnjace.ElementAt(currentIndex).Id;
            DbHandler.Instance.DeleteHladnjaca(hladnjacaID);
            Hladnjace.RemoveAt(CurrentIndex);
        }

        private bool Validate()
        {
            if (string.IsNullOrEmpty(NazivHladnjace))
            {
                System.Windows.MessageBox.Show("NazivHladnjace ne sme biti prazan!", "Greska!", MessageBoxButton.OK, MessageBoxImage.Error);
                return false;
            }
            else if(ChoosenOjID <= 0 || string.IsNullOrWhiteSpace(ChoosenOjID.ToString()))
            {
                System.Windows.MessageBox.Show("OJ Id ne sme biti prazan!", "Greska!", MessageBoxButton.OK, MessageBoxImage.Error);
                return false;
            }
            return true;
        }



        #endregion



    }
}
