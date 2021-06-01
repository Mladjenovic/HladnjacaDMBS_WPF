using HladnjacaWPF.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace HladnjacaWPF.View
{
    /// <summary>
    /// Interaction logic for HladnjacaView.xaml
    /// </summary>
    public partial class HladnjacaView : UserControl
    {
        public HladnjacaView()
        {
            InitializeComponent();
            DataContext = new HladnjacaViewModel();
        }
    }
}
