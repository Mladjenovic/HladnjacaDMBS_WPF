   M S B A M L   `   `   `  ����G  CHladnjacaWPF, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null5clr-namespace:HladnjacaWPF.ViewHladnjacaWPF.View  5      "    HladnjacaWPF.View.KomoraView   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      1localclr-namespace:HladnjacaWPF.View     5      .��5	      ]� .+�5
   
   ]� .+�5      �   � ColumnDefinitions  5      �� 5      $��1* �6'   �� 5      $��1* �6'   �� 5      $��1* �6'   �� 5      $��1* �6'    � RowDefinitions 5      �� 5      $��1* �6$   �� 5      $��1* �6$   �� 5      $��1* �6$   �� 5      $��1* �6$   �� 5      $��1* �6$   �� 5      $��1* �6$   �� 5      $��1* �6$   �� 5      $��1* �6$   �� 5      $��1* �6$   �� 5      $��1* �6$   .+�5      �� $��0��6   $��0��6(   $��	45,5,45,5q�65   $��13(�6H   $��Komore��6V   $��2��6g   
���   �$��Center=�6�   &   System.Windows.Controls.DataGrid  5       $��0��6l   $��1��6|   $��2��6�   $��8��6�   
�������   	RowHeight$ 26Q�5%         ColumnHeaderHeight$ 32Q�5&         VerticalGridLinesBrush
 �����$��18(�5(      
���   �   CanUserAddRows .     CanUserDeleteRows .     SelectionMode$ Single=�5,         CanUserResizeColumns .  	   
IsReadOnly	 . 
   AutoGenerateColumns
 .     HeadersVisibility$ Column=�50      $
��0,10q�51      ��5       �� *Komore+ �� Mode$ TwoWay=� �� UpdateSourceTrigger$ PropertyChanged=� �� SelectedIndex 5!      �� *CurrentIndex+ �� SelectedItem 5"      �� *SelectedItem+��5#      Z�  � 	Resources 52      =  7System.Windows.Controls.Primitives.DataGridColumnHeader �� BasedOn �� 
TargetType �� Property �� Value��%]   '        7 �� 53      8   "  6Y   .�54      ��  � ��
 ���� 6;   55      56         Columns 58      0  *System.Windows.Controls.DataGridTextColumn  59      ,  &System.Windows.Controls.DataGridColumn   Header$ ID��6-      Width5  /System.Windows.Controls.DataGridLengthConverter$ 30 6N      
Foreground
 �   �   FontSize$ 14Q�6�   1  +System.Windows.Controls.DataGridBoundColumn   Binding 6Z   �� *Id+$ PropertyChanged=�$ TwoWay=�6�     5:      $ Naziv��6-   $	 100 6N   
 �   �$ 14Q�6�    6Z   �� *NazivKomore+$ PropertyChanged=�$ TwoWay=�6�     5;      $ Hladnjaca ID��6-   $	 120 6N   
 �   �$ 14Q�6�    6[   �� *HladnjacaId+$ PropertyChanged=�$ TwoWay=�6�   5=      �� 5?      $��Izmeni��6   $��9��6*   $��0��67   $��	45,5,45,5q�6G   
�������
���   �$��18(�6�   ��6�   �� *ChangeCommand+�� 5@      $��Obrisi��6   $��9��6*   $��1��67   $��	45,5,45,5q�6G   
�������
���   �$��18(�6�   ��6�   �� *DeleteCommand+�� 5G      $��2��6   $��0��6(   $��	45,5,45,5q�65   $��13(�6H   $��Nova Komora��6V   
���   �$��2��6   $��Center=�6�   �� 5I      $��1��6   $��2��6%   $��5q�66   $��Naziv:��6A   
���   �$��13(�6e   �� 5J      -   5         ��Name$ naziv��5J      $��1��6*   $��3��67   $��5q�6H    �� TextWrapping$
 Wrap=�6S   ��6g   �� *NazivKomore+$ PropertyChanged=�$ TwoWay=��� 5L      $��3��6   $��2��6%   $��5q�66   $��Hladnjaca ids:��6A   
���   �$��13(�6m   �� 5M      -   5         ��Name$ hladnjacaID��5M      $��3��61   $��3��6>   $��5q�6O   ��6[   ��  �� Path$ HladnjacaIds� 6�   �� *ChoosenHlID+$ PropertyChanged=��� 5O      $��9��6   $��2��6&   $��2��66   $��5q�6J   
�������
���   �$��18(�6�   ��6U   �� *
BtnContent+��6�   �� *
AddCommand+5Q      5R      5S      5T      