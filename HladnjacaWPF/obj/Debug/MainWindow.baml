   M S B A M L   `   `   `  ����G  CHladnjacaWPF, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null+clr-namespace:HladnjacaWPFHladnjacaWPF  5   	   5clr-namespace:HladnjacaWPF.ViewHladnjacaWPF.View  5   	   ?$clr-namespace:HladnjacaWPF.ViewModelHladnjacaWPF.ViewModel  5   	       HladnjacaWPF.MainWindow   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   ,localclr-namespace:HladnjacaWPF     5   	   1viewsclr-namespace:HladnjacaWPF.View     5   	   ;
viewModels$clr-namespace:HladnjacaWPF.ViewModel     5   	     � Title$  
MainWindow��5
   	   $	��450��6   $	��800��6)    � 	Resources 5       �� DataType-   'HladnjacaWPF.ViewModel.KlijentViewModel#   HladnjacaWPF.View.KlijentView;   5HladnjacaWPF.ViewModel.OrganizacionaJedinicaViewModel1   +HladnjacaWPF.View.OrganizacionaJedinicaView/   )HladnjacaWPF.ViewModel.HladnjacaViewModel%   HladnjacaWPF.View.HladnjacaView,   &HladnjacaWPF.ViewModel.KomoraViewModel"   HladnjacaWPF.View.KomoraView*	   $HladnjacaWPF.ViewModel.VoceViewModel 
   HladnjacaWPF.View.VoceView,   &HladnjacaWPF.ViewModel.UgovorViewModel"   HladnjacaWPF.View.UgovorView/   )HladnjacaWPF.ViewModel.TransportViewModel%   HladnjacaWPF.View.TransportView,   &HladnjacaWPF.ViewModel.KartonViewModel"   HladnjacaWPF.View.KartonView��%X  (��       5      *, +)(�� 2     5      *, +)(�� d     5      *, +)(�� �     5      *, +)(�� �     5      *,	 +)(�� �     5      *, +)(�� ,    5      *, +)(�� ^    5"      *, +)�� 5   
   "  6   .R�5        5      �� 5   
   "  6   .R�5        5      �� 5   
   "  6   .R�5        5      �� 5   
   "  6   .R�5        5      �� 5   
   " 	 6   .R�5      
  5      �� 5   
   "  6   .R�5        5      �� 5   
   "  6   .R�5         5!      �� 5"   
   "  6   .R�5#        5$      5%      .��5'      ]� .+�5(   
   o� $	��Top=�6   $��Center=�6$   $��Center=�6A   .@�5)      m� $��Klijenti��6   $��12(�6I   $��10q�6W   $
��Bold"�6d    m� CommandParameter$ 1��5*       m� Command 5)   )   �� *
NavCommand+5*      m� 5+      $��
O.Jedinice��6   $��12(�6K   $��10q�6Y   $
��Bold"�6f   $ 2��5,       5+   +   �� *
NavCommand+5,      m� 5-      $��
Hladnnjace��6   $��12(�6K   $��10q�6Y   $
��Bold"�6f   $ 3��5.       5-   +   �� *
NavCommand+5.      m� 5/      $��Komore��6   $��12(�6G   $��10q�6U   $
��Bold"�6b   $ 4��50       5/   '   �� *
NavCommand+50      m� 51      $
��Voce��6   $��12(�6E   $��10q�6S   $
��Bold"�6`   $ 5��52       51   %   �� *
NavCommand+52      m� 53      $��Ugovori��6   $��12(�6H   $��10q�6V   $
��Bold"�6c   $ 6��54       53   (   �� *
NavCommand+54      m� 55      $��
Transporti��6   $��12(�6K   $��10q�6Y   $
��Bold"�6f   $ 7��56       55   +   �� *
NavCommand+56      m� 57      $��Karoni��6   $��12(�6G   $��10q�6U   $
��Bold"�6b   $ 8��58       57   '   �� *
NavCommand+58      59      �� 5:   
   $��Bottom=�6    �� Left$
 auto��61    �� Right$
 auto��6D   ��6X   �� *CurrentViewModel+5;      5<      