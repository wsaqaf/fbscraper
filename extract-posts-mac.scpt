FasdUAS 1.101.10   ��   ��    k             l     ��  ��    { u## Before launching this, you need to ensure that you have Google Chrome and a text editor (e.g., Atom) are installed     � 	 	 � # #   B e f o r e   l a u n c h i n g   t h i s ,   y o u   n e e d   t o   e n s u r e   t h a t   y o u   h a v e   G o o g l e   C h r o m e   a n d   a   t e x t   e d i t o r   ( e . g . ,   A t o m )   a r e   i n s t a l l e d   
  
 l     ��  ��    x r## You also need to configure the below settings, which includes the list of pages and groups you will be scraping     �   � # #   Y o u   a l s o   n e e d   t o   c o n f i g u r e   t h e   b e l o w   s e t t i n g s ,   w h i c h   i n c l u d e s   t h e   l i s t   o f   p a g e s   a n d   g r o u p s   y o u   w i l l   b e   s c r a p i n g      l     ��������  ��  ��        l     ��  ��    @ :The command used to run the text editor used to save files     �   t T h e   c o m m a n d   u s e d   t o   r u n   t h e   t e x t   e d i t o r   u s e d   t o   s a v e   f i l e s      l     ����  r         m        �    a t o m  o      ���� 0 editorcommand EditorCommand��  ��        l     ��������  ��  ��         l     �� ! "��   ! m gThe absolute link to the folder where the script is installed, e.g., /Users/username/desktop/fbscraper/    " � # # � T h e   a b s o l u t e   l i n k   t o   t h e   f o l d e r   w h e r e   t h e   s c r i p t   i s   i n s t a l l e d ,   e . g . ,   / U s e r s / u s e r n a m e / d e s k t o p / f b s c r a p e r /    $ % $ l    &���� & r     ' ( ' m     ) ) � * *   ( o      ���� "0 fbscraperfolder FBScraperFolder��  ��   %  + , + l     ��������  ��  ��   ,  - . - l     �� / 0��   / ` ZList of pages, accessed via https://facebook.com/<page>, e.g., {"svt", "svenskadagbladet"}    0 � 1 1 � L i s t   o f   p a g e s ,   a c c e s s e d   v i a   h t t p s : / / f a c e b o o k . c o m / < p a g e > ,   e . g . ,   { " s v t " ,   " s v e n s k a d a g b l a d e t " } .  2 3 2 l    4���� 4 r     5 6 5 J    
����   6 o      ���� 
0 pgs Pgs��  ��   3  7 8 7 l     ��������  ��  ��   8  9 : 9 l     �� ; <��   ; � �List of groups, accessed via https://facebook.com/groups/<group>, usually numbers only, e.g., {"9032380722398113" ,"99299391993232"}    < � = = L i s t   o f   g r o u p s ,   a c c e s s e d   v i a   h t t p s : / / f a c e b o o k . c o m / g r o u p s / < g r o u p > ,   u s u a l l y   n u m b e r s   o n l y ,   e . g . ,   { " 9 0 3 2 3 8 0 7 2 2 3 9 8 1 1 3 "   , " 9 9 2 9 9 3 9 1 9 9 3 2 3 2 " } :  > ? > l    @���� @ r     A B A J    ����   B o      ���� 0 grps Grps��  ��   ?  C D C l     ��������  ��  ��   D  E F E l     �� G H��   G O IHow many flips (each usually contains 20 posts) each page/group will need    H � I I � H o w   m a n y   f l i p s   ( e a c h   u s u a l l y   c o n t a i n s   2 0   p o s t s )   e a c h   p a g e / g r o u p   w i l l   n e e d F  J K J l    L���� L r     M N M m    ���� 2 N o      ���� 0 
page_flips  ��  ��   K  O P O l     ��������  ��  ��   P  Q R Q l     �� S T��   S V PTime allowed for each page flip to load (depends on Internet and computer speed)    T � U U � T i m e   a l l o w e d   f o r   e a c h   p a g e   f l i p   t o   l o a d   ( d e p e n d s   o n   I n t e r n e t   a n d   c o m p u t e r   s p e e d ) R  V W V l    X���� X r     Y Z Y m    ����  Z o      ���� 0 page_loading_time  ��  ��   W  [ \ [ l     ��������  ��  ��   \  ] ^ ] l     �� _ `��   _ L FSet to false if you do not want to open a tab with the scraped entries    ` � a a � S e t   t o   f a l s e   i f   y o u   d o   n o t   w a n t   t o   o p e n   a   t a b   w i t h   t h e   s c r a p e d   e n t r i e s ^  b c b l    d���� d r     e f e m    ��
�� boovtrue f o      ���� 0 show_scraped_html  ��  ��   c  g h g l     ��������  ��  ��   h  i j i l   ! k l m k r    ! n o n m    ����   o o      ���� 0 i   l  Resets counter    m � p p  R e s e t s   c o u n t e r j  q r q l     ��������  ��  ��   r  s t s l     �� u v��   u  ### Do FB groups ####    v � w w * # # #   D o   F B   g r o u p s   # # # # t  x y x l     ��������  ��  ��   y  z { z l  " |���� | X   " }�� ~ } k   2    � � � r   2 7 � � � [   2 5 � � � o   2 3���� 0 i   � m   3 4����  � o      ���� 0 i   �  � � � r   8 = � � � b   8 ; � � � m   8 9 � � � � � * h t t p s : / / f a c e b o o k . c o m / � o   9 :���� 0 grp   � o      ���� 0 
currentgrp 
CurrentGrp �  � � � O   >l � � � k   Dk � �  � � � I  D I������
�� .aevtrappnull��� ��� null��  ��   �  � � � I  J O������
�� .miscactvnull��� ��� null��  ��   �  � � � I  P U�� ���
�� .sysodelanull��� ��� nmbr � m   P Q���� ��   �  � � � I  V a�� ���
�� .ascrcmnt****      � **** � b   V ] � � � b   V [ � � � o   V W���� 0 i   � m   W Z � � � � �  )   g r o u p :   � o   [ \���� 0 
currentgrp 
CurrentGrp��   �  � � � I  b g�� ���
�� .GURLGURLnull��� ��� TEXT � o   b c���� 0 
currentgrp 
CurrentGrp��   �  � � � I  h m�� ���
�� .sysodelanull��� ��� nmbr � m   h i���� ��   �  � � � O  n � � � � I  t ��� � �
�� .prcskcodnull���     **** � m   t u����  � �� ���
�� 
faal � J   x � � �  � � � m   x {��
�� eMdsKctl �  ��� � m   { ~��
�� eMdsKcmd��  ��   � m   n q � ��                                                                                  sevs  alis    �  Macintosh HD               ���H+  ��System Events.app                                              �����        ����  	                CoreServices    ���      ���    ������  =Macintosh HD:System: Library: CoreServices: System Events.app   $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��   �  � � � I  � ��� ���
�� .sysodelanull��� ��� nmbr � m   � ����� ��   �  � � � l  � ��� � ���   � ( "		tell application "System Events"    � � � � D 	 	 t e l l   a p p l i c a t i o n   " S y s t e m   E v e n t s " �  � � � l  � ��� � ���   �  			click at {10, 400}    � � � � * 	 	 	 c l i c k   a t   { 1 0 ,   4 0 0 } �  � � � l  � ��� � ���   �  
		end tell    � � � �  	 	 e n d   t e l l �  � � � U   � � � � � k   � � � �  � � � O  � � � � � I  � ��� � �
�� .prcskcodnull���     **** � m   � ����� } � �� ���
�� 
faal � m   � ���
�� eMdsKcmd��   � m   � � � ��                                                                                  sevs  alis    �  Macintosh HD               ���H+  ��System Events.app                                              �����        ����  	                CoreServices    ���      ���    ������  =Macintosh HD:System: Library: CoreServices: System Events.app   $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��   �  ��� � I  � ��� ���
�� .sysodelanull��� ��� nmbr � o   � ����� 0 page_loading_time  ��  ��   � o   � ����� 0 
page_flips   �  � � � O  � � � � � I  � ��� � �
�� .prcskcodnull���     **** � m   � ����� " � �� ���
�� 
faal � J   � � � �  � � � m   � ���
�� eMdsKopt �  ��� � m   � ���
�� eMdsKcmd��  ��   � m   � � � ��                                                                                  sevs  alis    �  Macintosh HD               ���H+  ��System Events.app                                              �����        ����  	                CoreServices    ���      ���    ������  =Macintosh HD:System: Library: CoreServices: System Events.app   $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��   �  � � � I  � ��� ���
�� .sysodelanull��� ��� nmbr � ]   � � � � � o   � ��� 0 
page_flips   � m   � � � � ?ə�������   �  � � � O  � � � � � I  � ��~ ��}
�~ .prcskcodnull���     **** � m   � ��|�| ~�}   � m   � � � ��                                                                                  sevs  alis    �  Macintosh HD               ���H+  ��System Events.app                                              �����        ����  	                CoreServices    ���      ���    ������  =Macintosh HD:System: Library: CoreServices: System Events.app   $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��   �  � � � I  � ��{ ��z
�{ .sysodelanull��� ��� nmbr � m   � ��y�y �z   �  � � � O  � � � � � I  � ��x ��w
�x .prcskcodnull���     **** � m   � ��v�v ~�w   � m   � � � ��                                                                                  sevs  alis    �  Macintosh HD               ���H+  ��System Events.app                                              �����        ����  	                CoreServices    ���      ���    ������  =Macintosh HD:System: Library: CoreServices: System Events.app   $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��   �  � � � I  � �u ��t
�u .sysodelanull��� ��� nmbr � m   � ��s�s �t   �  � � � O  � � � I �r ��q
�r .prcskcodnull���     **** � m  
�p�p ~�q   � m   � ��                                                                                  sevs  alis    �  Macintosh HD               ���H+  ��System Events.app                                              �����        ����  	                CoreServices    ���      ���    ������  =Macintosh HD:System: Library: CoreServices: System Events.app   $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��   �    I �o�n
�o .sysodelanull��� ��� nmbr m  �m�m �n    O * I )�l
�l .prcskcodnull���     **** m  �k�k  �j	�i
�j 
faal	 m  "%�h
�h eMdsKcmd�i   m  

�                                                                                  sevs  alis    �  Macintosh HD               ���H+  ��System Events.app                                              �����        ����  	                CoreServices    ���      ���    ������  =Macintosh HD:System: Library: CoreServices: System Events.app   $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��    I +0�g�f
�g .sysodelanull��� ��� nmbr m  +,�e�e �f    O 1E I 7D�d
�d .prcskcodnull���     **** m  7:�c�c  �b�a
�b 
faal m  =@�`
�` eMdsKcmd�a   m  14�                                                                                  sevs  alis    �  Macintosh HD               ���H+  ��System Events.app                                              �����        ����  	                CoreServices    ���      ���    ������  =Macintosh HD:System: Library: CoreServices: System Events.app   $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��    I FM�_�^
�_ .sysodelanull��� ��� nmbr m  FI ?�      �^    O Ne I Td�]
�] .prcskcodnull���     **** m  TU�\�\  �[ �Z
�[ 
faal  J  X`!! "#" m  X[�Y
�Y eMdsKctl# $�X$ m  [^�W
�W eMdsKcmd�X  �Z   m  NQ%%�                                                                                  sevs  alis    �  Macintosh HD               ���H+  ��System Events.app                                              �����        ����  	                CoreServices    ���      ���    ������  =Macintosh HD:System: Library: CoreServices: System Events.app   $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��   &�V& I fk�U'�T
�U .sysodelanull��� ��� nmbr' m  fg�S�S �T  �V   � m   > A((�                                                                                  rimZ  alis    p  Macintosh HD               ���H+  ��Google Chrome 2.app                                            U��=        ����  	                Applications    ���      ��    ��  .Macintosh HD:Applications: Google Chrome 2.app  (  G o o g l e   C h r o m e   2 . a p p    M a c i n t o s h   H D   Applications/Google Chrome 2.app  / ��   � )*) I m|�R+�Q
�R .ascrcmnt****      � ****+ b  mx,-, b  mt./. b  mr010 m  mp22 �33 :         S a v i n g   t o   r a w   h t m l   f i l e :  1 o  pq�P�P "0 fbscraperfolder FBScraperFolder/ o  rs�O�O 0 grp  - m  tw44 �55 
 . h t m l�Q  * 676 O  }898 k  �:: ;<; I ���N�M�L
�N .aevtrappnull��� ��� null�M  �L  < =>= I ���K�J�I
�K .miscactvnull��� ��� null�J  �I  > ?@? I ���HA�G
�H .sysodelanull��� ��� nmbrA m  ���F�F �G  @ BCB l ���EDE�E  D J D		tell application "System Events" to key code 17 using command down   E �FF � 	 	 t e l l   a p p l i c a t i o n   " S y s t e m   E v e n t s "   t o   k e y   c o d e   1 7   u s i n g   c o m m a n d   d o w nC GHG l ���DIJ�D  I  			delay 1   J �KK  	 	 d e l a y   1H LML O ��NON I ���CP�B
�C .prcskcodnull���     ****P m  ���A�A $�B  O m  ��QQ�                                                                                  sevs  alis    �  Macintosh HD               ���H+  ��System Events.app                                              �����        ����  	                CoreServices    ���      ���    ������  =Macintosh HD:System: Library: CoreServices: System Events.app   $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��  M RSR I ���@T�?
�@ .sysodelanull��� ��� nmbrT m  ��UU ?ə������?  S VWV O ��XYX I ���>Z�=
�> .prcskprsnull���     ctxtZ b  ��[\[ m  ��]] �^^  c d  \ o  ���<�< "0 fbscraperfolder FBScraperFolder�=  Y m  ��__�                                                                                  sevs  alis    �  Macintosh HD               ���H+  ��System Events.app                                              �����        ����  	                CoreServices    ���      ���    ������  =Macintosh HD:System: Library: CoreServices: System Events.app   $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��  W `a` I ���;b�:
�; .sysodelanull��� ��� nmbrb m  ��cc ?ə������:  a ded O ��fgf I ���9h�8
�9 .prcskcodnull���     ****h m  ���7�7 $�8  g m  ��ii�                                                                                  sevs  alis    �  Macintosh HD               ���H+  ��System Events.app                                              �����        ����  	                CoreServices    ���      ���    ������  =Macintosh HD:System: Library: CoreServices: System Events.app   $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��  e jkj I ���6l�5
�6 .sysodelanull��� ��� nmbrl m  ��mm ?ə������5  k non O ��pqp I ���4r�3
�4 .prcskprsnull���     ctxtr b  ��sts b  ��uvu b  ��wxw o  ���2�2 0 editorcommand EditorCommandx m  ��yy �zz   v o  ���1�1 0 grp  t m  ��{{ �|| 
 . h t m l�3  q m  ��}}�                                                                                  sevs  alis    �  Macintosh HD               ���H+  ��System Events.app                                              �����        ����  	                CoreServices    ���      ���    ������  =Macintosh HD:System: Library: CoreServices: System Events.app   $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��  o ~~ I ���0��/
�0 .sysodelanull��� ��� nmbr� m  ���.�. �/   ��-� O ���� I ��,��+
�, .prcskcodnull���     ****� m  ��*�* $�+  � m  �����                                                                                  sevs  alis    �  Macintosh HD               ���H+  ��System Events.app                                              �����        ����  	                CoreServices    ���      ���    ������  =Macintosh HD:System: Library: CoreServices: System Events.app   $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��  �-  9 m  }����                                                                                      @ alis    l  Macintosh HD               ���H+  ��STerminal.app                                                   ����P��        ����  	                	Utilities     ���      �P��    ��S��  2Macintosh HD:Applications: Utilities: Terminal.app    T e r m i n a l . a p p    M a c i n t o s h   H D  #Applications/Utilities/Terminal.app   / ��  7 ��� I 	�)��(
�) .sysodelanull��� ��� nmbr� ]  	��� o  	
�'�' 0 
page_flips  � m  
�� ?ə������(  � ��� O %��� I $�&��
�& .prcskcodnull���     ****� m  �%�%  � �$��#
�$ 
faal� m   �"
�" eMdsKcmd�#  � m  ���                                                                                  sevs  alis    �  Macintosh HD               ���H+  ��System Events.app                                              �����        ����  	                CoreServices    ���      ���    ������  =Macintosh HD:System: Library: CoreServices: System Events.app   $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��  � ��� I &+�!�� 
�! .sysodelanull��� ��� nmbr� m  &'�� �   � ��� O ,@��� I 2?���
� .prcskcodnull���     ****� m  25�� 	� ���
� 
faal� m  8;�
� eMdsKcmd�  � m  ,/���                                                                                  sevs  alis    �  Macintosh HD               ���H+  ��System Events.app                                              �����        ����  	                CoreServices    ���      ���    ������  =Macintosh HD:System: Library: CoreServices: System Events.app   $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��  � ��� I AF���
� .sysodelanull��� ��� nmbr� m  AB�� �  � ��� O GY��� I MX���
� .prcskcodnull���     ****� m  MN�� � ���
� 
faal� m  QT�
� eMdsKcmd�  � m  GJ���                                                                                  sevs  alis    �  Macintosh HD               ���H+  ��System Events.app                                              �����        ����  	                CoreServices    ���      ���    ������  =Macintosh HD:System: Library: CoreServices: System Events.app   $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��  � ��� I Zc���
� .sysodelanull��� ��� nmbr� ]  Z_��� o  Z[�� 0 
page_flips  � m  [^�� ?ə������  � ��� O dx��� I jw���
� .prcskcodnull���     ****� m  jm�� � ���
� 
faal� m  ps�

�
 eMdsKcmd�  � m  dg���                                                                                  sevs  alis    �  Macintosh HD               ���H+  ��System Events.app                                              �����        ����  	                CoreServices    ���      ���    ������  =Macintosh HD:System: Library: CoreServices: System Events.app   $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��  � ��� I y��	��
�	 .sysodelanull��� ��� nmbr� m  y|�� ?�      �  � ��� I �����
� .ascrcmnt****      � ****� b  ����� b  ����� m  ���� ��� R         E x t r a c t i n g   d a t a   &   c r e a t i n g   C S V   f i l e :  � o  ���� 0 grp  � m  ���� ���  . c s v�  � ��� O  ����� k  ���� ��� I �����
� .aevtrappnull��� ��� null�  �  � ��� I ���� ��
� .miscactvnull��� ��� null�   ��  � ��� I �������
�� .sysodelanull��� ��� nmbr� m  ������ ��  � ��� O ����� I �������
�� .prcskprsnull���     ctxt� b  ����� m  ���� ��� ( p y t h o n   f b s c r a p e r . p y  � o  ������ 0 grp  ��  � m  �����                                                                                  sevs  alis    �  Macintosh HD               ���H+  ��System Events.app                                              �����        ����  	                CoreServices    ���      ���    ������  =Macintosh HD:System: Library: CoreServices: System Events.app   $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��  � ��� I �������
�� .sysodelanull��� ��� nmbr� m  ���� ?ə�������  � ��� O ����� I �������
�� .prcskcodnull���     ****� m  ������ $��  � m  �����                                                                                  sevs  alis    �  Macintosh HD               ���H+  ��System Events.app                                              �����        ����  	                CoreServices    ���      ���    ������  =Macintosh HD:System: Library: CoreServices: System Events.app   $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��  � ���� I �������
�� .sysodelanull��� ��� nmbr� ]  ����� o  ������ 0 
page_flips  � m  ���� ?�      ��  ��  � m  �����                                                                                      @ alis    l  Macintosh HD               ���H+  ��STerminal.app                                                   ����P��        ����  	                	Utilities     ���      �P��    ��S��  2Macintosh HD:Applications: Utilities: Terminal.app    T e r m i n a l . a p p    M a c i n t o s h   H D  #Applications/Utilities/Terminal.app   / ��  � ���� Z  �������� o  ������ 0 show_scraped_html  � O  ���� k  ��� ��� I ��������
�� .aevtrappnull��� ��� null��  ��  � ��� I ��������
�� .miscactvnull��� ��� null��  ��  � ��� I �������
�� .sysodelanull��� ��� nmbr� m  ������ ��  � ��� I ������
�� .GURLGURLnull��� ��� TEXT� b  ���� b  ��   b  �� m  �� �  f i l e : / / o  ������ "0 fbscraperfolder FBScraperFolder o  ������ 0 grp  � m  �  �  - s c r a p e d . h t m l��  � �� I ��	��
�� .sysodelanull��� ��� nmbr	 m  ���� ��  ��  � m  ��

�                                                                                  rimZ  alis    p  Macintosh HD               ���H+  ��Google Chrome 2.app                                            U��=        ����  	                Applications    ���      ��    ��  .Macintosh HD:Applications: Google Chrome 2.app  (  G o o g l e   C h r o m e   2 . a p p    M a c i n t o s h   H D   Applications/Google Chrome 2.app  / ��  ��  ��  ��  �� 0 grp   ~ o   % &���� 0 grps Grps��  ��   {  l     ��������  ��  ��    l     ����    ### Do FB pages ####    � ( # # #   D o   F B   p a g e s   # # # #  l     ��������  ��  ��    l ����� X  ��� k  &�  r  &+ [  &) o  &'���� 0 i   m  '(����  o      ���� 0 i    !  r  ,5"#" b  ,1$%$ m  ,/&& �'' * h t t p s : / / f a c e b o o k . c o m /% o  /0���� 0 pg  # o      ���� 0 	currentpg 	CurrentPg! ()( O  6,*+* k  <+,, -.- I <A������
�� .aevtrappnull��� ��� null��  ��  . /0/ I BG������
�� .miscactvnull��� ��� null��  ��  0 121 I HM��3��
�� .sysodelanull��� ��� nmbr3 m  HI���� ��  2 454 I NU��6��
�� .GURLGURLnull��� ��� TEXT6 o  NQ���� 0 	currentpg 	CurrentPg��  5 787 I V[��9��
�� .sysodelanull��� ��� nmbr9 m  VW���� ��  8 :;: I \i��<��
�� .ascrcmnt****      � ****< b  \e=>= b  \a?@? o  \]���� 0 i  @ m  ]`AA �BB  )   p a g e :  > o  ad���� 0 	currentpg 	CurrentPg��  ; CDC U  j�EFE k  q�GG HIH O q�JKJ I w���LM
�� .prcskcodnull���     ****L m  wz���� }M ��N��
�� 
faalN m  }���
�� eMdsKcmd��  K m  qtOO�                                                                                  sevs  alis    �  Macintosh HD               ���H+  ��System Events.app                                              �����        ����  	                CoreServices    ���      ���    ������  =Macintosh HD:System: Library: CoreServices: System Events.app   $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��  I P��P I ����Q��
�� .sysodelanull��� ��� nmbrQ o  ������ 0 page_loading_time  ��  ��  F o  mn���� 0 
page_flips  D RSR O ��TUT I ����VW
�� .prcskcodnull���     ****V m  ������ "W ��X��
�� 
faalX J  ��YY Z[Z m  ����
�� eMdsKopt[ \��\ m  ����
�� eMdsKcmd��  ��  U m  ��]]�                                                                                  sevs  alis    �  Macintosh HD               ���H+  ��System Events.app                                              �����        ����  	                CoreServices    ���      ���    ������  =Macintosh HD:System: Library: CoreServices: System Events.app   $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��  S ^_^ I ����`��
�� .sysodelanull��� ��� nmbr` ]  ��aba o  ������ 0 
page_flips  b m  ��cc ?ə�������  _ ded O ��fgf I ����h��
�� .prcskcodnull���     ****h m  ������ ~��  g m  ��ii�                                                                                  sevs  alis    �  Macintosh HD               ���H+  ��System Events.app                                              �����        ����  	                CoreServices    ���      ���    ������  =Macintosh HD:System: Library: CoreServices: System Events.app   $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��  e jkj I ����l��
�� .sysodelanull��� ��� nmbrl m  ������ ��  k mnm O ��opo I ����q��
�� .prcskcodnull���     ****q m  ������ ~��  p m  ��rr�                                                                                  sevs  alis    �  Macintosh HD               ���H+  ��System Events.app                                              �����        ����  	                CoreServices    ���      ���    ������  =Macintosh HD:System: Library: CoreServices: System Events.app   $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��  n sts I ����u��
�� .sysodelanull��� ��� nmbru m  ������ ��  t vwv O ��xyx I ����z��
�� .prcskcodnull���     ****z m  ������ ~��  y m  ��{{�                                                                                  sevs  alis    �  Macintosh HD               ���H+  ��System Events.app                                              �����        ����  	                CoreServices    ���      ���    ������  =Macintosh HD:System: Library: CoreServices: System Events.app   $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��  w |}| I ����~��
�� .sysodelanull��� ��� nmbr~ m  ������ ��  } � O ���� I �����
�� .prcskcodnull���     ****� m  ������ � �����
�� 
faal� m   ��
�� eMdsKcmd��  � m  �����                                                                                  sevs  alis    �  Macintosh HD               ���H+  ��System Events.app                                              �����        ����  	                CoreServices    ���      ���    ������  =Macintosh HD:System: Library: CoreServices: System Events.app   $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��  � ��� I 	�����
�� .sysodelanull��� ��� nmbr� m  	
���� ��  � ��� O #��� I "����
�� .prcskcodnull���     ****� m  ���� � �����
�� 
faal� m  ��
�� eMdsKcmd��  � m  ���                                                                                  sevs  alis    �  Macintosh HD               ���H+  ��System Events.app                                              �����        ����  	                CoreServices    ���      ���    ������  =Macintosh HD:System: Library: CoreServices: System Events.app   $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��  � ���� I $+�����
�� .sysodelanull��� ��� nmbr� m  $'�� ?�      ��  ��  + m  69���                                                                                  rimZ  alis    p  Macintosh HD               ���H+  ��Google Chrome 2.app                                            U��=        ����  	                Applications    ���      ��    ��  .Macintosh HD:Applications: Google Chrome 2.app  (  G o o g l e   C h r o m e   2 . a p p    M a c i n t o s h   H D   Applications/Google Chrome 2.app  / ��  ) ��� I -<�����
�� .ascrcmnt****      � ****� b  -8��� b  -4��� b  -2��� m  -0�� ��� :         S a v i n g   t o   r a w   h t m l   f i l e :  � o  01�� "0 fbscraperfolder FBScraperFolder� o  23�~�~ 0 pg  � m  47�� ��� 
 . h t m l��  � ��� O  =���� k  C��� ��� I CH�}�|�{
�} .aevtrappnull��� ��� null�|  �{  � ��� I IN�z�y�x
�z .miscactvnull��� ��� null�y  �x  � ��� I OT�w��v
�w .sysodelanull��� ��� nmbr� m  OP�u�u �v  � ��� l UU�t���t  � J D		tell application "System Events" to key code 17 using command down   � ��� � 	 	 t e l l   a p p l i c a t i o n   " S y s t e m   E v e n t s "   t o   k e y   c o d e   1 7   u s i n g   c o m m a n d   d o w n� ��� l UU�s���s  �  			delay 1   � ���  	 	 d e l a y   1� ��� O Uc��� I [b�r��q
�r .prcskcodnull���     ****� m  [^�p�p $�q  � m  UX���                                                                                  sevs  alis    �  Macintosh HD               ���H+  ��System Events.app                                              �����        ����  	                CoreServices    ���      ���    ������  =Macintosh HD:System: Library: CoreServices: System Events.app   $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��  � ��� I dk�o��n
�o .sysodelanull��� ��� nmbr� m  dg�� ?ə������n  � ��� O l|��� I r{�m��l
�m .prcskprsnull���     ctxt� b  rw��� m  ru�� ���  c d  � o  uv�k�k "0 fbscraperfolder FBScraperFolder�l  � m  lo���                                                                                  sevs  alis    �  Macintosh HD               ���H+  ��System Events.app                                              �����        ����  	                CoreServices    ���      ���    ������  =Macintosh HD:System: Library: CoreServices: System Events.app   $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��  � ��� I }��j��i
�j .sysodelanull��� ��� nmbr� m  }��� ?ə������i  � ��� O ����� I ���h��g
�h .prcskcodnull���     ****� m  ���f�f $�g  � m  �����                                                                                  sevs  alis    �  Macintosh HD               ���H+  ��System Events.app                                              �����        ����  	                CoreServices    ���      ���    ������  =Macintosh HD:System: Library: CoreServices: System Events.app   $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��  � ��� I ���e��d
�e .sysodelanull��� ��� nmbr� m  ���� ?ə������d  � ��� O ����� I ���c��b
�c .prcskprsnull���     ctxt� b  ����� b  ����� b  ����� o  ���a�a 0 editorcommand EditorCommand� m  ���� ���   � o  ���`�` 0 pg  � m  ���� ��� 
 . h t m l�b  � m  �����                                                                                  sevs  alis    �  Macintosh HD               ���H+  ��System Events.app                                              �����        ����  	                CoreServices    ���      ���    ������  =Macintosh HD:System: Library: CoreServices: System Events.app   $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��  � ��� I ���_��^
�_ .sysodelanull��� ��� nmbr� m  ���� ?ə������^  � ��]� O ����� I ���\��[
�\ .prcskcodnull���     ****� m  ���Z�Z $�[  � m  �����                                                                                  sevs  alis    �  Macintosh HD               ���H+  ��System Events.app                                              �����        ����  	                CoreServices    ���      ���    ������  =Macintosh HD:System: Library: CoreServices: System Events.app   $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��  �]  � m  =@���                                                                                      @ alis    l  Macintosh HD               ���H+  ��STerminal.app                                                   ����P��        ����  	                	Utilities     ���      �P��    ��S��  2Macintosh HD:Applications: Utilities: Terminal.app    T e r m i n a l . a p p    M a c i n t o s h   H D  #Applications/Utilities/Terminal.app   / ��  � ��� I ���Y��X
�Y .sysodelanull��� ��� nmbr� ]  ����� o  ���W�W 0 
page_flips  � m  ���� ?ə������X  � ��� O ����� I ���V� 
�V .prcskcodnull���     ****� m  ���U�U    �T�S
�T 
faal m  ���R
�R eMdsKcmd�S  � m  ���                                                                                  sevs  alis    �  Macintosh HD               ���H+  ��System Events.app                                              �����        ����  	                CoreServices    ���      ���    ������  =Macintosh HD:System: Library: CoreServices: System Events.app   $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��  �  I ���Q�P
�Q .sysodelanull��� ��� nmbr m  ���O�O �P    O �	 I ��N

�N .prcskcodnull���     ****
 m  ���M�M 	 �L�K
�L 
faal m  ���J
�J eMdsKcmd�K  	 m  ���                                                                                  sevs  alis    �  Macintosh HD               ���H+  ��System Events.app                                              �����        ����  	                CoreServices    ���      ���    ������  =Macintosh HD:System: Library: CoreServices: System Events.app   $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��    I �I�H
�I .sysodelanull��� ��� nmbr m  �G�G �H    O 	 I �F
�F .prcskcodnull���     **** m  �E�E  �D�C
�D 
faal m  �B
�B eMdsKcmd�C   m  	�                                                                                  sevs  alis    �  Macintosh HD               ���H+  ��System Events.app                                              �����        ����  	                CoreServices    ���      ���    ������  =Macintosh HD:System: Library: CoreServices: System Events.app   $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��    I %�A�@
�A .sysodelanull��� ��� nmbr ]  ! o  �?�? 0 
page_flips   m    ?ə������@     O &:!"! I ,9�>#$
�> .prcskcodnull���     ****# m  ,/�=�= $ �<%�;
�< 
faal% m  25�:
�: eMdsKcmd�;  " m  &)&&�                                                                                  sevs  alis    �  Macintosh HD               ���H+  ��System Events.app                                              �����        ����  	                CoreServices    ���      ���    ������  =Macintosh HD:System: Library: CoreServices: System Events.app   $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��    '(' I ;B�9)�8
�9 .sysodelanull��� ��� nmbr) m  ;>** ?�      �8  ( +,+ I CP�7-�6
�7 .ascrcmnt****      � ****- b  CL./. b  CH010 m  CF22 �33 R         E x t r a c t i n g   d a t a   &   c r e a t i n g   C S V   f i l e :  1 o  FG�5�5 0 pg  / m  HK44 �55  . c s v�6  , 676 O  Q�898 k  W�:: ;<; I W\�4�3�2
�4 .aevtrappnull��� ��� null�3  �2  < =>= I ]b�1�0�/
�1 .miscactvnull��� ��� null�0  �/  > ?@? I ch�.A�-
�. .sysodelanull��� ��� nmbrA m  cd�,�, �-  @ BCB O iyDED I ox�+F�*
�+ .prcskprsnull���     ctxtF b  otGHG m  orII �JJ ( p y t h o n   f b s c r a p e r . p y  H o  rs�)�) 0 pg  �*  E m  ilKK�                                                                                  sevs  alis    �  Macintosh HD               ���H+  ��System Events.app                                              �����        ����  	                CoreServices    ���      ���    ������  =Macintosh HD:System: Library: CoreServices: System Events.app   $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��  C LML I z��(N�'
�( .sysodelanull��� ��� nmbrN m  z}OO ?ə������'  M PQP O ��RSR I ���&T�%
�& .prcskcodnull���     ****T m  ���$�$ $�%  S m  ��UU�                                                                                  sevs  alis    �  Macintosh HD               ���H+  ��System Events.app                                              �����        ����  	                CoreServices    ���      ���    ������  =Macintosh HD:System: Library: CoreServices: System Events.app   $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��  Q V�#V I ���"W�!
�" .sysodelanull��� ��� nmbrW ]  ��XYX o  ��� �  0 
page_flips  Y m  ��ZZ ?�      �!  �#  9 m  QT[[�                                                                                      @ alis    l  Macintosh HD               ���H+  ��STerminal.app                                                   ����P��        ����  	                	Utilities     ���      �P��    ��S��  2Macintosh HD:Applications: Utilities: Terminal.app    T e r m i n a l . a p p    M a c i n t o s h   H D  #Applications/Utilities/Terminal.app   / ��  7 \�\ Z  ��]^��] o  ���� 0 show_scraped_html  ^ O  ��_`_ k  ��aa bcb I �����
� .aevtrappnull��� ��� null�  �  c ded I �����
� .miscactvnull��� ��� null�  �  e fgf I ���h�
� .sysodelanull��� ��� nmbrh m  ���� �  g iji I ���k�
� .GURLGURLnull��� ��� TEXTk b  ��lml b  ��non b  ��pqp m  ��rr �ss  f i l e : / /q o  ���� "0 fbscraperfolder FBScraperFoldero o  ���� 0 pg  m m  ��tt �uu  - s c r a p e d . h t m l�  j vwv I ���x�
� .sysodelanull��� ��� nmbrx m  ���� �  w y�y I ���
z�	
�
 .ascrcmnt****      � ****z m  ��{{ �||          C o m p l e t e d�	  �  ` m  ��}}�                                                                                  rimZ  alis    p  Macintosh HD               ���H+  ��Google Chrome 2.app                                            U��=        ����  	                Applications    ���      ��    ��  .Macintosh HD:Applications: Google Chrome 2.app  (  G o o g l e   C h r o m e   2 . a p p    M a c i n t o s h   H D   Applications/Google Chrome 2.app  / ��  �  �  �  �� 0 pg   o  �� 
0 pgs Pgs��  ��   ~�~ l     ����  �  �  �       ���   �
� .aevtoappnull  �   � ****� ��� ������
� .aevtoappnull  �   � ****� k    ���  ��  $��  2��  >��  J��  V��  b��  i��  z�� ����  �   ��  � ������ 0 grp  �� 0 pg  � @ �� )���������������������� ���(������ ����� ��������������� �������24���]��y{�����&��A�����24Irt{�� 0 editorcommand EditorCommand�� "0 fbscraperfolder FBScraperFolder�� 
0 pgs Pgs�� 0 grps Grps�� 2�� 0 
page_flips  �� 0 page_loading_time  �� 0 show_scraped_html  �� 0 i  
�� 
kocl
�� 
cobj
�� .corecnte****       ****�� 0 
currentgrp 
CurrentGrp
�� .aevtrappnull��� ��� null
�� .miscactvnull��� ��� null
�� .sysodelanull��� ��� nmbr
�� .ascrcmnt****      � ****
�� .GURLGURLnull��� ��� TEXT
�� 
faal
�� eMdsKctl
�� eMdsKcmd
�� .prcskcodnull���     ****�� }�� "
�� eMdsKopt�� ~�� �� �� $
�� .prcskprsnull���     ctxt�� 	�� 0 	currentpg 	CurrentPg����E�O�E�OjvE�OjvE�O�E�OlE�OeE�OjE�O��[��l kh  �kE�O�%E�Oa )*j O*j Omj O�a %�%j O�j Olj Oa  ma a a lvl UOkj O %�kha  a a a l UO�j [OY��Oa  a a a a lvl UO�a  j Oa  	a  j UOkj Oa  	a  j UOkj Oa  	a  j UOkj Oa  a !a a l UOkj Oa  a "a a l UOa #j Oa  ma a a lvl UOkj UOa $�%�%a %%j Oa & �*j O*j Omj Oa  	a 'j UOa j Oa  a (�%j )UOa j Oa  	a 'j UOa j Oa  �a *%�%a +%j )UOlj Oa  	a 'j UUO�a  j Oa  ja a l UOkj Oa  a ,a a l UOkj Oa  ka a l UO�a  j Oa  a "a a l UOa #j Oa -�%a .%j Oa & E*j O*j Omj Oa  a /�%j )UOa j Oa  	a 'j UO�a # j UO� 3a  )*j O*j Okj Oa 0�%�%a 1%j Okj UY h[OY�O��[��l kh �kE�Oa 2�%E` 3Oa  �*j O*j Omj O_ 3j Okj O�a 4%_ 3%j O %�kha  a a a l UO�j [OY��Oa  a a a a lvl UO�a  j Oa  	a  j UOkj Oa  	a  j UOkj Oa  	a  j UOkj Oa  a !a a l UOkj Oa  a "a a l UOa #j UOa 5�%�%a 6%j Oa & �*j O*j Omj Oa  	a 'j UOa j Oa  a 7�%j )UOa j Oa  	a 'j UOa j Oa  �a 8%�%a 9%j )UOa j Oa  	a 'j UUO�a  j Oa  ja a l UOkj Oa  a ,a a l UOkj Oa  ka a l UO�a  j Oa  a "a a l UOa #j Oa :�%a ;%j Oa & E*j O*j Omj Oa  a <�%j )UOa j Oa  	a 'j UO�a # j UO� ;a  1*j O*j Okj Oa =�%�%a >%j Okj Oa ?j UY h[OY�Fascr  ��ޭ