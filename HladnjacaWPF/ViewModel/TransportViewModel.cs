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
    public class TransportViewModel : BindableBase
    {
        #region Polja & atributi

        private Transport selectedItem;
        private string btnContent;
        private bool isUpdated = false;

        private ObservableCollection<Transport> transports = new ObservableCollection<Transport>();

        private int currentIndex;

        public ObservableCollection<Transport> Transports
        {
            get { return transports; }
            set
            {
                if (transports != value)
                {
                    transports = value;
                    OnPropertyChanged("Transports");
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
        public Transport SelectedItem
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


        public TransportViewModel()
        {
            BtnContent = "Add";
            AddCommand = new MyICommand(OnAdd);
            ChangeCommand = new MyICommand(OnSaveChanges);
            DeleteCommand = new RelayCommand(OnDelete);

            DbHandler.Instance.GetAllTransports().ForEach(t => Transports.Add(t));
        }

        public void OnAdd()
        {
            if (!isUpdated)
            {
                DbHandler.Instance.CreateTransport();
                Transports.Clear();
                DbHandler.Instance.GetAllTransports().ForEach(t => Transports.Add(t));
            }
            else if (isUpdated)
            {
                BtnContent = "Update";
                MessageBox.Show("Updated data!");
                DbHandler.Instance.UpdateTransprot();

                Transports.Clear();
                DbHandler.Instance.GetAllTransports().ForEach(t => Transports.Add(t));

                isUpdated = false;
                BtnContent = "Add";
            }
        }

        public void OnSaveChanges()
        {
            isUpdated = true;
            BtnContent = "Update";
        }

        public void OnDelete()
        {
            int transportID = Transports.ElementAt(currentIndex).Id;
            DbHandler.Instance.DeleteTransport(transportID);
            Transports.RemoveAt(CurrentIndex);
        }

        #endregion

    }
}
