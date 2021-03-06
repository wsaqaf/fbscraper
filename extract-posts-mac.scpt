FasdUAS 1.101.10   ��   ��    k             l     ��  ��    { u## Before launching this, you need to ensure that you have Google Chrome and a text editor (e.g., Atom) are installed     � 	 	 � # #   B e f o r e   l a u n c h i n g   t h i s ,   y o u   n e e d   t o   e n s u r e   t h a t   y o u   h a v e   G o o g l e   C h r o m e   a n d   a   t e x t   e d i t o r   ( e . g . ,   A t o m )   a r e   i n s t a l l e d   
  
 l     ��  ��    x r## You also need to configure the below settings, which includes the list of pages and groups you will be scraping     �   � # #   Y o u   a l s o   n e e d   t o   c o n f i g u r e   t h e   b e l o w   s e t t i n g s ,   w h i c h   i n c l u d e s   t h e   l i s t   o f   p a g e s   a n d   g r o u p s   y o u   w i l l   b e   s c r a p i n g      l     ��������  ��  ��        l     ��  ��    ) #The name of the Chrome browser used     �   F T h e   n a m e   o f   t h e   C h r o m e   b r o w s e r   u s e d      l         r         m        �    G o o g l e   C h r o m e  o      ���� 0 browsername BrowserName    Change if necessary     �   (   C h a n g e   i f   n e c e s s a r y     !   l     ��������  ��  ��   !  " # " l     �� $ %��   $ C =The absolute link to the folder where the script is installed    % � & & z T h e   a b s o l u t e   l i n k   t o   t h e   f o l d e r   w h e r e   t h e   s c r i p t   i s   i n s t a l l e d #  ' ( ' l    ) * + ) r     , - , m     . . � / /   - o      ���� "0 fbscraperfolder FBScraperFolder * 0 * Example: "/Users/user/desktop/fbscraper/"    + � 0 0 T   E x a m p l e :   " / U s e r s / u s e r / d e s k t o p / f b s c r a p e r / " (  1 2 1 l     ��������  ��  ��   2  3 4 3 l     �� 5 6��   5 F @List of groups, accessed via https://facebook.com/groups/<group>    6 � 7 7 � L i s t   o f   g r o u p s ,   a c c e s s e d   v i a   h t t p s : / / f a c e b o o k . c o m / g r o u p s / < g r o u p > 4  8 9 8 l    : ; < : r     = > = J    
����   > o      ���� 0 grps Grps ; #  Example: {"903238076398113"}    < � ? ? :   E x a m p l e :   { " 9 0 3 2 3 8 0 7 6 3 9 8 1 1 3 " } 9  @ A @ l     ��������  ��  ��   A  B C B l     �� D E��   D = 7List of pages, accessed via https://facebook.com/<page>    E � F F n L i s t   o f   p a g e s ,   a c c e s s e d   v i a   h t t p s : / / f a c e b o o k . c o m / < p a g e > C  G H G l    I J K I r     L M L J    ����   M o      ���� 
0 pgs Pgs J + % Example: {"svenskadagbladet", "svt"}    K � N N J   E x a m p l e :   { " s v e n s k a d a g b l a d e t " ,   " s v t " } H  O P O l     ��������  ��  ��   P  Q R Q l     �� S T��   S O IHow many flips (each usually contains 20 posts) each page/group will need    T � U U � H o w   m a n y   f l i p s   ( e a c h   u s u a l l y   c o n t a i n s   2 0   p o s t s )   e a c h   p a g e / g r o u p   w i l l   n e e d R  V W V l    X���� X r     Y Z Y m    ����  Z o      ���� 0 
page_flips  ��  ��   W  [ \ [ l     ��������  ��  ��   \  ] ^ ] l     �� _ `��   _ V PTime allowed for each page flip to load (depends on Internet and computer speed)    ` � a a � T i m e   a l l o w e d   f o r   e a c h   p a g e   f l i p   t o   l o a d   ( d e p e n d s   o n   I n t e r n e t   a n d   c o m p u t e r   s p e e d ) ^  b c b l    d���� d r     e f e m    ����  f o      ���� 0 page_loading_time  ��  ��   c  g h g l     ��������  ��  ��   h  i j i l     �� k l��   k L FSet to false if you do not want to open a tab with the scraped entries    l � m m � S e t   t o   f a l s e   i f   y o u   d o   n o t   w a n t   t o   o p e n   a   t a b   w i t h   t h e   s c r a p e d   e n t r i e s j  n o n l    p���� p r     q r q m    ��
�� boovtrue r o      ���� 0 show_scraped_html  ��  ��   o  s t s l     ��������  ��  ��   t  u v u l     �� w x��   w S MSet to false if you do not want to hear audio when each page/group is fetched    x � y y � S e t   t o   f a l s e   i f   y o u   d o   n o t   w a n t   t o   h e a r   a u d i o   w h e n   e a c h   p a g e / g r o u p   i s   f e t c h e d v  z { z l   ! |���� | r    ! } ~ } m    ��
�� boovfals ~ o      ���� 0 audio_notification  ��  ��   {   �  l     ��������  ��  ��   �  � � � l  " ( ����� � r   " ( � � � J   " & � �  � � � m   " # � � � � � 
 g r u p p �  ��� � m   # $ � � � � �  s i d a��   � o      ���� 0 s_types  ��  ��   �  � � � l     ��������  ��  ��   �  � � � l     �� � ���   � { u## Before launching this, you need to ensure that you have Google Chrome and a text editor (e.g., Atom) are installed    � � � � � # #   B e f o r e   l a u n c h i n g   t h i s ,   y o u   n e e d   t o   e n s u r e   t h a t   y o u   h a v e   G o o g l e   C h r o m e   a n d   a   t e x t   e d i t o r   ( e . g . ,   A t o m )   a r e   i n s t a l l e d �  � � � l     �� � ���   � x r## You also need to configure the below settings, which includes the list of pages and groups you will be scraping    � � � � � # #   Y o u   a l s o   n e e d   t o   c o n f i g u r e   t h e   b e l o w   s e t t i n g s ,   w h i c h   i n c l u d e s   t h e   l i s t   o f   p a g e s   a n d   g r o u p s   y o u   w i l l   b e   s c r a p i n g �  � � � l     ��������  ��  ��   �  � � � l     �� � ���   � ) #The name of the Chrome browser used    � � � � F T h e   n a m e   o f   t h e   C h r o m e   b r o w s e r   u s e d �  � � � l  ) , ����� � r   ) , � � � m   ) * � � � � �  G o o g l e   C h r o m e   2 � o      ���� 0 browsername BrowserName��  ��   �  � � � l     ��������  ��  ��   �  � � � l     �� � ���   � C =The absolute link to the folder where the script is installed    � � � � z T h e   a b s o l u t e   l i n k   t o   t h e   f o l d e r   w h e r e   t h e   s c r i p t   i s   i n s t a l l e d �  � � � l  - 0 ����� � r   - 0 � � � m   - . � � � � � D / U s e r s / w a l i d / d e s k t o p / S H / f b s c r a p e r / � o      ���� "0 fbscraperfolder FBScraperFolder��  ��   �  � � � l     ��������  ��  ��   �  � � � l     �� � ���   � F @List of groups, accessed via https://facebook.com/groups/<group>    � � � � � L i s t   o f   g r o u p s ,   a c c e s s e d   v i a   h t t p s : / / f a c e b o o k . c o m / g r o u p s / < g r o u p > �  � � � l     �� � ���   �  set Grps to {}    � � � �  s e t   G r p s   t o   { } �  � � � l  1 8 ����� � r   1 8 � � � J   1 6 � �  ��� � m   1 4 � � � � �  9 0 3 2 3 8 0 7 6 3 9 8 1 1 3��   � o      ���� 0 grps Grps��  ��   �  � � � l     ��������  ��  ��   �  � � � l     �� � ���   � = 7List of pages, accessed via https://facebook.com/<page>    � � � � n L i s t   o f   p a g e s ,   a c c e s s e d   v i a   h t t p s : / / f a c e b o o k . c o m / < p a g e > �  � � � l  9 @ ����� � r   9 @ � � � J   9 > � �  ��� � m   9 < � � � � �   s v e n s k a d a g b l a d e t��   � o      ���� 
0 pgs Pgs��  ��   �  � � � l     �� � ���   � 7 1set Pgs to {"HuddingeDirekt", "svenskadagbladet"}    � � � � b s e t   P g s   t o   { " H u d d i n g e D i r e k t " ,   " s v e n s k a d a g b l a d e t " } �  � � � l     ��������  ��  ��   �  � � � l     �� � ���   � O IHow many flips (each usually contains 20 posts) each page/group will need    � � � � � H o w   m a n y   f l i p s   ( e a c h   u s u a l l y   c o n t a i n s   2 0   p o s t s )   e a c h   p a g e / g r o u p   w i l l   n e e d �  � � � l  A F ����� � r   A F � � � m   A D���� 
 � o      ���� 0 
page_flips  ��  ��   �  � � � l     ��������  ��  ��   �  � � � l     �� � ���   � V PTime allowed for each page flip to load (depends on Internet and computer speed)    � � � � � T i m e   a l l o w e d   f o r   e a c h   p a g e   f l i p   t o   l o a d   ( d e p e n d s   o n   I n t e r n e t   a n d   c o m p u t e r   s p e e d ) �  � � � l  G J ����� � r   G J � � � m   G H����  � o      ���� 0 page_loading_time  ��  ��   �  � � � l     ��������  ��  ��   �  � � � l     �� � ���   � L FSet to false if you do not want to open a tab with the scraped entries    � � � � � S e t   t o   f a l s e   i f   y o u   d o   n o t   w a n t   t o   o p e n   a   t a b   w i t h   t h e   s c r a p e d   e n t r i e s �  �  � l  K N���� r   K N m   K L��
�� boovtrue o      ���� 0 show_scraped_html  ��  ��     l     ��������  ��  ��    l     �	�   S MSet to false if you do not want to hear audio when each page/group is fetched   	 �

 � S e t   t o   f a l s e   i f   y o u   d o   n o t   w a n t   t o   h e a r   a u d i o   w h e n   e a c h   p a g e / g r o u p   i s   f e t c h e d  l  O R�~�} r   O R m   O P�|
�| boovtrue o      �{�{ 0 audio_notification  �~  �}    l     �z�y�x�z  �y  �x    l  S ]�w�v r   S ] J   S [  m   S V � 
 g r u p p �u m   V Y �  s i d a�u   o      �t�t 0 s_types  �w  �v     l     �s�r�q�s  �r  �q    !"! l  ^�#�p�o# X   ^�$�n%$ k   r�&& '(' r   r w)*) m   r s�m�m  * o      �l�l 0 i  ( +,+ Z   x �-.�k/- l  x �0�j�i0 =  x �121 n   x }343 1   y }�h
�h 
pcnt4 o   x y�g�g 	0 stype  2 m   } �55 �66 
 g r u p p�j  �i  . k   � �77 898 r   � �:;: o   � ��f�f 0 grps Grps; o      �e�e 0 src  9 <�d< r   � �=>= m   � �?? �@@  / g r o u p s /> o      �c�c 0 pth  �d  �k  / k   � �AA BCB r   � �DED o   � ��b�b 
0 pgs PgsE o      �a�a 0 src  C F�`F r   � �GHG m   � �II �JJ  /H o      �_�_ 0 pth  �`  , KLK X   ��M�^NM k   ��OO PQP r   � �RSR [   � �TUT o   � ��]�] 0 i  U m   � ��\�\ S o      �[�[ 0 i  Q VWV r   � �XYX b   � �Z[Z b   � �\]\ m   � �^^ �__ ( h t t p s : / / f a c e b o o k . c o m] o   � ��Z�Z 0 pth  [ o   � ��Y�Y 0 s  Y o      �X�X 0 
currentsrc 
CurrentSrcW `a` O   �bcb k   �dd efe I  � ��W�V�U
�W .aevtrappnull��� ��� null�V  �U  f ghg I  � ��T�S�R
�T .miscactvnull��� ��� null�S  �R  h iji I  � ��Qk�P
�Q .sysodelanull��� ��� nmbrk o   � ��O�O 0 page_loading_time  �P  j lml I  � �Nn�M
�N .ascrcmnt****      � ****n b   � �opo b   � �qrq b   � �sts b   � �uvu o   � ��L�L 0 i  v m   � �ww �xx   t o   � ��K�K 	0 stype  r m   � �yy �zz   p o   � ��J�J 0 
currentsrc 
CurrentSrc�M  m {|{ I �I}�H
�I .GURLGURLnull��� ��� TEXT} o  �G�G 0 
currentsrc 
CurrentSrc�H  | ~~ I 	�F��E
�F .sysodelanull��� ��� nmbr� m  	
�D�D �E   ��� U  5��� k  0�� ��� O *��� I )�C��
�C .prcskcodnull���     ****� m  �B�B }� �A��@
�A 
faal� m  "%�?
�? eMdsKcmd�@  � m  ���                                                                                  sevs  alis    �  Macintosh HD               ���H+  ��System Events.app                                              �����        ����  	                CoreServices    ���      ���    ������  =Macintosh HD:System: Library: CoreServices: System Events.app   $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��  � ��>� I +0�=��<
�= .sysodelanull��� ��� nmbr� o  +,�;�; 0 page_loading_time  �<  �>  � o  �:�: 0 
page_flips  � ��� O 6O��� I <N�9��
�9 .prcskcodnull���     ****� m  <?�8�8 "� �7��6
�7 
faal� J  BJ�� ��� m  BE�5
�5 eMdsKopt� ��4� m  EH�3
�3 eMdsKcmd�4  �6  � m  69���                                                                                  sevs  alis    �  Macintosh HD               ���H+  ��System Events.app                                              �����        ����  	                CoreServices    ���      ���    ������  =Macintosh HD:System: Library: CoreServices: System Events.app   $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��  � ��� I PY�2��1
�2 .sysodelanull��� ��� nmbr� ]  PU��� o  PQ�0�0 0 
page_flips  � m  QT�� ?�      �1  � ��� O Zh��� I `g�/��.
�/ .prcskcodnull���     ****� m  `c�-�- ~�.  � m  Z]���                                                                                  sevs  alis    �  Macintosh HD               ���H+  ��System Events.app                                              �����        ����  	                CoreServices    ���      ���    ������  =Macintosh HD:System: Library: CoreServices: System Events.app   $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��  � ��� I ip�,��+
�, .sysodelanull��� ��� nmbr� m  il�� ?�      �+  � ��� O q��� I w~�*��)
�* .prcskcodnull���     ****� m  wz�(�( ~�)  � m  qt���                                                                                  sevs  alis    �  Macintosh HD               ���H+  ��System Events.app                                              �����        ����  	                CoreServices    ���      ���    ������  =Macintosh HD:System: Library: CoreServices: System Events.app   $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��  � ��� I ���'��&
�' .sysodelanull��� ��� nmbr� m  ���� ?�      �&  � ��� O ����� I ���%��$
�% .prcskcodnull���     ****� m  ���#�# ~�$  � m  �����                                                                                  sevs  alis    �  Macintosh HD               ���H+  ��System Events.app                                              �����        ����  	                CoreServices    ���      ���    ������  =Macintosh HD:System: Library: CoreServices: System Events.app   $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��  � ��� I ���"��!
�" .sysodelanull��� ��� nmbr� m  ���� ?�      �!  � ��� O ����� I ��� ��
�  .prcskcodnull���     ****� m  ���� ~�  � m  �����                                                                                  sevs  alis    �  Macintosh HD               ���H+  ��System Events.app                                              �����        ����  	                CoreServices    ���      ���    ������  =Macintosh HD:System: Library: CoreServices: System Events.app   $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��  � ��� I �����
� .sysodelanull��� ��� nmbr� m  ���� ?�      �  � ��� O ����� I �����
� .prcskcodnull���     ****� m  ���� }�  � m  �����                                                                                  sevs  alis    �  Macintosh HD               ���H+  ��System Events.app                                              �����        ����  	                CoreServices    ���      ���    ������  =Macintosh HD:System: Library: CoreServices: System Events.app   $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��  � ��� I �����
� .sysodelanull��� ��� nmbr� m  ���� ?�      �  � ��� O ����� I �����
� .prcskcodnull���     ****� m  ���� � ���
� 
faal� m  ���
� eMdsKcmd�  � m  �����                                                                                  sevs  alis    �  Macintosh HD               ���H+  ��System Events.app                                              �����        ����  	                CoreServices    ���      ���    ������  =Macintosh HD:System: Library: CoreServices: System Events.app   $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��  � ��� I �����
� .sysodelanull��� ��� nmbr� m  ���� �  � ��� O ����� I �����
� .prcskcodnull���     ****� m  ���� � ���
� 
faal� m  ���

�
 eMdsKcmd�  � m  �����                                                                                  sevs  alis    �  Macintosh HD               ���H+  ��System Events.app                                              �����        ����  	                CoreServices    ���      ���    ������  =Macintosh HD:System: Library: CoreServices: System Events.app   $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��  � ��	� I ����
� .sysodelanull��� ��� nmbr� m  ���� �  �	  c 4   � ���
� 
capp� o   � ��� 0 browsername BrowserNamea ��� I ���
� .ascrcmnt****      � ****� b  ��� b  ��� b  	��� m  �� ��� :         S a v i n g   t o   r a w   h t m l   f i l e :  � o  �� "0 fbscraperfolder FBScraperFolder� o  	
� �  0 s  � m  �� ��� 
 . h t m l�  � ��� O  W��� k  V�� ��� I ������
�� .aevtrappnull��� ��� null��  ��  � ��� I  %������
�� .miscactvnull��� ��� null��  ��  �    I &+����
�� .sysodelanull��� ��� nmbr m  &'���� ��    O ,: I 29����
�� .prcskcodnull���     **** m  25���� $��   m  ,/�                                                                                  sevs  alis    �  Macintosh HD               ���H+  ��System Events.app                                              �����        ����  	                CoreServices    ���      ���    ������  =Macintosh HD:System: Library: CoreServices: System Events.app   $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��   	
	 O ;K I AJ����
�� .prcskprsnull���     ctxt b  AF m  AD �  c d   o  DE���� "0 fbscraperfolder FBScraperFolder��   m  ;>�                                                                                  sevs  alis    �  Macintosh HD               ���H+  ��System Events.app                                              �����        ����  	                CoreServices    ���      ���    ������  =Macintosh HD:System: Library: CoreServices: System Events.app   $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��  
  O LZ I RY����
�� .prcskcodnull���     **** m  RU���� $��   m  LO�                                                                                  sevs  alis    �  Macintosh HD               ���H+  ��System Events.app                                              �����        ����  	                CoreServices    ���      ���    ������  =Macintosh HD:System: Library: CoreServices: System Events.app   $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��    O [o I an����
�� .prcskprsnull���     ctxt b  aj b  af !  m  ad"" �##  r m   - f  ! o  de���� 0 s   m  fi$$ �%% 
 . h t m l��   m  [^&&�                                                                                  sevs  alis    �  Macintosh HD               ���H+  ��System Events.app                                              �����        ����  	                CoreServices    ���      ���    ������  =Macintosh HD:System: Library: CoreServices: System Events.app   $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��   '(' O p~)*) I v}��+��
�� .prcskcodnull���     ****+ m  vy���� $��  * m  ps,,�                                                                                  sevs  alis    �  Macintosh HD               ���H+  ��System Events.app                                              �����        ����  	                CoreServices    ���      ���    ������  =Macintosh HD:System: Library: CoreServices: System Events.app   $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��  ( -.- I ���/��
�� .sysodelanull��� ��� nmbr/ m  �00 ?�      ��  . 121 O ��343 I ����5��
�� .prcskprsnull���     ctxt5 b  ��676 b  ��898 m  ��:: �;;  r m   - f  9 o  ������ 0 s  7 m  ��<< �==  - s c r a p e d . h t m l��  4 m  ��>>�                                                                                  sevs  alis    �  Macintosh HD               ���H+  ��System Events.app                                              �����        ����  	                CoreServices    ���      ���    ������  =Macintosh HD:System: Library: CoreServices: System Events.app   $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��  2 ?@? O ��ABA I ����C��
�� .prcskcodnull���     ****C m  ������ $��  B m  ��DD�                                                                                  sevs  alis    �  Macintosh HD               ���H+  ��System Events.app                                              �����        ����  	                CoreServices    ���      ���    ������  =Macintosh HD:System: Library: CoreServices: System Events.app   $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��  @ EFE I ����G��
�� .sysodelanull��� ��� nmbrG m  ��HH ?�      ��  F IJI O ��KLK I ����M��
�� .prcskprsnull���     ctxtM b  ��NON b  ��PQP m  ��RR �SS  r m   - f  Q o  ������ 0 s  O m  ��TT �UU  . c s v��  L m  ��VV�                                                                                  sevs  alis    �  Macintosh HD               ���H+  ��System Events.app                                              �����        ����  	                CoreServices    ���      ���    ������  =Macintosh HD:System: Library: CoreServices: System Events.app   $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��  J WXW O ��YZY I ����[��
�� .prcskcodnull���     ****[ m  ������ $��  Z m  ��\\�                                                                                  sevs  alis    �  Macintosh HD               ���H+  ��System Events.app                                              �����        ����  	                CoreServices    ���      ���    ������  =Macintosh HD:System: Library: CoreServices: System Events.app   $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��  X ]^] I ����_��
�� .sysodelanull��� ��� nmbr_ m  ��`` ?�      ��  ^ aba r  ��cdc I ����ef
�� .rdwropenshor       filee l ��g����g b  ��hih b  ��jkj o  ������ "0 fbscraperfolder FBScraperFolderk o  ������ 0 s  i m  ��ll �mm 
 . h t m l��  ��  f ��n��
�� 
permn m  ����
�� boovtrue��  d o      ���� 0 myfile myFileb opo I �
��qr
�� .rdwrwritnull���     ****q l ��s����s I ��������
�� .JonsgClp****    ��� null��  ��  ��  ��  r ��tu
�� 
refnt o  ������ 0 myfile myFileu ��v��
�� 
as  v m  ��
�� 
utf8��  p wxw I ��y��
�� .rdwrclosnull���     ****y o  ���� 0 myfile myFile��  x z{z I ��|��
�� .JonspClpnull���     ****| m  }} �~~  ��  { � I (�����
�� .ascrcmnt****      � ****� b  $��� b   ��� m  �� ��� n         F i l e   s a v e d . . .   E x t r a c t i n g   d a t a   &   c r e a t i n g   C S V   f i l e :  � o  ���� 0 s  � m   #�� ���  . c s v��  � ��� O )9��� I /8�����
�� .prcskprsnull���     ctxt� b  /4��� m  /2�� ��� ( p y t h o n   f b s c r a p e r . p y  � o  23���� 0 s  ��  � m  ),���                                                                                  sevs  alis    �  Macintosh HD               ���H+  ��System Events.app                                              �����        ����  	                CoreServices    ���      ���    ������  =Macintosh HD:System: Library: CoreServices: System Events.app   $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��  � ��� I :A�����
�� .sysodelanull��� ��� nmbr� m  :=�� ?ə�������  � ��� O BP��� I HO�����
�� .prcskcodnull���     ****� m  HK���� $��  � m  BE���                                                                                  sevs  alis    �  Macintosh HD               ���H+  ��System Events.app                                              �����        ����  	                CoreServices    ���      ���    ������  =Macintosh HD:System: Library: CoreServices: System Events.app   $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��  � ���� I QV�����
�� .sysodelanull��� ��� nmbr� o  QR���� 0 
page_flips  ��  ��  � m  ���                                                                                      @ alis    l  Macintosh HD               ���H+  ��STerminal.app                                                   ����P��        ����  	                	Utilities     ���      �P��    ��S��  2Macintosh HD:Applications: Utilities: Terminal.app    T e r m i n a l . a p p    M a c i n t o s h   H D  #Applications/Utilities/Terminal.app   / ��  � ��� Z  X�������� o  XY���� 0 show_scraped_html  � O  \���� k  e��� ��� I ej������
�� .aevtrappnull��� ��� null��  ��  � ��� I kp������
�� .miscactvnull��� ��� null��  ��  � ��� I qv�����
�� .sysodelanull��� ��� nmbr� m  qr���� ��  � ��� I w������
�� .GURLGURLnull��� ��� TEXT� b  w���� b  w~��� b  w|��� m  wz�� ���  f i l e : / /� o  z{���� "0 fbscraperfolder FBScraperFolder� o  |}���� 0 s  � m  ~��� ���  - s c r a p e d . h t m l��  � ��� I �������
�� .sysodelanull��� ��� nmbr� m  ������ ��  � ��� O ����� I ������
�� .prcskcodnull���     ****� m  ������ }� �����
�� 
faal� m  ����
�� eMdsKcmd��  � m  �����                                                                                  sevs  alis    �  Macintosh HD               ���H+  ��System Events.app                                              �����        ����  	                CoreServices    ���      ���    ������  =Macintosh HD:System: Library: CoreServices: System Events.app   $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��  � ��� I �������
�� .sysodelanull��� ��� nmbr� m  ������ ��  � ��� O ����� I ������
�� .prcskcodnull���     ****� m  ������ � �����
�� 
faal� m  ����
�� eMdsKcmd��  � m  �����                                                                                  sevs  alis    �  Macintosh HD               ���H+  ��System Events.app                                              �����        ����  	                CoreServices    ���      ���    ������  =Macintosh HD:System: Library: CoreServices: System Events.app   $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��  � ���� I �������
�� .sysodelanull��� ��� nmbr� m  ������ ��  ��  � 4  \b���
�� 
capp� o  `a���� 0 browsername BrowserName��  ��  � ���� Z ��������� o  ������ 0 audio_notification  � I �������
�� .sysottosnull���     TEXT� b  ����� b  ����� b  ����� o  ������ 	0 stype  � m  ���� ���   � o  ������ 0 i  � m  ���� ���  f � r d i g !��  ��  ��  ��  �^ 0 s  N o   � ��� 0 src  L ��~� Z �����}�|� o  ���{�{ 0 audio_notification  � I ���z��y
�z .sysottosnull���     TEXT� b  ����� o  ���x�x 	0 stype  � m  ���� ���    k l a r t !�y  �}  �|  �~  �n 	0 stype  % o   a b�w�w 0 s_types  �p  �o  " ��v� l     �u�t�s�u  �t  �s  �v       �r���r  � �q
�q .aevtoappnull  �   � ****� �p��o�n���m
�p .aevtoappnull  �   � ****� k    ���  ��  '��  8��  G��  V��  b��  n��  z��  ���  ���  ���  ���  ���  ���  �    �   !�l�l  �o  �n  � �k�j�k 	0 stype  �j 0 s  � W �i .�h�g�f�e�d�c�b�a � ��` � � � ��_�^�]�\�[�Z5�Y?�XI^�W�V�U�T�Swy�R�Q��P�O�N�M�L�K��J�I�H����G�F"$:<RTl�E�D�C�B�A�@�?�>�=�<}�;���������:��i 0 browsername BrowserName�h "0 fbscraperfolder FBScraperFolder�g 0 grps Grps�f 
0 pgs Pgs�e �d 0 
page_flips  �c 0 page_loading_time  �b 0 show_scraped_html  �a 0 audio_notification  �` 0 s_types  �_ 

�^ 
kocl
�] 
cobj
�\ .corecnte****       ****�[ 0 i  
�Z 
pcnt�Y 0 src  �X 0 pth  �W 0 
currentsrc 
CurrentSrc
�V 
capp
�U .aevtrappnull��� ��� null
�T .miscactvnull��� ��� null
�S .sysodelanull��� ��� nmbr
�R .ascrcmnt****      � ****
�Q .GURLGURLnull��� ��� TEXT�P }
�O 
faal
�N eMdsKcmd
�M .prcskcodnull���     ****�L "
�K eMdsKopt�J ~�I �H �G $
�F .prcskprsnull���     ctxt
�E 
perm
�D .rdwropenshor       file�C 0 myfile myFile
�B .JonsgClp****    ��� null
�A 
refn
�@ 
as  
�? 
utf8�> 
�= .rdwrwritnull���     ****
�< .rdwrclosnull���     ****
�; .JonspClpnull���     ****
�: .sysottosnull���     TEXT�m��E�O�E�OjvE�OjvE�O�E�OlE�OeE�OfE�O��lvE�O�E�O�E�Oa kvE�Oa kvE�Oa E�OlE�OeE�OeE�Oa a lvE�O��[a a l kh  jE` O�a ,a   �E` Oa E` Y �E` Oa E` OC_ [a a l kh _ kE` Oa _ %�%E`  O*a !�/+*j "O*j #O�j $O_ a %%�%a &%_  %j 'O_  j (Olj $O %�kha ) a *a +a ,l -UO�j $[OY��Oa ) a .a +a /a ,lvl -UO�a 0 j $Oa ) 	a 1j -UOa 0j $Oa ) 	a 1j -UOa 0j $Oa ) 	a 1j -UOa 0j $Oa ) 	a 1j -UOa 0j $Oa ) 	a *j -UOa 0j $Oa ) a 2a +a ,l -UOkj $Oa ) a 3a +a ,l -UOkj $UOa 4�%�%a 5%j 'Oa 6>*j "O*j #Omj $Oa ) 	a 7j -UOa ) a 8�%j 9UOa ) 	a 7j -UOa ) a :�%a ;%j 9UOa ) 	a 7j -UOa 0j $Oa ) a <�%a =%j 9UOa ) 	a 7j -UOa 0j $Oa ) a >�%a ?%j 9UOa ) 	a 7j -UOa 0j $Oá%a @%a Ael BE` CO*j Da E_ Ca Fa Ga H IO_ Cj JOa Kj LOa M�%a N%j 'Oa ) a O�%j 9UOa Pj $Oa ) 	a 7j -UO�j $UO� l*a !�/ _*j "O*j #Okj $Oa Q�%�%a R%j (Olj $Oa ) a *a +a ,l -UOlj $Oa ) a 3a +a ,l -UOkj $UY hO� �a S%_ %a T%j UY h[OY��O� �a V%j UY h[OY�t ascr  ��ޭ