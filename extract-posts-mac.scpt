FasdUAS 1.101.10   ��   ��    k             l     ��  ��    8 2###[WARNING: USE THIS SCRIPT AT YOUR OWN RISK]####     � 	 	 d # # # [ W A R N I N G :   U S E   T H I S   S C R I P T   A T   Y O U R   O W N   R I S K ] # # # #   
  
 l     ��  ��    � �### Although the script is meant to automate scrolling and fetching the HAR file, it is by no means risk-free as it is not tested on every system. ####     �  . # # #   A l t h o u g h   t h e   s c r i p t   i s   m e a n t   t o   a u t o m a t e   s c r o l l i n g   a n d   f e t c h i n g   t h e   H A R   f i l e ,   i t   i s   b y   n o   m e a n s   r i s k - f r e e   a s   i t   i s   n o t   t e s t e d   o n   e v e r y   s y s t e m .   # # # #      l     ��������  ��  ��        l     ��  ��    { u## Before launching this, you need to ensure that you have Google Chrome and a text editor (e.g., Atom) are installed     �   � # #   B e f o r e   l a u n c h i n g   t h i s ,   y o u   n e e d   t o   e n s u r e   t h a t   y o u   h a v e   G o o g l e   C h r o m e   a n d   a   t e x t   e d i t o r   ( e . g . ,   A t o m )   a r e   i n s t a l l e d      l     ��������  ��  ��        l     ��  ��    o i## You also need to configure the below settings, which includes the list of FB URLs you will be scraping     �   � # #   Y o u   a l s o   n e e d   t o   c o n f i g u r e   t h e   b e l o w   s e t t i n g s ,   w h i c h   i n c l u d e s   t h e   l i s t   o f   F B   U R L s   y o u   w i l l   b e   s c r a p i n g      l     ��������  ��  ��         l     �� ! "��   ! � �## It is recommended that you test it one page and take it from there. Also, you need to be logged into your FB account if your URL is private and not accessible directly (e.g., search URLs require being logged in)    " � # #� # #   I t   i s   r e c o m m e n d e d   t h a t   y o u   t e s t   i t   o n e   p a g e   a n d   t a k e   i t   f r o m   t h e r e .   A l s o ,   y o u   n e e d   t o   b e   l o g g e d   i n t o   y o u r   F B   a c c o u n t   i f   y o u r   U R L   i s   p r i v a t e   a n d   n o t   a c c e s s i b l e   d i r e c t l y   ( e . g . ,   s e a r c h   U R L s   r e q u i r e   b e i n g   l o g g e d   i n )    $ % $ l     ��������  ��  ��   %  & ' & l     (���� ( r      ) * ) m      + + � , ,  p y t h o n 3 * o      ���� 0 
pythonpath 
pythonPath��  ��   '  - . - l     ��������  ��  ��   .  / 0 / l     �� 1 2��   1 ) #The name of the Chrome browser used    2 � 3 3 F T h e   n a m e   o f   t h e   C h r o m e   b r o w s e r   u s e d 0  4 5 4 l    6���� 6 r     7 8 7 m     9 9 � : :  G o o g l e   C h r o m e 8 o      ���� 0 browsername BrowserName��  ��   5  ; < ; l     ��������  ��  ��   <  = > = l     �� ? @��   ? ~ xThe local path to the folder where the script is installed. If blank, it assumes the folder where this script is located    @ � A A � T h e   l o c a l   p a t h   t o   t h e   f o l d e r   w h e r e   t h e   s c r i p t   i s   i n s t a l l e d .   I f   b l a n k ,   i t   a s s u m e s   t h e   f o l d e r   w h e r e   t h i s   s c r i p t   i s   l o c a t e d >  B C B l    D���� D r     E F E m    	 G G � H H   F o      ���� "0 fbscraperfolder FBScraperFolder��  ��   C  I J I l     ��������  ��  ��   J  K L K l     �� M N��   MThe local path to the folder where the HAR file (www.facebook.com.har) will be downloaded (the path must end with /). If blank, it assumes the folder where this script is located . Note that this is usually at /Users/<username>/Downloads/ but check your browser settings in case.    N � O O. T h e   l o c a l   p a t h   t o   t h e   f o l d e r   w h e r e   t h e   H A R   f i l e   ( w w w . f a c e b o o k . c o m . h a r )   w i l l   b e   d o w n l o a d e d   ( t h e   p a t h   m u s t   e n d   w i t h   / ) .   I f   b l a n k ,   i t   a s s u m e s   t h e   f o l d e r   w h e r e   t h i s   s c r i p t   i s   l o c a t e d   .   N o t e   t h a t   t h i s   i s   u s u a l l y   a t   / U s e r s / < u s e r n a m e > / D o w n l o a d s /   b u t   c h e c k   y o u r   b r o w s e r   s e t t i n g s   i n   c a s e . L  P Q P l    R���� R r     S T S m     U U � V V   T o      ����  0 downloadfolder DownloadFolder��  ��   Q  W X W l     ��������  ��  ��   X  Y Z Y l     �� [ \��   [List of other URLs, such accessed via https://facebook.com, including pages, groups, searches, etc. examples: https://www.facebook.com/cnn for the CNN page, https://www.facebook.com/search/top?q=crypto for searching for the keyword 'crypto', https://www.facebook.com/groups/565383300477194 for the group with the ID (565383300477194). If using multiple values, use commas to separate them, e.g., {"https://www.facebook.com/cnn","https://www.facebook.com/search/top?q=crypto","https://www.facebook.com/groups/565383300477194"}    \ � ] ] L i s t   o f   o t h e r   U R L s ,   s u c h   a c c e s s e d   v i a   h t t p s : / / f a c e b o o k . c o m ,   i n c l u d i n g   p a g e s ,   g r o u p s ,   s e a r c h e s ,   e t c .   e x a m p l e s :   h t t p s : / / w w w . f a c e b o o k . c o m / c n n   f o r   t h e   C N N   p a g e ,   h t t p s : / / w w w . f a c e b o o k . c o m / s e a r c h / t o p ? q = c r y p t o   f o r   s e a r c h i n g   f o r   t h e   k e y w o r d   ' c r y p t o ' ,   h t t p s : / / w w w . f a c e b o o k . c o m / g r o u p s / 5 6 5 3 8 3 3 0 0 4 7 7 1 9 4   f o r   t h e   g r o u p   w i t h   t h e   I D   ( 5 6 5 3 8 3 3 0 0 4 7 7 1 9 4 ) .   I f   u s i n g   m u l t i p l e   v a l u e s ,   u s e   c o m m a s   t o   s e p a r a t e   t h e m ,   e . g . ,   { " h t t p s : / / w w w . f a c e b o o k . c o m / c n n " , " h t t p s : / / w w w . f a c e b o o k . c o m / s e a r c h / t o p ? q = c r y p t o " , " h t t p s : / / w w w . f a c e b o o k . c o m / g r o u p s / 5 6 5 3 8 3 3 0 0 4 7 7 1 9 4 " } Z  ^ _ ^ l     ��������  ��  ��   _  ` a ` l    b c d b r     e f e J     g g  h i h m     j j � k k 8 h t t p s : / / w w w . f a c e b o o k . c o m / c n n i  l m l m     n n � o o X h t t p s : / / w w w . f a c e b o o k . c o m / s e a r c h / t o p ? q = c r y p t o m  p�� p m     q q � r r ^ h t t p s : / / w w w . f a c e b o o k . c o m / g r o u p s / 5 6 5 3 8 3 3 0 0 4 7 7 1 9 4��   f o      ���� 0 urls URLs c 
 {""}    d � s s  { " " } a  t u t l     ��������  ��  ��   u  v w v l     �� x y��   x � �How many flips (each usually contains between 5 to 10 posts) each link will need (min 5 recommended, no max but may take a while to load)    y � z z H o w   m a n y   f l i p s   ( e a c h   u s u a l l y   c o n t a i n s   b e t w e e n   5   t o   1 0   p o s t s )   e a c h   l i n k   w i l l   n e e d   ( m i n   5   r e c o m m e n d e d ,   n o   m a x   b u t   m a y   t a k e   a   w h i l e   t o   l o a d ) w  { | { l    }���� } r     ~  ~ m    ���� 
  o      ���� 0 
page_flips  ��  ��   |  � � � l     ��������  ��  ��   �  � � � l     �� � ���   � c ]Time (in seconds) allowed for each page flip to load (depends on Internet and computer speed)    � � � � � T i m e   ( i n   s e c o n d s )   a l l o w e d   f o r   e a c h   p a g e   f l i p   t o   l o a d   ( d e p e n d s   o n   I n t e r n e t   a n d   c o m p u t e r   s p e e d ) �  � � � l     ��������  ��  ��   �  � � � l    ����� � r     � � � m    ����  � o      ���� 0 page_loading_time  ��  ��   �  � � � l     ��������  ��  ��   �  � � � l    6 ����� � O     6 � � � r   $ 5 � � � c   $ 1 � � � n   $ - � � � m   ) -��
�� 
ctnr � l  $ ) ����� � I  $ )�� ���
�� .earsffdralis        afdr �  f   $ %��  ��  ��   � m   - 0��
�� 
alis � o      ���� 0 
currentdir 
currentDir � m     ! � ��                                                                                  MACS  alis    ,  HD                             BD ����
Finder.app                                                     ����            ����  
 cu             CoreServices  )/:System:Library:CoreServices:Finder.app/    
 F i n d e r . a p p    H D  &System/Library/CoreServices/Finder.app  / ��  ��  ��   �  � � � l     ��������  ��  ��   �  � � � l  7 B ����� � r   7 B � � � n   7 > � � � 1   : >��
�� 
psxp � o   7 :���� 0 
currentdir 
currentDir � o      ���� 0 p  ��  ��   �  � � � l     ��������  ��  ��   �  � � � l  C T ����� � Z   C T � ����� � =   C H � � � o   C D���� "0 fbscraperfolder FBScraperFolder � m   D G � � � � �   � r   K P � � � o   K N���� 0 p   � o      ���� "0 fbscraperfolder FBScraperFolder��  ��  ��  ��   �  � � � l     �� � ���   � . (replace_chars(FBScraperFolder, "HD", "")    � � � � P r e p l a c e _ c h a r s ( F B S c r a p e r F o l d e r ,   " H D " ,   " " ) �  � � � l     �� � ���   � . (replace_chars(FBScraperFolder, ":", "/")    � � � � P r e p l a c e _ c h a r s ( F B S c r a p e r F o l d e r ,   " : " ,   " / " ) �  � � � l     ��������  ��  ��   �  � � � l  U f ����� � Z   U f � ����� � =   U Z � � � o   U V����  0 downloadfolder DownloadFolder � m   V Y � � � � �   � r   ] b � � � o   ] `���� 0 p   � o      ���� "0 fbscraperfolder FBScraperFolder��  ��  ��  ��   �  � � � l     ��������  ��  ��   �  � � � l     ��������  ��  ��   �  � � � l  g� ����� � X   g� ��� � � k   {� � �  � � � l  { {�� � ���   � 3 -	error number -128	 #(for debugging purposes)    � � � � Z 	 e r r o r   n u m b e r   - 1 2 8 	   # ( f o r   d e b u g g i n g   p u r p o s e s ) �  � � � r   { � � � � m   { |����   � o      ���� 0 i   �  � � � r   � � � � � [   � � � � � o   � ����� 0 i   � m   � �����  � o      ���� 0 i   �  � � � r   � � � � � o   � ����� 0 u   � o      �� 0 
currentsrc 
CurrentSrc �  � � � O   �� � � � k   �� � �  � � � I  � ��~�}�|
�~ .aevtrappnull��� ��� null�}  �|   �  � � � I  � ��{�z�y
�{ .miscactvnull��� ��� null�z  �y   �  � � � I  � ��x ��w
�x .sysodelanull��� ��� nmbr � o   � ��v�v 0 page_loading_time  �w   �  � � � I  � ��u ��t
�u .ascrcmnt****      � **** � b   � � � � � b   � � � � � o   � ��s�s 0 i   � m   � � � � � � �    � o   � ��r�r 0 
currentsrc 
CurrentSrc�t   �  � � � I  � ��q ��p
�q .GURLGURLnull��� ��� TEXT � o   � ��o�o 0 
currentsrc 
CurrentSrc�p   �    I  � ��n�m
�n .sysodelanull��� ��� nmbr m   � ��l�l �m    O  � � I  � ��k
�k .prcskcodnull���     **** m   � ��j�j " �i	�h
�i 
faal	 J   � �

  m   � ��g
�g eMdsKopt �f m   � ��e
�e eMdsKcmd�f  �h   m   � ��                                                                                  sevs  alis    H  HD                             BD ����System Events.app                                              ����            ����  
 cu             CoreServices  0/:System:Library:CoreServices:System Events.app/  $  S y s t e m   E v e n t s . a p p    H D  -System/Library/CoreServices/System Events.app   / ��    I  � ��d�c
�d .sysodelanull��� ��� nmbr m   � � ?�      �c    O  � I  ��b
�b .prcskcodnull���     **** m   � ��a�a % �`�_
�` 
faal J   � � �^ m   � ��]
�] eMdsKcmd�^  �_   m   � ��                                                                                  sevs  alis    H  HD                             BD ����System Events.app                                              ����            ����  
 cu             CoreServices  0/:System:Library:CoreServices:System Events.app/  $  S y s t e m   E v e n t s . a p p    H D  -System/Library/CoreServices/System Events.app   / ��    I 
�\�[
�\ .sysodelanull��� ��� nmbr m     ?�      �[   !"! O #$# I �Z%�Y
�Z .prcskcodnull���     ****% m  �X�X 5�Y  $ m  &&�                                                                                  sevs  alis    H  HD                             BD ����System Events.app                                              ����            ����  
 cu             CoreServices  0/:System:Library:CoreServices:System Events.app/  $  S y s t e m   E v e n t s . a p p    H D  -System/Library/CoreServices/System Events.app   / ��  " '(' I !�W)�V
�W .sysodelanull��� ��� nmbr) m  ** ?�      �V  ( +,+ O ";-.- I (:�U/0
�U .prcskcodnull���     ****/ m  (+�T�T 0 �S1�R
�S 
faal1 J  .622 343 m  .1�Q
�Q eMdsKsft4 5�P5 m  14�O
�O eMdsKcmd�P  �R  . m  "%66�                                                                                  sevs  alis    H  HD                             BD ����System Events.app                                              ����            ����  
 cu             CoreServices  0/:System:Library:CoreServices:System Events.app/  $  S y s t e m   E v e n t s . a p p    H D  -System/Library/CoreServices/System Events.app   / ��  , 787 I <C�N9�M
�N .sysodelanull��� ��� nmbr9 m  <?�L�L �M  8 :;: l DD�K�J�I�K  �J  �I  ; <=< O DZ>?> I JY�H@A
�H .prcskcodnull���     ****@ m  JM�G�G A �FB�E
�F 
faalB J  PUCC D�DD m  PS�C
�C eMdsKcmd�D  �E  ? m  DGEE�                                                                                  sevs  alis    H  HD                             BD ����System Events.app                                              ����            ����  
 cu             CoreServices  0/:System:Library:CoreServices:System Events.app/  $  S y s t e m   E v e n t s . a p p    H D  -System/Library/CoreServices/System Events.app   / ��  = FGF U  [HIH O dzJKJ I jy�BLM
�B .prcskcodnull���     ****L m  jm�A�A M �@N�?
�@ 
faalN J  puOO P�>P m  ps�=
�= eMdsKcmd�>  �?  K m  dgQQ�                                                                                  sevs  alis    H  HD                             BD ����System Events.app                                              ����            ����  
 cu             CoreServices  0/:System:Library:CoreServices:System Events.app/  $  S y s t e m   E v e n t s . a p p    H D  -System/Library/CoreServices/System Events.app   / ��  I m  ^a�<�< G RSR U  ��TUT k  ��VV WXW O ��YZY I ���;[\
�; .prcskcodnull���     ****[ m  ���:�: }\ �9]�8
�9 
faal] m  ���7
�7 eMdsKcmd�8  Z m  ��^^�                                                                                  sevs  alis    H  HD                             BD ����System Events.app                                              ����            ����  
 cu             CoreServices  0/:System:Library:CoreServices:System Events.app/  $  S y s t e m   E v e n t s . a p p    H D  -System/Library/CoreServices/System Events.app   / ��  X _�6_ I ���5`�4
�5 .sysodelanull��� ��� nmbr` o  ���3�3 0 page_loading_time  �4  �6  U o  ���2�2 0 
page_flips  S aba O ��cdc I ���1ef
�1 .prcskcodnull���     ****e m  ���0�0 f �/g�.
�/ 
faalg J  ��hh i�-i m  ���,
�, eMdsKcmd�-  �.  d m  ��jj�                                                                                  sevs  alis    H  HD                             BD ����System Events.app                                              ����            ����  
 cu             CoreServices  0/:System:Library:CoreServices:System Events.app/  $  S y s t e m   E v e n t s . a p p    H D  -System/Library/CoreServices/System Events.app   / ��  b klk I ���+m�*
�+ .sysodelanull��� ��� nmbrm m  ���)�) �*  l non O ��pqp I ���(rs
�( .prcskcodnull���     ****r m  ���'�' }s �&t�%
�& 
faalt J  ��uu vwv m  ���$
�$ eMdsKoptw x�#x m  ���"
�" eMdsKcmd�#  �%  q m  ��yy�                                                                                  sevs  alis    H  HD                             BD ����System Events.app                                              ����            ����  
 cu             CoreServices  0/:System:Library:CoreServices:System Events.app/  $  S y s t e m   E v e n t s . a p p    H D  -System/Library/CoreServices/System Events.app   / ��  o z{z I ���!|� 
�! .sysodelanull��� ��� nmbr| m  ���� �   { }~} O ��� I �����
� .prcskcodnull���     ****� m  ���� #� ���
� 
faal� J  ���� ��� m  ���
� eMdsKsft� ��� m  ���
� eMdsKcmd�  �  � m  �����                                                                                  sevs  alis    H  HD                             BD ����System Events.app                                              ����            ����  
 cu             CoreServices  0/:System:Library:CoreServices:System Events.app/  $  S y s t e m   E v e n t s . a p p    H D  -System/Library/CoreServices/System Events.app   / ��  ~ ��� I  ���
� .sysodelanull��� ��� nmbr� m   �� ?�      �  � ��� O ��� I ���
� .prcskprsnull���     ctxt� m  �� ���  N e t w o r k�  � m  ���                                                                                  sevs  alis    H  HD                             BD ����System Events.app                                              ����            ����  
 cu             CoreServices  0/:System:Library:CoreServices:System Events.app/  $  S y s t e m   E v e n t s . a p p    H D  -System/Library/CoreServices/System Events.app   / ��  � ��� I ���
� .sysodelanull��� ��� nmbr� m  �� ?�      �  � ��� O -��� I %,���
� .prcskcodnull���     ****� m  %(�� $�  � m  "���                                                                                  sevs  alis    H  HD                             BD ����System Events.app                                              ����            ����  
 cu             CoreServices  0/:System:Library:CoreServices:System Events.app/  $  S y s t e m   E v e n t s . a p p    H D  -System/Library/CoreServices/System Events.app   / ��  � ��� I .5���
� .sysodelanull��� ��� nmbr� m  .1�� ?�      �  � ��� O 6J��� I <I���
� .prcskcodnull���     ****� m  <=�� � �
��	
�
 
faal� J  @E�� ��� m  @C�
� eMdsKcmd�  �	  � m  69���                                                                                  sevs  alis    H  HD                             BD ����System Events.app                                              ����            ����  
 cu             CoreServices  0/:System:Library:CoreServices:System Events.app/  $  S y s t e m   E v e n t s . a p p    H D  -System/Library/CoreServices/System Events.app   / ��  � ��� I KR���
� .sysodelanull��� ��� nmbr� m  KN�� ?�      �  � ��� U  Sw��� k  \r�� ��� O \j��� I bi���
� .prcskcodnull���     ****� m  be�� 0�  � m  \_���                                                                                  sevs  alis    H  HD                             BD ����System Events.app                                              ����            ����  
 cu             CoreServices  0/:System:Library:CoreServices:System Events.app/  $  S y s t e m   E v e n t s . a p p    H D  -System/Library/CoreServices/System Events.app   / ��  � ��� I kr� ���
�  .sysodelanull��� ��� nmbr� m  kn�� ?���������  �  � m  VY���� � ��� O x���� I ~������
�� .prcskcodnull���     ****� m  ~����� $��  � m  x{���                                                                                  sevs  alis    H  HD                             BD ����System Events.app                                              ����            ����  
 cu             CoreServices  0/:System:Library:CoreServices:System Events.app/  $  S y s t e m   E v e n t s . a p p    H D  -System/Library/CoreServices/System Events.app   / ��  � ��� I �������
�� .sysodelanull��� ��� nmbr� m  ���� ?�      ��  � ��� O ����� I �������
�� .prcskcodnull���     ****� m  ������ $��  � m  �����                                                                                  sevs  alis    H  HD                             BD ����System Events.app                                              ����            ����  
 cu             CoreServices  0/:System:Library:CoreServices:System Events.app/  $  S y s t e m   E v e n t s . a p p    H D  -System/Library/CoreServices/System Events.app   / ��  � ��� I �������
�� .sysodelanull��� ��� nmbr� m  ���� ?�      ��  � ��� O ����� I ������
�� .prcskcodnull���     ****� m  ������ � �����
�� 
faal� J  ���� ���� m  ����
�� eMdsKcmd��  ��  � m  �����                                                                                  sevs  alis    H  HD                             BD ����System Events.app                                              ����            ����  
 cu             CoreServices  0/:System:Library:CoreServices:System Events.app/  $  S y s t e m   E v e n t s . a p p    H D  -System/Library/CoreServices/System Events.app   / ��  � ���� I �������
�� .sysodelanull��� ��� nmbr� m  ���� ?�      ��  ��   � 4   � ����
�� 
capp� o   � ����� 0 browsername BrowserName � ��� I �������
�� .ascrcmnt****      � ****� m  ���� ��� �         C a l l i n g   p y t h o n   s c r i p t   t o   p a r s e   H A R   f i l e   a n d   c r e a t e   t h e   C S V   f i l e��  � ���� O  ����� k  ���� ��� I ��������
�� .aevtrappnull��� ��� null��  ��  � ��� I ��������
�� .miscactvnull��� ��� null��  ��  � ��� I �������
�� .sysodelanull��� ��� nmbr� m  ������ ��  � ��� O ����� I ������
�� .prcskcodnull���     ****� m  ������ � �����
�� 
faal� J  ���� ���� m  ����
�� eMdsKcmd��  ��  � m  �����                                                                                  sevs  alis    H  HD                             BD ����System Events.app                                              ����            ����  
 cu             CoreServices  0/:System:Library:CoreServices:System Events.app/  $  S y s t e m   E v e n t s . a p p    H D  -System/Library/CoreServices/System Events.app   / ��  � ��� I ������
�� .sysodelanull��� ��� nmbr� m  ������ ��  � ��� O    I 	����
�� .prcskcodnull���     **** m  	���� $��   m  �                                                                                  sevs  alis    H  HD                             BD ����System Events.app                                              ����            ����  
 cu             CoreServices  0/:System:Library:CoreServices:System Events.app/  $  S y s t e m   E v e n t s . a p p    H D  -System/Library/CoreServices/System Events.app   / ��  �  O " I !����
�� .prcskprsnull���     ctxt b  	
	 m   �  c d  
 o  ���� "0 fbscraperfolder FBScraperFolder��   m  �                                                                                  sevs  alis    H  HD                             BD ����System Events.app                                              ����            ����  
 cu             CoreServices  0/:System:Library:CoreServices:System Events.app/  $  S y s t e m   E v e n t s . a p p    H D  -System/Library/CoreServices/System Events.app   / ��    O #1 I )0����
�� .prcskcodnull���     **** m  ),���� $��   m  #&�                                                                                  sevs  alis    H  HD                             BD ����System Events.app                                              ����            ����  
 cu             CoreServices  0/:System:Library:CoreServices:System Events.app/  $  S y s t e m   E v e n t s . a p p    H D  -System/Library/CoreServices/System Events.app   / ��    I 29����
�� .sysodelanull��� ��� nmbr m  25 ?�      ��    O :P I @O����
�� .prcskprsnull���     ctxt b  @K b  @G  b  @E!"! o  @A���� 0 
pythonpath 
pythonPath" m  AD## �$$    f b s c r a p e r . p y    o  EF����  0 downloadfolder DownloadFolder m  GJ%% �&& ( w w w . f a c e b o o k . c o m . h a r��   m  :=''�                                                                                  sevs  alis    H  HD                             BD ����System Events.app                                              ����            ����  
 cu             CoreServices  0/:System:Library:CoreServices:System Events.app/  $  S y s t e m   E v e n t s . a p p    H D  -System/Library/CoreServices/System Events.app   / ��   ()( I QX��*��
�� .sysodelanull��� ��� nmbr* m  QT++ ?�      ��  ) ,-, O Yg./. I _f��0��
�� .prcskcodnull���     ****0 m  _b���� $��  / m  Y\11�                                                                                  sevs  alis    H  HD                             BD ����System Events.app                                              ����            ����  
 cu             CoreServices  0/:System:Library:CoreServices:System Events.app/  $  S y s t e m   E v e n t s . a p p    H D  -System/Library/CoreServices/System Events.app   / ��  - 232 l hm4564 I hm��7��
�� .sysodelanull��� ��� nmbr7 m  hi���� 
��  5 : 4this value can be increased if you loaded many pages   6 �88 h t h i s   v a l u e   c a n   b e   i n c r e a s e d   i f   y o u   l o a d e d   m a n y   p a g e s3 9:9 O n�;<; I t���=>
�� .prcskcodnull���     ****= m  tw���� > ��?��
�� 
faal? J  z@@ A��A m  z}��
�� eMdsKcmd��  ��  < m  nqBB�                                                                                  sevs  alis    H  HD                             BD ����System Events.app                                              ����            ����  
 cu             CoreServices  0/:System:Library:CoreServices:System Events.app/  $  S y s t e m   E v e n t s . a p p    H D  -System/Library/CoreServices/System Events.app   / ��  : C��C I ����D��
�� .sysodelanull��� ��� nmbrD m  ������ ��  ��  � m  ��EE�                                                                                      @ alis    6  HD                             BD ����Terminal.app                                                   ����            ����  
 cu             	Utilities   -/:System:Applications:Utilities:Terminal.app/     T e r m i n a l . a p p    H D  *System/Applications/Utilities/Terminal.app  / ��  ��  �� 0 u   � o   j k���� 0 urls URLs��  ��   � FGF l     ��������  ��  ��  G HIH i     JKJ I      ��L���� 0 replace_chars  L MNM o      ���� 0 	this_text  N OPO o      ���� 0 search_string  P Q��Q o      ���� 0 replacement_string  ��  ��  K k      RR STS r     UVU l    W����W o     ���� 0 search_string  ��  ��  V n     XYX 1    ��
�� 
txdlY 1    ��
�� 
ascrT Z[Z r    \]\ n    	^_^ 2    	��
�� 
citm_ o    ���� 0 	this_text  ] l     `����` o      ���� 0 	item_list  ��  ��  [ aba r    cdc l   e����e o    ���� 0 replacement_string  ��  ��  d n     fgf 1    ��
�� 
txdlg 1    ��
�� 
ascrb hih r    jkj c    lml l   n����n o    ���� 0 	item_list  ��  ��  m m    ��
�� 
TEXTk o      ���� 0 	this_text  i opo r    qrq m    ss �tt  r n     uvu 1    ��
�� 
txdlv 1    ��
�� 
ascrp w��w L     xx o    ���� 0 	this_text  ��  I y��y l     ��������  ��  ��  ��       ��z{|��  z ������ 0 replace_chars  
�� .aevtoappnull  �   � ****{ ��K����}~���� 0 replace_chars  �� ����   �������� 0 	this_text  �� 0 search_string  �� 0 replacement_string  ��  } ������~�� 0 	this_text  �� 0 search_string  � 0 replacement_string  �~ 0 	item_list  ~ �}�|�{�zs
�} 
ascr
�| 
txdl
�{ 
citm
�z 
TEXT�� !���,FO��-E�O���,FO��&E�O���,FO�| �y��x�w���v
�y .aevtoappnull  �   � ****� k    ���  &��  4��  B��  P��  `��  {��  ���  ���  ���  ���  ���  ��u�u  �x  �w  � �t�t 0 u  � C +�s 9�r G�q U�p j n q�o�n�m�l ��k�j�i�h�g�f � ��e�d�c�b�a�`�_�^�] ��\�[�Z�Y�X�W�V�U�T�S�R�Q�P�O�N�M�L�K��J�I�H�G��E�F#%�E�s 0 
pythonpath 
pythonPath�r 0 browsername BrowserName�q "0 fbscraperfolder FBScraperFolder�p  0 downloadfolder DownloadFolder�o 0 urls URLs�n 
�m 0 
page_flips  �l 0 page_loading_time  
�k .earsffdralis        afdr
�j 
ctnr
�i 
alis�h 0 
currentdir 
currentDir
�g 
psxp�f 0 p  
�e 
kocl
�d 
cobj
�c .corecnte****       ****�b 0 i  �a 0 
currentsrc 
CurrentSrc
�` 
capp
�_ .aevtrappnull��� ��� null
�^ .miscactvnull��� ��� null
�] .sysodelanull��� ��� nmbr
�\ .ascrcmnt****      � ****
�[ .GURLGURLnull��� ��� TEXT�Z "
�Y 
faal
�X eMdsKopt
�W eMdsKcmd
�V .prcskcodnull���     ****�U %�T 5�S 
�R eMdsKsft�Q �P �O �N �M }�L �K #
�J .prcskprsnull���     ctxt�I $�H �G 0�F �E �v��E�O�E�O�E�O�E�O���mvE�O�E�OkE�O� )j a ,a &E` UO_ a ,E` O�a   
_ E�Y hO�a   
_ E�Y hO(�[a a l kh  jE` O_ kE` O�E` O*a �/,*j O*j O�j  O_ a !%_ %j "O_ j #Olj  Oa $ a %a &a 'a (lvl )UOa *j  Oa $ a +a &a (kvl )UOa *j  Oa $ 	a ,j )UOa *j  Oa $ a -a &a .a (lvl )UOa /j  Oa $ a 0a &a (kvl )UO #a 1kha $ a 2a &a (kvl )U[OY��O %�kha $ a 3a &a (l )UO�j  [OY��Oa $ a 0a &a (kvl )UOa 4j  Oa $ a 3a &a 'a (lvl )UOlj  Oa $ a 5a &a .a (lvl )UOa *j  Oa $ 	a 6j 7UOa *j  Oa $ 	a 8j )UOa *j  Oa $ ma &a (kvl )UOa *j  O #a 9kha $ 	a :j )UOa ;j  [OY��Oa $ 	a 8j )UOa *j  Oa $ 	a 8j )UOa *j  Oa $ a -a &a (kvl )UOa *j  UOa <j "Oa = �*j O*j Omj  Oa $ a >a &a (kvl )UOlj  Oa $ 	a 8j )UOa $ a ?�%j 7UOa $ 	a 8j )UOa *j  Oa $ �a @%�%a A%j 7UOa *j  Oa $ 	a 8j )UO�j  Oa $ a Ba &a (kvl )UOlj  U[OY�� ascr  ��ޭ