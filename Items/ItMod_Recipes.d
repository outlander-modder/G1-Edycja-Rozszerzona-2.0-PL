
const string NAME_RECIPTE_MOD = "Przepis";

instance ITWR_RECIPTE_SCABROTH(C_Item) //u Snafa
{
	name = NAME_RECIPTE_MOD;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 25;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_recipte1;
	scemeName = "MAP";
	description = name;
	text[2] = "Przepis na ros� ze �cierwojada";
	text[4] = NAME_Value;
	count[4] = value;
};

func void use_recipte1()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,"font_15_book.tga");
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"Ros� ze �cierwojada");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Sk�adniki:");
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLines(nDocID,0,"- 3x surowe mi�so");
	Doc_PrintLines(nDocID,0,"- 1x s�l");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Ros� ze �cierwojada jest r�wnie po�ywny jak i ten z myrta�skich kur. Aby go przygotowa� nale�y do garnka z gotuj�c� si� wod� wrzuci� mi�so �cierwojada. Przed samym ko�cem gotowania nale�y ju� tylko posoli� i po paru minutach mo�na je��.");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
	if(KNOWS_SCABROTH == FALSE)
	{
		KNOWS_SCABROTH = TRUE;
		Log_CreateTopic(NOTE_KITCHEN,LOG_NOTE);
		B_LogEntry(NOTE_KITCHEN,"Umiej�tno�� przyrz�dzenia roso�u ze �cierwojada. Sk�adniki: 3x surowe mi�so, 1x s�l.");
	};
};


instance ITWR_RECIPTE_HUNTERSSTEW(C_Item)
{
	name = NAME_RECIPTE_MOD;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_recipte2;
	scemeName = "MAP";
	description = name;
	text[2] = "Przepis na gulasz my�liwski";
	text[4] = NAME_Value;
	count[4] = value;
};


func void use_recipte2()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,"font_15_book.tga");
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"Gulasz my�liwski");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Sk�adniki:");
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLines(nDocID,0,"- 2x surowe mi�so");
	Doc_PrintLines(nDocID,0,"- 1x s�l");
	Doc_PrintLines(nDocID,0,"- 1x kocianka");
	Doc_PrintLines(nDocID,0,"- 1x chleb");
	Doc_PrintLines(nDocID,0,"- 2x piekielnik");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Najpierw gotujemy mi�so. P�niej do wrz�cego wywaru wrzucamy posiekan� kociank� i dwa piekielniki. Gotujemy przez p�tora godziny, po czym solimy i dodajemy kawa�ki chleba.");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
	if(KNOWS_HUNTERSSTEW == FALSE)
	{
		KNOWS_HUNTERSSTEW = TRUE;
		Log_CreateTopic(NOTE_KITCHEN,LOG_NOTE);
		B_LogEntry(NOTE_KITCHEN,"Umiej�tno�� przyrz�dzenia gulaszu my�liwskiego. Sk�adniki: 2x surowe mi�so, 1x kocianka, 1x chleb, 1x s�l, 2x piekielnik.");
	};
};


instance ITWR_RECIPTE_CRWSOUP(C_Item) //
{
	name = NAME_RECIPTE_MOD;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_recipte3;
	scemeName = "MAP";
	description = name;
	text[2] = "Przepis na zup� z pe�zaczy";
	text[4] = NAME_Value;
	count[4] = value;
};


func void use_recipte3()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,"font_15_book.tga");
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"Zupa z pe�zaczy");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Sk�adniki:");
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLines(nDocID,0,"- 1x wn�trzno�ci pe�zacza");
	Doc_PrintLines(nDocID,0,"- 1x s�l");
	Doc_PrintLines(nDocID,0,"- 3x gorzki chleb");
	Doc_PrintLines(nDocID,0,"- 1x chleb");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Zanim wrzucimy wszystko do garnka musimy odpowiednio oporz�dzi� pe�zacza. Wyci�gamy jego wn�trzno�ci i pozbywamy si� z nich �o��dka oraz wiadomych element�w jelit. gdy to zrobimy wrzucamy flaki do wrz�cej wody i intensywnie solimy. P�niej dodajemy posiekane grzyby i kawa�ki chleba.");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
	if(KNOWS_CRAWLERSOUP == FALSE)
	{
		KNOWS_CRAWLERSOUP = TRUE;
		Log_CreateTopic(NOTE_KITCHEN,LOG_NOTE);
		B_LogEntry(NOTE_KITCHEN,"Umiej�tno�� przyrz�dzenia zupy z pe�zaczy. Sk�adniki: 1x wn�trzno�ci pe�zacza, 3x gorzki chleb, 1x chleb, 1x s�l.");
	};
};


instance ITWR_RECIPTE_MUSHROOMSSOUP(C_Item) //u Snafa
{
	name = NAME_RECIPTE_MOD;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_recipte4;
	scemeName = "MAP";
	description = name;
	text[2] = "Przepis na zup� grzybow�";
	text[4] = NAME_Value;
	count[4] = value;
};


func void use_recipte4()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,"font_15_book.tga");
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"Zupa grzybowa");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Sk�adniki:");
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLines(nDocID,0,"- 3x piekielnik");
	Doc_PrintLines(nDocID,0,"- 2x gorzki chleb");
	Doc_PrintLines(nDocID,0,"- 1x chleb");
	Doc_PrintLines(nDocID,0,"- 1x s�l");
	Doc_PrintLines(nDocID,0,"- 1x wino");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Nagrzewamy wod�, do kt�rej wrzucamy posiekane w kostk� grzyby. Gotujemy je p� godziny po czym solimy. Na koniec podlewamy lekko winem. Zup� podajemy z chlebem.");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
	if(KNOWS_MUSHROOMSSOUP == FALSE)
	{
		KNOWS_MUSHROOMSSOUP = TRUE;
		Log_CreateTopic(NOTE_KITCHEN,LOG_NOTE);
		B_LogEntry(NOTE_KITCHEN,"Umiej�tno�� przyrz�dzenia zupy grzybowej. Sk�adniki: 3x piekielnik, 2x gorzki chleb, 1x serafis, 1x chleb, 1x s�l, 1x wino.");
	};
};


instance ITWR_RECIPTE_BERRYSSOUP(C_Item) //u Silasa
{
	name = NAME_RECIPTE_MOD;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_recipte5;
	scemeName = "MAP";
	description = name;
	text[2] = "Przepis na zup� jagodow�";
	text[4] = NAME_Value;
	count[4] = value;
};


func void use_recipte5()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,"font_15_book.tga");
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"Zupa jagodowa");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Sk�adniki:");
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLines(nDocID,0,"- 3x jagody");
	Doc_PrintLines(nDocID,0,"- 1x serafis");
	Doc_PrintLines(nDocID,0,"- 1x cukier");
	Doc_PrintLines(nDocID,0,"- 1x woda");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Do nagrzanej wody dorzucamy zebrane w lesie jagody. P�niej dodajemy owoce serafisa bez li�ci. Na koniec delikatnie s�odzimy i dolewamy wody, je�eli przesadzili�my.");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
	if(KNOWS_BERRYSSOUP == FALSE)
	{
		KNOWS_BERRYSSOUP = TRUE;
		Log_CreateTopic(NOTE_KITCHEN,LOG_NOTE);
		B_LogEntry(NOTE_KITCHEN,"Umiej�tno�� przyrz�dzenia zupy jagodowej. Sk�adniki: 3x jagody, 3x surowe mi�so, 1x serafis, 1x cukier, 1x woda.");
	};
};


instance ITWR_RECIPTE_MOLERATSOUP(C_Item) //u Snafa
{
	name = NAME_RECIPTE_MOD;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_recipte6;
	scemeName = "MAP";
	description = name;
	text[2] = "Przepis na t�usty gulasz";
	text[4] = NAME_Value;
	count[4] = value;
};


func void use_recipte6()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,"font_15_book.tga");
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"T�usty gulasz");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Sk�adniki:");
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLines(nDocID,0,"- 1x sad�o kretoszczura");
	Doc_PrintLines(nDocID,0,"- 3x surowe mi�so");
	Doc_PrintLines(nDocID,0,"- 1x serafis");
	Doc_PrintLines(nDocID,0,"- 1x ry�");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Gotujemy mi�so i sad�o kretoszczura do czasu a� woda b�dzie bardzo t�usta. Nast�pnie dodajemy ry� i posiekane li�cie serafisa. ");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
	if(KNOWS_MOLERATSOUP == FALSE)
	{
		KNOWS_MOLERATSOUP = TRUE;
		Log_CreateTopic(NOTE_KITCHEN,LOG_NOTE);
		B_LogEntry(NOTE_KITCHEN,"Umiej�tno�� przyrz�dzenia t�ustego gulaszu. Sk�adniki: 1x sad�o kretoszczura, 3x surowe mi�so, 1x serafis, 1x ry�.");
	};
};


instance ITWR_RECIPTE_WURZELSUPPE(C_Item) //u Snafa
{
	name = NAME_RECIPTE_MOD;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_recipte7;
	scemeName = "MAP";
	description = name;
	text[2] = "Przepis na zup� korzenn�";
	text[4] = NAME_Value;
	count[4] = value;
};


func void use_recipte7()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,"font_15_book.tga");
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"Zupa korzenna");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Sk�adniki:");
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLines(nDocID,0,"- 2x twardzie�");
	Doc_PrintLines(nDocID,0,"- 1x dragot");
	Doc_PrintLines(nDocID,0,"- 1x s�l");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Efektem wrzucenia do gara tych sk�adnik�w b�dzie smaczna zupa odnawiaj�ca magiczne si�y ka�dego maga czy nowicjusza. ");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
	if(KNOWS_WURZELSUPPE == FALSE)
	{
		KNOWS_WURZELSUPPE = TRUE;
		Log_CreateTopic(NOTE_KITCHEN,LOG_NOTE);
		B_LogEntry(NOTE_KITCHEN,"Umiej�tno�� przyrz�dzenia zupy korzennej. Sk�adniki: 2x twardzie�, 1x dragot, 1x s�l.");
	};
};

