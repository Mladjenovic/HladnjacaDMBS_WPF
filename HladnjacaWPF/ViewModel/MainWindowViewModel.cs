using DBModel.Helpers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HladnjacaWPF.ViewModel
{
    public class MainWindowViewModel : BindableBase
    {
        private KlijentViewModel klijentViewModel;
        private OrganizacionaJedinicaViewModel organizacionaJedinicaViewModel;
        private HladnjacaViewModel hladnjacaViewModel;
        private KomoraViewModel komoraViewModel;

        public MyICommand<string> NavCommand { get; private set; }


        private BindableBase currentViewModel;
        public BindableBase CurrentViewModel
        {
            get { return currentViewModel; }
            set
            {
                SetProperty(ref currentViewModel, value);
            }
        }

        public MainWindowViewModel()
        {
            klijentViewModel = new KlijentViewModel();
            organizacionaJedinicaViewModel = new OrganizacionaJedinicaViewModel();
            hladnjacaViewModel = new HladnjacaViewModel();
            komoraViewModel = new KomoraViewModel();

            NavCommand = new MyICommand<string>(OnNav);
            currentViewModel = klijentViewModel;
        }

        public void OnNav(string arg)
        {
            switch (arg)
            {
                case "1": CurrentViewModel = klijentViewModel; break;
                case "2": CurrentViewModel = organizacionaJedinicaViewModel; break;
                case "3": CurrentViewModel = hladnjacaViewModel; break;
                case "4": CurrentViewModel = komoraViewModel; break;
                default:
                    break;
            }
        }

    }
}
