
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
	text[2] = "Przepis na rosó³ ze œcierwojada";
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
	Doc_PrintLine(nDocID,0,"Rosó³ ze œcierwojada");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Sk³adniki:");
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLines(nDocID,0,"- 3x surowe miêso");
	Doc_PrintLines(nDocID,0,"- 1x sól");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Rosó³ ze œcierwojada jest równie po¿ywny jak i ten z myrtañskich kur. Aby go przygotowaæ nale¿y do garnka z gotuj¹c¹ siê wod¹ wrzuciæ miêso œcierwojada. Przed samym koñcem gotowania nale¿y ju¿ tylko posoliæ i po paru minutach mo¿na jeœæ.");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
	if(KNOWS_SCABROTH == FALSE)
	{
		KNOWS_SCABROTH = TRUE;
		Log_CreateTopic(NOTE_KITCHEN,LOG_NOTE);
		B_LogEntry(NOTE_KITCHEN,"Umiejêtnoœæ przyrz¹dzenia roso³u ze œcierwojada. Sk³adniki: 3x surowe miêso, 1x sól.");
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
	text[2] = "Przepis na gulasz myœliwski";
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
	Doc_PrintLine(nDocID,0,"Gulasz myœliwski");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Sk³adniki:");
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLines(nDocID,0,"- 2x surowe miêso");
	Doc_PrintLines(nDocID,0,"- 1x sól");
	Doc_PrintLines(nDocID,0,"- 1x kocianka");
	Doc_PrintLines(nDocID,0,"- 1x chleb");
	Doc_PrintLines(nDocID,0,"- 2x piekielnik");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Najpierw gotujemy miêso. PóŸniej do wrz¹cego wywaru wrzucamy posiekan¹ kociankê i dwa piekielniki. Gotujemy przez pó³tora godziny, po czym solimy i dodajemy kawa³ki chleba.");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
	if(KNOWS_HUNTERSSTEW == FALSE)
	{
		KNOWS_HUNTERSSTEW = TRUE;
		Log_CreateTopic(NOTE_KITCHEN,LOG_NOTE);
		B_LogEntry(NOTE_KITCHEN,"Umiejêtnoœæ przyrz¹dzenia gulaszu myœliwskiego. Sk³adniki: 2x surowe miêso, 1x kocianka, 1x chleb, 1x sól, 2x piekielnik.");
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
	text[2] = "Przepis na zupê z pe³zaczy";
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
	Doc_PrintLine(nDocID,0,"Zupa z pe³zaczy");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Sk³adniki:");
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLines(nDocID,0,"- 1x wnêtrznoœci pe³zacza");
	Doc_PrintLines(nDocID,0,"- 1x sól");
	Doc_PrintLines(nDocID,0,"- 3x gorzki chleb");
	Doc_PrintLines(nDocID,0,"- 1x chleb");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Zanim wrzucimy wszystko do garnka musimy odpowiednio oporz¹dziæ pe³zacza. Wyci¹gamy jego wnêtrznoœci i pozbywamy siê z nich ¿o³¹dka oraz wiadomych elementów jelit. gdy to zrobimy wrzucamy flaki do wrz¹cej wody i intensywnie solimy. PóŸniej dodajemy posiekane grzyby i kawa³ki chleba.");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
	if(KNOWS_CRAWLERSOUP == FALSE)
	{
		KNOWS_CRAWLERSOUP = TRUE;
		Log_CreateTopic(NOTE_KITCHEN,LOG_NOTE);
		B_LogEntry(NOTE_KITCHEN,"Umiejêtnoœæ przyrz¹dzenia zupy z pe³zaczy. Sk³adniki: 1x wnêtrznoœci pe³zacza, 3x gorzki chleb, 1x chleb, 1x sól.");
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
	text[2] = "Przepis na zupê grzybow¹";
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
	Doc_PrintLine(nDocID,0,"Sk³adniki:");
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLines(nDocID,0,"- 3x piekielnik");
	Doc_PrintLines(nDocID,0,"- 2x gorzki chleb");
	Doc_PrintLines(nDocID,0,"- 1x chleb");
	Doc_PrintLines(nDocID,0,"- 1x sól");
	Doc_PrintLines(nDocID,0,"- 1x wino");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Nagrzewamy wodê, do której wrzucamy posiekane w kostkê grzyby. Gotujemy je pó³ godziny po czym solimy. Na koniec podlewamy lekko winem. Zupê podajemy z chlebem.");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
	if(KNOWS_MUSHROOMSSOUP == FALSE)
	{
		KNOWS_MUSHROOMSSOUP = TRUE;
		Log_CreateTopic(NOTE_KITCHEN,LOG_NOTE);
		B_LogEntry(NOTE_KITCHEN,"Umiejêtnoœæ przyrz¹dzenia zupy grzybowej. Sk³adniki: 3x piekielnik, 2x gorzki chleb, 1x serafis, 1x chleb, 1x sól, 1x wino.");
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
	text[2] = "Przepis na zupê jagodow¹";
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
	Doc_PrintLine(nDocID,0,"Sk³adniki:");
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLines(nDocID,0,"- 3x jagody");
	Doc_PrintLines(nDocID,0,"- 1x serafis");
	Doc_PrintLines(nDocID,0,"- 1x cukier");
	Doc_PrintLines(nDocID,0,"- 1x woda");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Do nagrzanej wody dorzucamy zebrane w lesie jagody. PóŸniej dodajemy owoce serafisa bez liœci. Na koniec delikatnie s³odzimy i dolewamy wody, je¿eli przesadziliœmy.");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
	if(KNOWS_BERRYSSOUP == FALSE)
	{
		KNOWS_BERRYSSOUP = TRUE;
		Log_CreateTopic(NOTE_KITCHEN,LOG_NOTE);
		B_LogEntry(NOTE_KITCHEN,"Umiejêtnoœæ przyrz¹dzenia zupy jagodowej. Sk³adniki: 3x jagody, 3x surowe miêso, 1x serafis, 1x cukier, 1x woda.");
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
	text[2] = "Przepis na t³usty gulasz";
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
	Doc_PrintLine(nDocID,0,"T³usty gulasz");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Sk³adniki:");
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLines(nDocID,0,"- 1x sad³o kretoszczura");
	Doc_PrintLines(nDocID,0,"- 3x surowe miêso");
	Doc_PrintLines(nDocID,0,"- 1x serafis");
	Doc_PrintLines(nDocID,0,"- 1x ry¿");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Gotujemy miêso i sad³o kretoszczura do czasu a¿ woda bêdzie bardzo t³usta. Nastêpnie dodajemy ry¿ i posiekane liœcie serafisa. ");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
	if(KNOWS_MOLERATSOUP == FALSE)
	{
		KNOWS_MOLERATSOUP = TRUE;
		Log_CreateTopic(NOTE_KITCHEN,LOG_NOTE);
		B_LogEntry(NOTE_KITCHEN,"Umiejêtnoœæ przyrz¹dzenia t³ustego gulaszu. Sk³adniki: 1x sad³o kretoszczura, 3x surowe miêso, 1x serafis, 1x ry¿.");
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
	text[2] = "Przepis na zupê korzenn¹";
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
	Doc_PrintLine(nDocID,0,"Sk³adniki:");
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLines(nDocID,0,"- 2x twardzieñ");
	Doc_PrintLines(nDocID,0,"- 1x dragot");
	Doc_PrintLines(nDocID,0,"- 1x sól");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Efektem wrzucenia do gara tych sk³adników bêdzie smaczna zupa odnawiaj¹ca magiczne si³y ka¿dego maga czy nowicjusza. ");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
	if(KNOWS_WURZELSUPPE == FALSE)
	{
		KNOWS_WURZELSUPPE = TRUE;
		Log_CreateTopic(NOTE_KITCHEN,LOG_NOTE);
		B_LogEntry(NOTE_KITCHEN,"Umiejêtnoœæ przyrz¹dzenia zupy korzennej. Sk³adniki: 2x twardzieñ, 1x dragot, 1x sól.");
	};
};

