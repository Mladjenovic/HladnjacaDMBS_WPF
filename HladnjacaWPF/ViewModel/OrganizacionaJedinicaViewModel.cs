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
    public class OrganizacionaJedinicaViewModel : BindableBase
    {
        #region Polja & atributi

        private string naziv { get; set; }
        private int? organizacionaJedinicaId_nadredjena { get; set; }

        private OrganizacionaJedinica selectedItem;
        private string btnContent;
        private bool isUpdated = false;

        private ObservableCollection<OrganizacionaJedinica> organizacioneJedinice = new ObservableCollection<OrganizacionaJedinica>();

        private int currentIndex;

        public string Naziv
        {
            get { return naziv; }
            set
            {
                if (naziv != value)
                {
                    naziv = value;
                    OnPropertyChanged("Naziv");
                }
            }
        }
        public int? OrganizacionaJedinicaId_nadredjena
        {
            get { return organizacionaJedinicaId_nadredjena; }
            set
            {
                if (organizacionaJedinicaId_nadredjena != value)
                {
                    organizacionaJedinicaId_nadredjena = value;
                    OnPropertyChanged("OrganizacionaJedinicaId_nadredjena");
                }
            }
        }
        public ObservableCollection<OrganizacionaJedinica> OrganizacioneJedinice
        {
            get { return organizacioneJedinice; }
            set
            {
                if (organizacioneJedinice != value)
                {
                    organizacioneJedinice = value;
                    OnPropertyChanged("OrganizacioneJedinice");
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
        public OrganizacionaJedinica SelectedItem
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

        #region Construktori i Metode

        public MyICommand AddCommand { get; set; }
        public static RelayCommand DeleteCommand { get; set; }
        public MyICommand ChangeCommand { get; set; }

        public OrganizacionaJedinicaViewModel()
        {
            BtnContent = "Add";
            AddCommand = new MyICommand(OnAdd);
            ChangeCommand = new MyICommand(OnSaveChanges);
            DeleteCommand = new RelayCommand(OnDelete);

            DbHandler.Instance.GetAllOrganizacionaJedinicas().ForEach(oj => OrganizacioneJedinice.Add(oj));
        }

        public void OnAdd()
        {
            if (!isUpdated)
            {
                DbHandler.Instance.CreateOrganizacionaJedinica(Naziv, OrganizacionaJedinicaId_nadredjena);
                OrganizacioneJedinice.Clear();
                DbHandler.Instance.GetAllOrganizacionaJedinicas().ForEach(oj => OrganizacioneJedinice.Add(oj));
            }
            else if (isUpdated)
            {
                BtnContent = "Update";
                MessageBox.Show("Update data!");
                DbHandler.Instance.UpdateOrganizacionaJedinica(SelectedItem.Id, Naziv, OrganizacionaJedinicaId_nadredjena);

                OrganizacioneJedinice.Clear();
                DbHandler.Instance.GetAllOrganizacionaJedinicas().ForEach(oj => OrganizacioneJedinice.Add(oj));

                isUpdated = false;
                Naziv = "";
                OrganizacionaJedinicaId_nadredjena = null;
                BtnContent = "Add";
            }
        }
        public void OnSaveChanges()
        {
            Naziv = SelectedItem.Naziv;
            OrganizacionaJedinicaId_nadredjena = SelectedItem.OrganizacionaJedinicaId_nadredjena;

            isUpdated = true;
            BtnContent = "Update";
        }
        public void OnDelete()
        {
            int ojID = OrganizacioneJedinice.ElementAt(currentIndex).Id;
            DbHandler.Instance.DeleteOrganizacionaJedinica(ojID);
            OrganizacioneJedinice.RemoveAt(CurrentIndex);
        }


        #endregion
    }
}
