   M S B A M L   `   `   `  ����G  CHladnjacaWPF, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null5clr-namespace:HladnjacaWPF.ViewHladnjacaWPF.View  5      "    HladnjacaWPF.View.UgovorView   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      1localclr-namespace:HladnjacaWPF.View     5      .��5	      ]� .+�5
   
   ]� .+�5      �   � ColumnDefinitions  5      �� 5      $��1* �6'   �� 5      $��1* �6'   �� 5      $��1* �6'   �� 5      $��1* �6'    � RowDefinitions 5      �� 5      $��1* �6$   �� 5      $��1* �6$   �� 5      $��1* �6$   �� 5      $��1* �6$   �� 5      $��1* �6$   �� 5      $��1* �6$   �� 5      $��1* �6$   �� 5      $��1* �6$   �� 5      $��1* �6$   �� 5      $��1* �6$   .+�5      �� $��0��6   $��0��6(   $��	45,5,45,5q�65   $��13(�6H   $��Ugovori��6V   $��2��6h   
���   �$��Center=�6�   &   System.Windows.Controls.DataGrid  5       $��0��6m   $��1��6}   $��2��6�   $��8��6�   
�������   	RowHeight$ 26Q�5%         ColumnHeaderHeight$ 32Q�5&         VerticalGridLinesBrush
 �����$��18(�5(      
���   �   CanUserAddRows .     CanUserDeleteRows .     SelectionMode$ Single=�5,         CanUserResizeColumns .  	   
IsReadOnly	 . 
   AutoGenerateColumns
 .     HeadersVisibility$ Column=�50      $
��0,10q�51      ��5       �� *	Ugovors+ �� Mode$ TwoWay=� �� UpdateSourceTrigger$ PropertyChanged=� �� SelectedIndex 5!      �� *CurrentIndex+ �� SelectedItem 5"      �� *SelectedItem+��5#      Z�  � 	Resources 52      =  7System.Windows.Controls.Primitives.DataGridColumnHeader �� BasedOn �� 
TargetType �� Property �� Value��%]   '        7 �� 53      8   "  6Y   .�54      ��  � ��
 ���� 6;   55      56         Columns 58      0  *System.Windows.Controls.DataGridTextColumn  59      ,  &System.Windows.Controls.DataGridColumn   Header$ ID��6-      Width5  /System.Windows.Controls.DataGridLengthConverter$ 25 6U      
Foreground
 �   �   FontSize$ 14Q�6�   1  +System.Windows.Controls.DataGridBoundColumn   Binding 6c   �� *Id+$ PropertyChanged=�$ TwoWay=�6�     5:      $	 Tip��6-   $ 95 6U   
 �   �$ 14Q�6�    6b   �� *Tip+$ PropertyChanged=�$ TwoWay=�6�     5;      $ Datum potpisa��6-   $	 140 6U   
 �   �$ 14Q�6�    6c   �� *DatumPotpisivanja+$ PropertyChanged=�$ TwoWay=�6�     5<      $ KL ID��6-   $ 60 6U   
 �   �$ 14Q�6�    6c   �� *	KlijentId+$ PropertyChanged=�$ TwoWay=�6�     5=      $ HL ID��6-   $ 60 6U   
 �   �$ 14Q�6�    6c   �� *HladnjacaId+$ PropertyChanged=�$ TwoWay=�6�   5?      �� 5A      $��Izmeni��6   $��9��6*   $��0��67   $��	45,5,45,5q�6G   
�������
���   �$��18(�6�   ��6�   �� *ChangeCommand+�� 5B      $��Obrisi��6   $��9��6*   $��1��67   $��	45,5,45,5q�6G   
�������
���   �$��18(�6�   ��6�   �� *DeleteCommand+�� 5I      $��2��6   $��0��6(   $��	45,5,45,5q�65   $��13(�6H   $��Novi Ugovor��6V   
���   �$��2��6   $��Center=�6�   �� 5K      $��1��6   $��2��6%   $��5q�66   $
��Tip:��6A   
���   �$��13(�6c   �� 5L      -   5         ��Name$	 tip��5L      $��1��6(   $��3��65   $��5q�6F    �� TextWrapping$
 Wrap=�6Q   ��6e   �� *Tip+$ PropertyChanged=�$ TwoWay=��� 5N      $��5��6   $��2��6%   $��5q�66   $��Klijent Id:��6A   
���   �$��13(�6j   �� 5O      -   5         ��Name$ 	klijentID��5O      $��5��6/   $��3��6<   $��5q�6M   ��6Y   ��  �� Path$ 
KlijentIds� 6�   �� *ChoosenKlijentID+$ PropertyChanged=��� 5Q      $��7��6   $��2��6%   $��5q�66   $��Hladnjaca Id:��6A   
���   �$��13(�6l   �� 5R      -   5        $ hladnjacaID��5R      $��7��61   $��3��6>   $��5q�6O   ��6[   �� $ HladnjacaIds� 6�   �� *ChoosenHladnjacaID+$ PropertyChanged=��� 5T      $��9��6   $��2��6&   $��2��66   $��5q�6J   
�������
���   �$��18(�6�   ��6U   �� *
BtnContent+��6�   �� *
AddCommand+5V      5W      5X      5Y      