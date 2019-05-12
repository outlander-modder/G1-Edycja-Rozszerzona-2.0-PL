
func void gotowanie_s1()
{
	var C_Npc her;
	var C_Npc rock;
	her = Hlp_GetNpc(PC_Hero);
	rock = Hlp_GetNpc(PC_Rockefeller);
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(rock)))
	{
		MONOLOG = GOTOWANIE;
		self.aivar[AIV_INVINCIBLE] = TRUE;
		AI_ProcessInfos(her);
		PrintScreen("Gotowanie",15,30,"FONT_OLD_20_WHITE.TGA",10);
		PrintScreen("Gotowanie pozwala ci na przyrz¹dzanie potraw z odpowiednich sk³adników.",15,34,"FONT_OLD_10_WHITE.TGA",10);
		PrintScreen("Aby coœ ugotowaæ nie musisz posiadaæ ¿adnej umiejêtnoœci.",15,36,"FONT_OLD_10_WHITE.TGA",10);
		PrintScreen("Wystarczy ci tylko przepis i sk³adniki, które znajdziesz lub kupisz u handlarzy.",15,38,"FONT_OLD_10_WHITE.TGA",10);
		PrintScreen("Zupy s¹ skutecznym i tanim sposobem na regeneracjê P¯ i mana.",15,40,"FONT_OLD_10_WHITE.TGA",10);
		PrintScreen("Niektóre posi³ki mog¹ dodawaæ sta³e bonusy twojej postaci.",15,42,"FONT_OLD_10_WHITE.TGA",10);
	};
};


instance DIA_PC_HERO_COOK_EXIT(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = dia_pc_hero_cook_exit_condition;
	information = dia_pc_hero_cook_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_pc_hero_cook_exit_condition()
{
	if(MONOLOG == GOTOWANIE)
	{
		return TRUE;
	};
};

func void dia_pc_hero_cook_exit_info()
{
	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
};


instance DIA_PC_HERO_SOUPS(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = dia_pc_hero_soups_condition;
	information = dia_pc_hero_soups_info;
	permanent = TRUE;
	description = "(Ugotuj zupê)";
};


func int dia_pc_hero_soups_condition()
{
	if(MONOLOG == GOTOWANIE)
	{
		return TRUE;
	};
};

func void dia_pc_hero_soups_info()
{
	Info_ClearChoices(dia_pc_hero_soups);
	Info_AddChoice(dia_pc_hero_soups,DIALOG_BACK,dia_pc_hero_soups_back);
	if(KNOWS_WURZELSUPPE)
	{
		Info_AddChoice(dia_pc_hero_soups,"Zupa korzenna",dia_pc_hero_soups_wurzelsuppe);
	};
	if(KNOWS_MEATBUGRAGOUT)
	{
		Info_AddChoice(dia_pc_hero_soups,"Potrawka z chrz¹szcza",dia_pc_hero_soups_bugssoup);
	};
	if(KNOWS_SCABROTH)
	{
		Info_AddChoice(dia_pc_hero_soups,"Rosó³ ze œcierwojada",dia_pc_hero_soups_scabroth);
	};
	if(KNOWS_CRAWLERSOUP)
	{
		Info_AddChoice(dia_pc_hero_soups,"Zupa z pe³zacza",dia_pc_hero_soups_crwsoup);
	};
	if(KNOWS_MUSHROOMSSOUP)
	{
		Info_AddChoice(dia_pc_hero_soups,"Zupa grzybowa",dia_pc_hero_soups_mushroomssoup);
	};
	if(KNOWS_HUNTERSSTEW)
	{
		Info_AddChoice(dia_pc_hero_soups,"Gulasz myœliwski",dia_pc_hero_soups_huntersstew);
	};
	if(KNOWS_BERRYSSOUP)
	{
		Info_AddChoice(dia_pc_hero_soups,"Zupa jagodowa",dia_pc_hero_soups_berryssoup);
	};
	if(KNOWS_MOLERATSOUP)
	{
		Info_AddChoice(dia_pc_hero_soups,"T³usty gulasz",dia_pc_hero_soups_fatstew);
	};
	if(KNOWS_RICESTEW)
	{
		Info_AddChoice(dia_pc_hero_soups,"Gulasz z ry¿em",dia_pc_hero_soups_ricestew);
	};
};

func void dia_pc_hero_soups_back()
{
	Info_ClearChoices(dia_pc_hero_soups);
};

func void dia_pc_hero_soups_ricestew()
{
	if((Npc_HasItems(hero,ItFoRice) >= 3) && (Npc_HasItems(hero,ItFoMuttonRaw) >= 2) && (Npc_HasItems(hero,ItMi_Alchemy_Salt_01) >= 1) && (Npc_HasItems(hero,ItFo_Plants_mushroom_02) >= 4))
	{
		CreateInvItem(hero,itfohuntersstew);
		Npc_RemoveInvItems(hero,ItFoRice,3);
		Npc_RemoveInvItems(hero,ItFoMuttonRaw,2);
		Npc_RemoveInvItems(hero,ItMi_Alchemy_Salt_01,1);
		Npc_RemoveInvItems(hero,ItFo_Plants_mushroom_02,4);
		Print("Ugotowa³eœ gulasz z ry¿em!");
		B_GiveXP(5);
	}
	else
	{
		Print("Nie masz sk³adników!");
		AI_StopProcessInfos(self);
	};
	Info_ClearChoices(dia_pc_hero_soups);
	Info_AddChoice(dia_pc_hero_soups,DIALOG_BACK,dia_pc_hero_soups_back);
	if(KNOWS_WURZELSUPPE)
	{
		Info_AddChoice(dia_pc_hero_soups,"Zupa korzenna",dia_pc_hero_soups_wurzelsuppe);
	};
	if(KNOWS_MEATBUGRAGOUT)
	{
		Info_AddChoice(dia_pc_hero_soups,"Potrawka z chrz¹szcza",dia_pc_hero_soups_bugssoup);
	};
	if(KNOWS_SCABROTH)
	{
		Info_AddChoice(dia_pc_hero_soups,"Rosó³ ze œcierwojada",dia_pc_hero_soups_scabroth);
	};
	if(KNOWS_CRAWLERSOUP)
	{
		Info_AddChoice(dia_pc_hero_soups,"Zupa z pe³zacza",dia_pc_hero_soups_crwsoup);
	};
	if(KNOWS_MUSHROOMSSOUP)
	{
		Info_AddChoice(dia_pc_hero_soups,"Zupa grzybowa",dia_pc_hero_soups_mushroomssoup);
	};
	if(KNOWS_HUNTERSSTEW)
	{
		Info_AddChoice(dia_pc_hero_soups,"Gulasz myœliwski",dia_pc_hero_soups_huntersstew);
	};
	if(KNOWS_BERRYSSOUP)
	{
		Info_AddChoice(dia_pc_hero_soups,"Zupa jagodowa",dia_pc_hero_soups_berryssoup);
	};
	if(KNOWS_MOLERATSOUP)
	{
		Info_AddChoice(dia_pc_hero_soups,"T³usty gulasz",dia_pc_hero_soups_fatstew);
	};
	if(KNOWS_RICESTEW)
	{
		Info_AddChoice(dia_pc_hero_soups,"Gulasz z ry¿em",dia_pc_hero_soups_ricestew);
	};
};

func void dia_pc_hero_soups_huntersstew()
{
	if((Npc_HasItems(hero,ItFoMuttonRaw) >= 2) && (Npc_HasItems(hero,ItMi_Alchemy_Salt_01) >= 1) && (Npc_HasItems(hero,ItFo_Plants_Nightshadow_02) >= 1) && (Npc_HasItems(hero,ItFoLoaf) >= 1) && (Npc_HasItems(hero,ItFo_Plants_mushroom_01) >= 1))
	{
		CreateInvItem(hero,itfohuntersstew);
		Npc_RemoveInvItems(hero,ItFoMuttonRaw,2);
		Npc_RemoveInvItems(hero,ItMi_Alchemy_Salt_01,1);
		Npc_RemoveInvItems(hero,ItFo_Plants_Nightshadow_02,1);
		Npc_RemoveInvItems(hero,ItFoLoaf,1);
		Npc_RemoveInvItems(hero,ItFo_Plants_mushroom_01,1);
		Print("Ugotowa³eœ gulasz myœliwski!");
		B_GiveXP(5);
	}
	else
	{
		Print("Nie masz sk³adników!");
		AI_StopProcessInfos(self);
	};
	Info_ClearChoices(dia_pc_hero_soups);
	Info_AddChoice(dia_pc_hero_soups,DIALOG_BACK,dia_pc_hero_soups_back);
	if(KNOWS_WURZELSUPPE)
	{
		Info_AddChoice(dia_pc_hero_soups,"Zupa korzenna",dia_pc_hero_soups_wurzelsuppe);
	};
	if(KNOWS_MEATBUGRAGOUT)
	{
		Info_AddChoice(dia_pc_hero_soups,"Potrawka z chrz¹szcza",dia_pc_hero_soups_bugssoup);
	};
	if(KNOWS_SCABROTH)
	{
		Info_AddChoice(dia_pc_hero_soups,"Rosó³ ze œcierwojada",dia_pc_hero_soups_scabroth);
	};
	if(KNOWS_CRAWLERSOUP)
	{
		Info_AddChoice(dia_pc_hero_soups,"Zupa z pe³zacza",dia_pc_hero_soups_crwsoup);
	};
	if(KNOWS_MUSHROOMSSOUP)
	{
		Info_AddChoice(dia_pc_hero_soups,"Zupa grzybowa",dia_pc_hero_soups_mushroomssoup);
	};
	if(KNOWS_HUNTERSSTEW)
	{
		Info_AddChoice(dia_pc_hero_soups,"Gulasz myœliwski",dia_pc_hero_soups_huntersstew);
	};
	if(KNOWS_BERRYSSOUP)
	{
		Info_AddChoice(dia_pc_hero_soups,"Zupa jagodowa",dia_pc_hero_soups_berryssoup);
	};
	if(KNOWS_MOLERATSOUP)
	{
		Info_AddChoice(dia_pc_hero_soups,"T³usty gulasz",dia_pc_hero_soups_fatstew);
	};
	if(KNOWS_RICESTEW)
	{
		Info_AddChoice(dia_pc_hero_soups,"Gulasz z ry¿em",dia_pc_hero_soups_ricestew);
	};
};

func void dia_pc_hero_soups_berryssoup()
{
	if((Npc_HasItems(hero,ItFo_Plants_Berrys_01) >= 3) && (Npc_HasItems(hero,ItFo_Plants_Seraphis_01) >= 1) && (Npc_HasItems(hero,itmi_alchemy_zucker_01) >= 1) && (Npc_HasItems(hero,ItFo_Potion_Water_01) >= 1))
	{
		CreateInvItem(hero,itfoberryssoup);
		Npc_RemoveInvItems(hero,ItFo_Plants_Berrys_01,3);
		Npc_RemoveInvItems(hero,ItFo_Plants_Seraphis_01,1);
		Npc_RemoveInvItems(hero,itmi_alchemy_zucker_01,1);
		Npc_RemoveInvItems(hero,ItFo_Potion_Water_01,1);
		Print("Ugotowa³eœ zupê jagodow¹!");
		B_GiveXP(5);
	}
	else
	{
		Print("Nie masz sk³adników!");
		AI_StopProcessInfos(self);
	};
	Info_ClearChoices(dia_pc_hero_soups);
	Info_AddChoice(dia_pc_hero_soups,DIALOG_BACK,dia_pc_hero_soups_back);
	if(KNOWS_WURZELSUPPE)
	{
		Info_AddChoice(dia_pc_hero_soups,"Zupa korzenna",dia_pc_hero_soups_wurzelsuppe);
	};
	if(KNOWS_MEATBUGRAGOUT)
	{
		Info_AddChoice(dia_pc_hero_soups,"Potrawka z chrz¹szcza",dia_pc_hero_soups_bugssoup);
	};
	if(KNOWS_SCABROTH)
	{
		Info_AddChoice(dia_pc_hero_soups,"Rosó³ ze œcierwojada",dia_pc_hero_soups_scabroth);
	};
	if(KNOWS_CRAWLERSOUP)
	{
		Info_AddChoice(dia_pc_hero_soups,"Zupa z pe³zacza",dia_pc_hero_soups_crwsoup);
	};
	if(KNOWS_MUSHROOMSSOUP)
	{
		Info_AddChoice(dia_pc_hero_soups,"Zupa grzybowa",dia_pc_hero_soups_mushroomssoup);
	};
	if(KNOWS_HUNTERSSTEW)
	{
		Info_AddChoice(dia_pc_hero_soups,"Gulasz myœliwski",dia_pc_hero_soups_huntersstew);
	};
	if(KNOWS_BERRYSSOUP)
	{
		Info_AddChoice(dia_pc_hero_soups,"Zupa jagodowa",dia_pc_hero_soups_berryssoup);
	};
	if(KNOWS_MOLERATSOUP)
	{
		Info_AddChoice(dia_pc_hero_soups,"T³usty gulasz",dia_pc_hero_soups_fatstew);
	};
	if(KNOWS_RICESTEW)
	{
		Info_AddChoice(dia_pc_hero_soups,"Gulasz z ry¿em",dia_pc_hero_soups_ricestew);
	};
};

func void dia_pc_hero_soups_fatstew()
{
	if((Npc_HasItems(hero,ItMi_Alchemy_Moleratlubric_01) >= 1) && (Npc_HasItems(hero,ItFoMuttonRaw) >= 3) && (Npc_HasItems(hero,ItFo_Plants_Seraphis_01) >= 1) && (Npc_HasItems(hero,ItFoRice) >= 1))
	{
		CreateInvItem(hero,itfomoleratsoup);
		Npc_RemoveInvItems(hero,ItMi_Alchemy_Moleratlubric_01,1);
		Npc_RemoveInvItems(hero,ItFoMuttonRaw,3);
		Npc_RemoveInvItems(hero,ItFo_Plants_Seraphis_01,1);
		Npc_RemoveInvItems(hero,ItFoRice,1);
		Print("Ugotowa³eœ t³usty gulasz!");
		B_GiveXP(5);
	}
	else
	{
		Print("Nie masz sk³adników!");
		AI_StopProcessInfos(self);
	};
	Info_ClearChoices(dia_pc_hero_soups);
	Info_AddChoice(dia_pc_hero_soups,DIALOG_BACK,dia_pc_hero_soups_back);
	if(KNOWS_WURZELSUPPE)
	{
		Info_AddChoice(dia_pc_hero_soups,"Zupa korzenna",dia_pc_hero_soups_wurzelsuppe);
	};
	if(KNOWS_MEATBUGRAGOUT)
	{
		Info_AddChoice(dia_pc_hero_soups,"Potrawka z chrz¹szcza",dia_pc_hero_soups_bugssoup);
	};
	if(KNOWS_SCABROTH)
	{
		Info_AddChoice(dia_pc_hero_soups,"Rosó³ ze œcierwojada",dia_pc_hero_soups_scabroth);
	};
	if(KNOWS_CRAWLERSOUP)
	{
		Info_AddChoice(dia_pc_hero_soups,"Zupa z pe³zacza",dia_pc_hero_soups_crwsoup);
	};
	if(KNOWS_MUSHROOMSSOUP)
	{
		Info_AddChoice(dia_pc_hero_soups,"Zupa grzybowa",dia_pc_hero_soups_mushroomssoup);
	};
	if(KNOWS_HUNTERSSTEW)
	{
		Info_AddChoice(dia_pc_hero_soups,"Gulasz myœliwski",dia_pc_hero_soups_huntersstew);
	};
	if(KNOWS_BERRYSSOUP)
	{
		Info_AddChoice(dia_pc_hero_soups,"Zupa jagodowa",dia_pc_hero_soups_berryssoup);
	};
	if(KNOWS_MOLERATSOUP)
	{
		Info_AddChoice(dia_pc_hero_soups,"T³usty gulasz",dia_pc_hero_soups_fatstew);
	};
	if(KNOWS_RICESTEW)
	{
		Info_AddChoice(dia_pc_hero_soups,"Gulasz z ry¿em",dia_pc_hero_soups_ricestew);
	};
};

func void dia_pc_hero_soups_wurzelsuppe()
{
	if((Npc_HasItems(hero,ItFo_Plants_Stoneroot_01) >= 2) && (Npc_HasItems(hero,ItFo_Plants_Stoneroot_02) >= 1) && (Npc_HasItems(hero,ItMi_Alchemy_Salt_01) >= 1))
	{
		CreateInvItem(hero,ItFoSoup);
		Npc_RemoveInvItems(hero,ItFo_Plants_Stoneroot_01,2);
		Npc_RemoveInvItems(hero,ItFo_Plants_Stoneroot_02,1);
		Npc_RemoveInvItems(hero,ItMi_Alchemy_Salt_01,1);
		Print("Ugotowa³eœ zupê korzenn¹!");
		B_GiveXP(5);
	}
	else
	{
		Print("Nie masz sk³adników!");
		AI_StopProcessInfos(self);
	};
	Info_ClearChoices(dia_pc_hero_soups);
	Info_AddChoice(dia_pc_hero_soups,DIALOG_BACK,dia_pc_hero_soups_back);
	if(KNOWS_WURZELSUPPE)
	{
		Info_AddChoice(dia_pc_hero_soups,"Zupa korzenna",dia_pc_hero_soups_wurzelsuppe);
	};
	if(KNOWS_MEATBUGRAGOUT)
	{
		Info_AddChoice(dia_pc_hero_soups,"Potrawka z chrz¹szcza",dia_pc_hero_soups_bugssoup);
	};
	if(KNOWS_SCABROTH)
	{
		Info_AddChoice(dia_pc_hero_soups,"Rosó³ ze œcierwojada",dia_pc_hero_soups_scabroth);
	};
	if(KNOWS_CRAWLERSOUP)
	{
		Info_AddChoice(dia_pc_hero_soups,"Zupa z pe³zacza",dia_pc_hero_soups_crwsoup);
	};
	if(KNOWS_MUSHROOMSSOUP)
	{
		Info_AddChoice(dia_pc_hero_soups,"Zupa grzybowa",dia_pc_hero_soups_mushroomssoup);
	};
	if(KNOWS_HUNTERSSTEW)
	{
		Info_AddChoice(dia_pc_hero_soups,"Gulasz myœliwski",dia_pc_hero_soups_huntersstew);
	};
	if(KNOWS_BERRYSSOUP)
	{
		Info_AddChoice(dia_pc_hero_soups,"Zupa jagodowa",dia_pc_hero_soups_berryssoup);
	};
	if(KNOWS_MOLERATSOUP)
	{
		Info_AddChoice(dia_pc_hero_soups,"T³usty gulasz",dia_pc_hero_soups_fatstew);
	};
	if(KNOWS_RICESTEW)
	{
		Info_AddChoice(dia_pc_hero_soups,"Gulasz z ry¿em",dia_pc_hero_soups_ricestew);
	};
};

func void dia_pc_hero_soups_bugssoup()
{
	if((Npc_HasItems(hero,ItAt_Meatbug_01) >= 3) && (Npc_HasItems(hero,ItFo_Plants_mushroom_01) >= 5) && (Npc_HasItems(hero,ItFoRice) >= 2))
	{
		CreateInvItem(hero,ItFoMeatbugragout);
		Npc_RemoveInvItems(hero,ItAt_Meatbug_01,3);
		Npc_RemoveInvItems(hero,ItFo_Plants_mushroom_01,5);
		Npc_RemoveInvItems(hero,ItFoRice,2);
		Print("Ugotowa³eœ potrawkê z chrz¹szcza!");
		B_GiveXP(5);
	}
	else
	{
		Print("Nie masz sk³adników!");
		AI_StopProcessInfos(self);
	};
	Info_ClearChoices(dia_pc_hero_soups);
	Info_AddChoice(dia_pc_hero_soups,DIALOG_BACK,dia_pc_hero_soups_back);
	if(KNOWS_WURZELSUPPE)
	{
		Info_AddChoice(dia_pc_hero_soups,"Zupa korzenna",dia_pc_hero_soups_wurzelsuppe);
	};
	if(KNOWS_MEATBUGRAGOUT)
	{
		Info_AddChoice(dia_pc_hero_soups,"Potrawka z chrz¹szcza",dia_pc_hero_soups_bugssoup);
	};
	if(KNOWS_SCABROTH)
	{
		Info_AddChoice(dia_pc_hero_soups,"Rosó³ ze œcierwojada",dia_pc_hero_soups_scabroth);
	};
	if(KNOWS_CRAWLERSOUP)
	{
		Info_AddChoice(dia_pc_hero_soups,"Zupa z pe³zacza",dia_pc_hero_soups_crwsoup);
	};
	if(KNOWS_MUSHROOMSSOUP)
	{
		Info_AddChoice(dia_pc_hero_soups,"Zupa grzybowa",dia_pc_hero_soups_mushroomssoup);
	};
	if(KNOWS_HUNTERSSTEW)
	{
		Info_AddChoice(dia_pc_hero_soups,"Gulasz myœliwski",dia_pc_hero_soups_huntersstew);
	};
	if(KNOWS_BERRYSSOUP)
	{
		Info_AddChoice(dia_pc_hero_soups,"Zupa jagodowa",dia_pc_hero_soups_berryssoup);
	};
	if(KNOWS_MOLERATSOUP)
	{
		Info_AddChoice(dia_pc_hero_soups,"T³usty gulasz",dia_pc_hero_soups_fatstew);
	};
	if(KNOWS_RICESTEW)
	{
		Info_AddChoice(dia_pc_hero_soups,"Gulasz z ry¿em",dia_pc_hero_soups_ricestew);
	};
};

func void dia_pc_hero_soups_scabroth()
{
	if((Npc_HasItems(hero,ItFoMuttonRaw) >= 3) && (Npc_HasItems(hero,ItMi_Alchemy_Salt_01) >= 1))
	{
		CreateInvItem(hero,itfoscabroth);
		Npc_RemoveInvItems(hero,ItFoMuttonRaw,3);
		Npc_RemoveInvItems(hero,ItMi_Alchemy_Salt_01,1);
		Print("Ugotowa³eœ rosó³ ze œcierwojada!");
		B_GiveXP(5);
	}
	else
	{
		Print("Nie masz sk³adników!");
		AI_StopProcessInfos(self);
	};
	Info_ClearChoices(dia_pc_hero_soups);
	Info_AddChoice(dia_pc_hero_soups,DIALOG_BACK,dia_pc_hero_soups_back);
	if(KNOWS_WURZELSUPPE)
	{
		Info_AddChoice(dia_pc_hero_soups,"Zupa korzenna",dia_pc_hero_soups_wurzelsuppe);
	};
	if(KNOWS_MEATBUGRAGOUT)
	{
		Info_AddChoice(dia_pc_hero_soups,"Potrawka z chrz¹szcza",dia_pc_hero_soups_bugssoup);
	};
	if(KNOWS_SCABROTH)
	{
		Info_AddChoice(dia_pc_hero_soups,"Rosó³ ze œcierwojada",dia_pc_hero_soups_scabroth);
	};
	if(KNOWS_CRAWLERSOUP)
	{
		Info_AddChoice(dia_pc_hero_soups,"Zupa z pe³zacza",dia_pc_hero_soups_crwsoup);
	};
	if(KNOWS_MUSHROOMSSOUP)
	{
		Info_AddChoice(dia_pc_hero_soups,"Zupa grzybowa",dia_pc_hero_soups_mushroomssoup);
	};
	if(KNOWS_HUNTERSSTEW)
	{
		Info_AddChoice(dia_pc_hero_soups,"Gulasz myœliwski",dia_pc_hero_soups_huntersstew);
	};
	if(KNOWS_BERRYSSOUP)
	{
		Info_AddChoice(dia_pc_hero_soups,"Zupa jagodowa",dia_pc_hero_soups_berryssoup);
	};
	if(KNOWS_MOLERATSOUP)
	{
		Info_AddChoice(dia_pc_hero_soups,"T³usty gulasz",dia_pc_hero_soups_fatstew);
	};
	if(KNOWS_RICESTEW)
	{
		Info_AddChoice(dia_pc_hero_soups,"Gulasz z ry¿em",dia_pc_hero_soups_ricestew);
	};
};

func void dia_pc_hero_soups_crwsoup()
{
	if((Npc_HasItems(hero,ItAt_Crawler_01) >= 1) && (Npc_HasItems(hero,ItFo_Plants_mushroom_02) >= 3) && (Npc_HasItems(hero,ItFoLoaf) >= 1))
	{
		CreateInvItem(hero,ItFoCrawlersoup);
		Npc_RemoveInvItems(hero,ItAt_Crawler_01,1);
		Npc_RemoveInvItems(hero,ItFo_Plants_mushroom_02,3);
		Npc_RemoveInvItems(hero,ItFoLoaf,1);
		Print("Ugotowa³eœ zupê z pe³zaczy!");
		B_GiveXP(5);
	}
	else
	{
		Print("Nie masz sk³adników!");
		AI_StopProcessInfos(self);
	};
	Info_ClearChoices(dia_pc_hero_soups);
	Info_AddChoice(dia_pc_hero_soups,DIALOG_BACK,dia_pc_hero_soups_back);
	if(KNOWS_WURZELSUPPE)
	{
		Info_AddChoice(dia_pc_hero_soups,"Zupa korzenna",dia_pc_hero_soups_wurzelsuppe);
	};
	if(KNOWS_MEATBUGRAGOUT)
	{
		Info_AddChoice(dia_pc_hero_soups,"Potrawka z chrz¹szcza",dia_pc_hero_soups_bugssoup);
	};
	if(KNOWS_SCABROTH)
	{
		Info_AddChoice(dia_pc_hero_soups,"Rosó³ ze œcierwojada",dia_pc_hero_soups_scabroth);
	};
	if(KNOWS_CRAWLERSOUP)
	{
		Info_AddChoice(dia_pc_hero_soups,"Zupa z pe³zacza",dia_pc_hero_soups_crwsoup);
	};
	if(KNOWS_MUSHROOMSSOUP)
	{
		Info_AddChoice(dia_pc_hero_soups,"Zupa grzybowa",dia_pc_hero_soups_mushroomssoup);
	};
	if(KNOWS_HUNTERSSTEW)
	{
		Info_AddChoice(dia_pc_hero_soups,"Gulasz myœliwski",dia_pc_hero_soups_huntersstew);
	};
	if(KNOWS_BERRYSSOUP)
	{
		Info_AddChoice(dia_pc_hero_soups,"Zupa jagodowa",dia_pc_hero_soups_berryssoup);
	};
	if(KNOWS_MOLERATSOUP)
	{
		Info_AddChoice(dia_pc_hero_soups,"T³usty gulasz",dia_pc_hero_soups_fatstew);
	};
	if(KNOWS_RICESTEW)
	{
		Info_AddChoice(dia_pc_hero_soups,"Gulasz z ry¿em",dia_pc_hero_soups_ricestew);
	};
};

func void dia_pc_hero_soups_mushroomssoup()
{
	if((Npc_HasItems(hero,ItFo_Plants_mushroom_01) >= 3) && (Npc_HasItems(hero,ItFo_Plants_mushroom_02) >= 2) && (Npc_HasItems(hero,ItFoLoaf) >= 1) && (Npc_HasItems(hero,ItMi_Alchemy_Salt_01) >= 1) && (Npc_HasItems(hero,ItFoWine) >= 1))
	{
		CreateInvItem(hero,itfomushroomssoup);
		Npc_RemoveInvItems(hero,ItFo_Plants_mushroom_01,3);
		Npc_RemoveInvItems(hero,ItFo_Plants_mushroom_02,2);
		Npc_RemoveInvItems(hero,ItFoLoaf,1);
		Npc_RemoveInvItems(hero,ItMi_Alchemy_Salt_01,1);
		Npc_RemoveInvItems(hero,ItFoWine,1);
		Print("Ugotowa³eœ zupê grzybow¹!");
		B_GiveXP(5);
	}
	else
	{
		Print("Nie masz sk³adników!");
		AI_StopProcessInfos(self);
	};
	Info_ClearChoices(dia_pc_hero_soups);
	Info_AddChoice(dia_pc_hero_soups,DIALOG_BACK,dia_pc_hero_soups_back);
	if(KNOWS_WURZELSUPPE)
	{
		Info_AddChoice(dia_pc_hero_soups,"Zupa korzenna",dia_pc_hero_soups_wurzelsuppe);
	};
	if(KNOWS_MEATBUGRAGOUT)
	{
		Info_AddChoice(dia_pc_hero_soups,"Potrawka z chrz¹szcza",dia_pc_hero_soups_bugssoup);
	};
	if(KNOWS_SCABROTH)
	{
		Info_AddChoice(dia_pc_hero_soups,"Rosó³ ze œcierwojada",dia_pc_hero_soups_scabroth);
	};
	if(KNOWS_CRAWLERSOUP)
	{
		Info_AddChoice(dia_pc_hero_soups,"Zupa z pe³zacza",dia_pc_hero_soups_crwsoup);
	};
	if(KNOWS_MUSHROOMSSOUP)
	{
		Info_AddChoice(dia_pc_hero_soups,"Zupa grzybowa",dia_pc_hero_soups_mushroomssoup);
	};
	if(KNOWS_HUNTERSSTEW)
	{
		Info_AddChoice(dia_pc_hero_soups,"Gulasz myœliwski",dia_pc_hero_soups_huntersstew);
	};
	if(KNOWS_BERRYSSOUP)
	{
		Info_AddChoice(dia_pc_hero_soups,"Zupa jagodowa",dia_pc_hero_soups_berryssoup);
	};
	if(KNOWS_MOLERATSOUP)
	{
		Info_AddChoice(dia_pc_hero_soups,"T³usty gulasz",dia_pc_hero_soups_fatstew);
	};
	if(KNOWS_RICESTEW)
	{
		Info_AddChoice(dia_pc_hero_soups,"Gulasz z ry¿em",dia_pc_hero_soups_ricestew);
	};
};

