   M S B A M L   `   `   `  ����G  CHladnjacaWPF, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null5clr-namespace:HladnjacaWPF.ViewHladnjacaWPF.View  5      "    HladnjacaWPF.View.KartonView   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      1localclr-namespace:HladnjacaWPF.View     5      .��5	      ]� .+�5
   
   ]� .+�5      �   � ColumnDefinitions  5      �� 5      $��1* �6'   �� 5      $��1* �6'   �� 5      $��1* �6'   �� 5      $��1* �6'    � RowDefinitions 5      �� 5      $��1* �6$   �� 5      $��1* �6$   �� 5      $��1* �6$   �� 5      $��1* �6$   �� 5      $��1* �6$   �� 5      $��1* �6$   �� 5      $��1* �6$   �� 5      $��1* �6$   �� 5      $��1* �6$   �� 5      $��1* �6$   .+�5      �� $��0��6   $��0��6(   $��	45,5,45,5q�65   $��13(�6H   $��Kartoni��6V   $��2��6h   
���   �$��Center=�6�   &   System.Windows.Controls.DataGrid  5       $��0��6m   $��1��6}   $��2��6�   $��8��6�   
�������   	RowHeight$ 26Q�5%         ColumnHeaderHeight$ 32Q�5&         VerticalGridLinesBrush
 �����$��18(�5(      
���   �   CanUserAddRows .     CanUserDeleteRows .     SelectionMode$ Single=�5,         CanUserResizeColumns .  	   
IsReadOnly	 . 
   AutoGenerateColumns
 .     HeadersVisibility$ Column=�50      $
��0,10q�51      ��5       �� *	Kartons+ �� Mode$ TwoWay=� �� UpdateSourceTrigger$ PropertyChanged=� �� SelectedIndex 5!      �� *CurrentIndex+ �� SelectedItem 5"      �� *SelectedItem+��5#      Z�  � 	Resources 52      =  7System.Windows.Controls.Primitives.DataGridColumnHeader �� BasedOn �� 
TargetType �� Property �� Value��%]   '        7 �� 53      8   "  6Y   .�54      ��  � ��
 ���� 6;   55      56         Columns 58      0  *System.Windows.Controls.DataGridTextColumn  59      ,  &System.Windows.Controls.DataGridColumn   Header$ ID��6-      Width5  /System.Windows.Controls.DataGridLengthConverter$ 30 6N      
Foreground
 �   �   FontSize$ 14Q�6�   1  +System.Windows.Controls.DataGridBoundColumn   Binding 6Z   �� *Id+$ PropertyChanged=�$ TwoWay=�6�     5:      $ Vrsta��6-   $	 100 6N   
 �   �$ 14Q�6�    6Z   �� *Vrsta+$ PropertyChanged=�$ TwoWay=�6�     5;      $ Ug ID��6-   $ 60 6N   
 �   �$ 14Q�6�    6Z   �� *
UgovorId+$ PropertyChanged=�$ TwoWay=�6�     5<      $ UK ID��6-   $ 60 6N   
 �   �$ 14Q�6�    6Z   �� *UgovorKlijentId+$ PropertyChanged=�$ TwoWay=�6�     5=      $ UH ID��6-   $ 60 6N   
 �   �$ 14Q�6�    6Z   �� *UgovorHladnjacaId+$ PropertyChanged=�$ TwoWay=�6�   5?      �� 5A      $��Izmeni��6   $��9��6*   $��0��67   $��	45,5,45,5q�6G   
�������
���   �$��18(�6�   ��6�   �� *ChangeCommand+�� 5B      $��Obrisi��6   $��9��6*   $��1��67   $��	45,5,45,5q�6G   
�������
���   �$��18(�6�   ��6�   �� *DeleteCommand+�� 5I      $��2��6   $��0��6(   $��	45,5,45,5q�65   $��13(�6H   $��
Nova Karon��6V   
���   �$��2��6~   $��Center=�6�   �� 5K      $��1��6   $��2��6%   $��5q�66   $��Vrsta:��6A   
���   �$��13(�6e   �� 5L      -   5         ��Name$ vrsta��5L      $��1��6*   $��3��67   $��5q�6H    �� TextWrapping$
 Wrap=�6S   ��6g   �� *Vrsta+$ PropertyChanged=�$ TwoWay=��� 5N      $��3��6   $��2��6%   $��5q�66   $��Ugovor ids:��6A   
���   �$��13(�6j   �� 5O      -   5         ��Name$ ugovorID��5O      $��3��6.   $��3��6;   $��5q�6L   ��6X   ��  �� Path$ 	UgovorIds� 6   �� *ChoosenUgId+$ PropertyChanged=��� 5Q      $��5��6   $��2��6%   $��5q�66   $��Klijent ids:��6A   
���   �$��13(�6k   �� 5R      -   5        $ UgovorKlijentId��5R      $��5��65   $��3��6B   $��5q�6S   ��6_   �� $ 
KlijentIds� 6�   �� *ChoosenKlId+$ PropertyChanged=��� 5T      $��7��6   $��2��6%   $��5q�66   $��Hladnnjaca ids:��6A   
���   �$��13(�6n   �� 5U      -   5        $ UgovorHladnjacaId��5U      $��7��67   $��3��6D   $��5q�6U   ��6a   �� $ HladnjacaIds� 6�   �� *ChoosenHlId+$ PropertyChanged=��� 5W      $��9��6   $��2��6&   $��2��66   $��5q�6J   
�������
���   �$��18(�6�   ��6U   �� *
BtnContent+��6�   �� *
AddCommand+5X      5Y      5Z      5[      