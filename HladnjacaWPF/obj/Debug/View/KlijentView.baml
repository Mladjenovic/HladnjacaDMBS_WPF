   M S B A M L   `   `   `  ����G  CHladnjacaWPF, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null5clr-namespace:HladnjacaWPF.ViewHladnjacaWPF.View  5      #    HladnjacaWPF.View.KlijentView   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      1localclr-namespace:HladnjacaWPF.View     5      .��5	      ]� .+�5
   
   ]� .+�5      �   � ColumnDefinitions  5      �� 5      $��1* �6'   �� 5      $��1* �6'   �� 5      $��1* �6'   �� 5      $��1* �6'    � RowDefinitions 5      �� 5      $��1* �6$   �� 5      $��1* �6$   �� 5      $��1* �6$   �� 5      $��1* �6$   �� 5      $��1* �6$   �� 5      $��1* �6$   �� 5      $��1* �6$   �� 5      $��1* �6$   �� 5      $��1* �6$   �� 5      $��1* �6$   .+�5      �� $��0��6   $��0��6(   $��	45,5,45,5q�65   $��13(�6H   $��Klijenti��6V   $��2��6i   
���   �$��Center=�6�   &   System.Windows.Controls.DataGrid  5       $��0��6n   $��1��6~   $��2��6�   $��8��6�   
�������   	RowHeight$ 26Q�5%         ColumnHeaderHeight$ 32Q�5&         VerticalGridLinesBrush
 �����$��18(�5(      
���   �   CanUserAddRows .     CanUserDeleteRows .     SelectionMode$ Single=�5,         CanUserResizeColumns .  	   
IsReadOnly	 . 
   AutoGenerateColumns
 .     HeadersVisibility$ Column=�50      $
��0,10q�51      ��5       �� *
Klijenti+ �� Mode$ TwoWay=� �� UpdateSourceTrigger$ PropertyChanged=� �� SelectedIndex 5!      �� *CurrentIndex+ �� SelectedItem 5"      �� *SelectedItem+��5#      Z�  � 	Resources 52      =  7System.Windows.Controls.Primitives.DataGridColumnHeader �� BasedOn �� 
TargetType �� Property �� Value��%]   '        7 �� 53      8   "  6Y   .�54      ��  � ��
 ���� 6;   55      56         Columns 58      0  *System.Windows.Controls.DataGridTextColumn  59      ,  &System.Windows.Controls.DataGridColumn   Header$ ID��6-      Width5  /System.Windows.Controls.DataGridLengthConverter$ 25 6E      
Foreground
 �   �   FontSize$ 14Q�6�   1  +System.Windows.Controls.DataGridBoundColumn   Binding 6Q   �� *Id+$ PropertyChanged=�$ TwoWay=�6�     5:      $ Adresa��6-   $	 130 6E   
 �   �$ 14Q�6�    6Q   �� *Adresa+$ PropertyChanged=�$ TwoWay=�6�     5;      $	 Ime��6-   $ 60 6E   
 �   �$ 14Q�6�    6Q   �� *Ime+$ PropertyChanged=�$ TwoWay=�6�     5<      $ Prezime��6-   $	 100 6E   
 �   �$ 14Q�6�    6R   �� *	Prezime+$ PropertyChanged=�$ TwoWay=�6�     5=      $
 JMBG��6-   $	 120 6E   
 �   �$ 14Q�6�    6Q   �� *Jmbg+$ PropertyChanged=�$ TwoWay=�6�   5?      �� 5A      $��Izmeni��6   $��9��6*   $��0��67   $��	45,5,45,5q�6G   
�������
���   �$��18(�6�   ��6�   �� *ChangeCommand+�� 5B      $��Obrisi��6   $��9��6*   $��1��67   $��	45,5,45,5q�6G   
�������
���   �$��18(�6�   ��6�   �� *DeleteCommand+�� 5I      $��2��6   $��0��6(   $��	45,5,45,5q�65   $��13(�6H   $��Novi klijent��6V   
���   �$��2��6�   $��Center=�6�   �� 5K      $��1��6   $��2��6%   $��5q�66   $��Adresa:��6A   
���   �$��13(�6f   �� 5L      -   5         ��Name$ adresa��5L      $��1��6+   $��3��68   $��5q�6I    �� TextWrapping$
 Wrap=�6T   ��6h   �� *Adresa+$ PropertyChanged=�$ TwoWay=��� 5N      $��3��6   $��2��6%   $��5q�66   $
��Ime:��6A   
���   �$��13(�6c   �� 5O      -   5        $	 ime��5O      $��3��6(   $��3��65   $��5q�6F   $
 Wrap=�6Q   ��6e   �� *Ime+$ PropertyChanged=�$ TwoWay=��� 5Q      $��5��6   $��2��6%   $��5q�66   $��Prezime:��6A   
���   �$��13(�6g   �� 5R      -   5        $ prezime��5R      $��5��6,   $��3��69   $��5q�6J   $
 Wrap=�6U   ��6i   �� *	Prezime+$ PropertyChanged=�$ TwoWay=��� 5T      $��7��6   $��2��6%   $��5q�66   $��JMBG:��6A   
���   �$��13(�6d   �� 5U      -   5        $
 jmbg��5U      $��7��6)   $��3��66   $��5q�6G   $
 Wrap=�6R   ��6f   �� *Jmbg+$ PropertyChanged=�$ TwoWay=��� 5W      $��9��6   $��2��6&   $��2��66   $��5q�6J   
�������
���   �$��18(�6�   ��6U   �� *
BtnContent+��6�   �� *
AddCommand+5Y      5Z      5[      5\      