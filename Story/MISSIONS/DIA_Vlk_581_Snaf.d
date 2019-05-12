
// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Snaf_Exit (C_INFO)
{
	npc			= Vlk_581_Snaf;
	nr			= 999;
	condition	= DIA_Snaf_Exit_Condition;
	information	= DIA_Snaf_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Snaf_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Snaf_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 				Erstes Mal aufkreuzen
// **************************************************

INSTANCE DIA_Snaf_Hello (C_INFO)
{
	npc				= Vlk_581_Snaf;
	nr				= 2;
	condition		= DIA_Snaf_Hello_Condition;
	information		= DIA_Snaf_Hello_Info;
	permanent		= 0;
	description		= "Jak leci?";
};

FUNC INT DIA_Snaf_Hello_Condition()
{	
	return 1;
};

FUNC VOID DIA_Snaf_Hello_Info()
{
	AI_Output (other, self,"DIA_Snaf_Hello_15_00"); //Jak leci?
	AI_Output (self, other,"DIA_Snaf_Hello_01_01"); //Nienajgorzej! Cz�owiek, kt�ry umie dobrze gotowa�, ma tutaj wielu przyjaci�!
	AI_Output (self, other,"DIA_Snaf_Hello_01_02");	//Chcesz mo�e troch� mojej ry�owej zupy?
	AI_Output (other, self,"DIA_Snaf_Hello_15_03"); //Dzi�ki.
	AI_Output (self, other,"DIA_Snaf_Hello_01_04");	//M�g�by� co� dla mnie zrobi�...
	
	CreateInvItem (self,ItFoRice);
	B_GiveInvItems(self,other,ItFoRice,1);
};

// **************************************************
// 				Bring Zutaten
// **************************************************
	var int Snaf_Zutaten; 
	var int Snaf_FreeMBRagout;
// **************************************************

INSTANCE DIA_Snaf_Zutaten (C_INFO)
{
	npc				= Vlk_581_Snaf;
	nr				= 2;
	condition		= DIA_Snaf_Zutaten_Condition;
	information		= DIA_Snaf_Zutaten_Info;
	permanent		= 0;
	description		="Co takiego?";
};

FUNC INT DIA_Snaf_Zutaten_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Snaf_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_Snaf_Zutaten_Info()
{
	AI_Output (other, self,"DIA_Snaf_Zutaten_15_00"); //Co takiego?
	AI_Output (self, other,"DIA_Snaf_Zutaten_01_01"); //Za�o�� si�, �e lubisz sobie dobrze podje��. Opracowa�em w�a�nie nowy przepis: potrawka z chrz�szcza a la Snaf z ry�em i grzybami.
	AI_Output (self, other,"DIA_Snaf_Zutaten_01_02"); //Dostaniesz ile tylko zechcesz, ale potrzebuj� jeszcze 3 chrz�szczy i par� piekielnik�w - 5 powinno wystarczy�.
	
	Info_ClearChoices(DIA_Snaf_Zutaten);
	Info_AddChoice	 (DIA_Snaf_Zutaten, "Chcesz �ebym si� porzyga�?"	,DIA_Snaf_Zutaten_KOTZ);
	Info_AddChoice	 (DIA_Snaf_Zutaten, "Brzmi nie�le."			,DIA_Snaf_Zutaten_DoIt);
};

func void DIA_Snaf_Zutaten_KOTZ()
{
	AI_Output (other, self,"DIA_Snaf_Zutaten_KOTZ_15_00"); //Chcesz, �ebym si� porzyga�?
	AI_Output (self, other,"DIA_Snaf_Zutaten_KOTZ_01_01"); //Nie musisz tego je��, ale powiniene� przynajmniej spr�bowa�! Zreszt�, zawsze mo�esz to komu� odsprzeda�!
	AI_Output (self, other,"DIA_Snaf_Zutaten_KOTZ_01_02"); //Wys�a�em ju� kogo� po sk�adniki, ale �lad po nim zagin��. Pewnie uciek� do Nowego Obozu.
	Snaf_Zutaten = LOG_RUNNING;
	
	Log_CreateTopic(CH1_SnafsRecipe, LOG_MISSION);
	Log_SetTopicStatus(CH1_SnafsRecipe, LOG_RUNNING);
	B_LogEntry( CH1_SnafsRecipe, "Snaf, kucharz mieszkaj�cy w Zewn�trznym Pier�cieniu, wys�a� mnie po 3 chrz�szcze i 5 grzyb�w zwanych piekielnikami, kt�rych potrzebuje do swojego nowego przepisu.");
	
	Info_ClearChoices(DIA_Snaf_Zutaten);
};

func void DIA_Snaf_Zutaten_DoIt()
{
	AI_Output (other, self,"DIA_Snaf_Zutaten_DoIt_15_00"); //Brzmi nie�le.
	AI_Output (self, other,"DIA_Snaf_Zutaten_DoIt_01_01"); //Zatem id�, i przynie� mi potrzebne sk�adniki.
	AI_Output (self, other,"DIA_Snaf_Zutaten_DoIt_01_02"); //Poprzedni cz�owiek, kt�rego wys�a�em nie wr�ci�. Zapewne uciek� do Nowego Obozu.
	Snaf_Zutaten = LOG_RUNNING;
	Snaf_FreeMBRagout = TRUE;
		
    Log_CreateTopic(CH1_SnafsRecipe, LOG_MISSION);
	Log_SetTopicStatus(CH1_SnafsRecipe, LOG_RUNNING);
	B_LogEntry( CH1_SnafsRecipe, "Snaf, kucharz mieszkaj�cy w Zewn�trznym Pier�cieniu, wys�a� mnie po 3 chrz�szcze i 5 grzyb�w zwanych piekielnikami, kt�rych potrzebuje do swojego nowego przepisu. W nagrod� mog� liczy� na darmowe porcje.");		
			
	Info_ClearChoices(DIA_Snaf_Zutaten);	
};

// **************************************************
// 					SUCCESS
// **************************************************

INSTANCE DIA_Snaf_ZutatenSuccess (C_INFO)
{
	npc				= Vlk_581_Snaf;
	nr				= 2;
	condition		= DIA_Snaf_ZutatenSuccess_Condition;
	information		= DIA_Snaf_ZutatenSuccess_Info;
	permanent		= 0;
	description		= "Mam przy sobie rzeczy, o kt�re prosi�e�!";
};

FUNC INT DIA_Snaf_ZutatenSuccess_Condition()
{	
	if ( (Snaf_Zutaten==LOG_RUNNING) && (Npc_HasItems(other,ItFo_Plants_Mushroom_01)>=5) && (Npc_HasItems(other,ItAt_Meatbug_01)>=3) )
	{
		return 1;
	};
};

FUNC VOID DIA_Snaf_ZutatenSuccess_Info()
{
	AI_Output (other, self,"DIA_Snaf_ZutatenSuccess_15_00"); //Mam przy sobie rzeczy, o kt�re prosi�e�!
	AI_Output (self, other,"DIA_Snaf_ZutatenSuccess_01_01"); //�wietnie! Teraz musz� je tylko wrzuci� i za chwil� potrawka b�dzie gotowa. Zaczekaj...
	
	CreateInvItems(other, ItFo_Plants_Mushroom_01, 3);
	B_GiveInvItems(other,self,ItFo_Plants_Mushroom_01,8);//Notwendig zur Anzeige 8 Items �bergeben, wird sofort angepasst
	
	Npc_RemoveInvItems(self, ItFo_Plants_Mushroom_01, 8);//Alle Zutaten weg
	Npc_RemoveInvItems(other, ItAt_MeatBug_01, 3);
	
	CreateInvItems(self, ItFoMeatbugragout,3);
	B_GiveInvItems(self, other,ItFoMeatbugragout,3);
	
	Snaf_Zutaten = LOG_SUCCESS;
	
	Log_SetTopicStatus	(CH1_SnafsRecipe, LOG_SUCCESS);
	B_LogEntry			(CH1_SnafsRecipe, "Snaf ucieszy� si�, gdy da�em mu sk�adniki, kt�rych szuka�.");
	
	if Snaf_FreeMBRagout==TRUE
	{
	    B_LogEntry( CH1_SnafsRecipe, "Od tej pory b�dzie mi codziennie dawa� darmow� porcj� swojej nowej potrawy.");
	};
	
	B_GiveXP(100);
	
	AI_StopProcessInfos	(self);
};

// **************************************************
// 					AFTER SUCCESS
// **************************************************
	var int Snaf_RagoutDay;
// **************************************************

INSTANCE DIA_Snaf_AfterSuccess (C_INFO)
{
	npc				= Vlk_581_Snaf;
	nr				= 2;
	condition		= DIA_Snaf_AfterSuccess_Condition;
	information		= DIA_Snaf_AfterSuccess_Info;
	permanent		= 1;
	description		= "Powiedzia�e�, �e mog� dosta� tyle potrawki ile tylko zapragn�...";
};

FUNC INT DIA_Snaf_AfterSuccess_Condition()
{	
	if ( (Snaf_Zutaten==LOG_SUCCESS) && (Snaf_FreeMBRagout==TRUE) )
	{
		return 1;
	};
};

FUNC VOID DIA_Snaf_AfterSuccess_Info()
{
 	AI_Output (other, self,"DIA_Snaf_AfterSuccess_15_00"); //Powiedzia�e�, �e mog� dosta� tyle potrawki ile tylko zapragn�...
 	
 	if (Snaf_RagoutDay!=Wld_GetDay())
 	{
 		AI_Output (self, other,"DIA_Snaf_AfterSuccess_01_01"); //I dotrzymam s�owa. Prosz�, we� te 3 porcje.
		CreateInvItems(self, ItFoMeatbugragout,3);
		B_GiveInvItems(self, other,ItFoMeatbugragout,3);
		Snaf_RagoutDay = Wld_GetDay();
	}
	else
	{
		AI_Output (self, other,"DIA_Snaf_AfterSuccess_01_02"); //Jasne! Ale nic mi ju� dzisiaj nie zosta�o. Wr�� jutro!
	};
};

// **************************************************
// 					Wo Fleischwanzen
// **************************************************

INSTANCE DIA_Snaf_WhereMeatbugs (C_INFO)
{
	npc				= Vlk_581_Snaf;
	nr				= 3;
	condition		= DIA_Snaf_WhereMeatbugs_Condition;
	information		= DIA_Snaf_WhereMeatbugs_Info;
	permanent		= 0;
	description		= "Gdzie mog� znale�� te chrz�szcze?";
};

FUNC INT DIA_Snaf_WhereMeatbugs_Condition()
{	
	if ( (Snaf_Zutaten==LOG_RUNNING) )
	{
		return 1;
	};
};

FUNC VOID DIA_Snaf_WhereMeatbugs_Info()
{
	AI_Output (other, self,"DIA_Snaf_WhereMeatbugs_15_00"); //Gdzie mog� znale�� te chrz�szcze?
	AI_Output (self, other,"DIA_Snaf_WhereMeatbugs_01_01"); //Wsz�dzie, gdzie walaj� si� jakie� odpady. Poszukaj w opuszczonych chatach przy zamkowych murach.
	AI_Output (self, other,"DIA_Snaf_WhereMeatbugs_01_02"); //Tylko niech ci� nie odstraszy ich paskudny wygl�d. Po ugotowaniu s� ca�kiem smaczne.
	AI_Output (self, other,"DIA_Snaf_WhereMeatbugs_01_03"); //Mog� ci� nauczy� jak pozyskiwa� ich mi�so. To �atwa sztuka.
	
    B_LogEntry( CH1_SnafsRecipe, "Chrz�szcze znajd� w opuszczonych chatach, przy zamkowych murach. Snaf mo�e mnie nauczy� jak zdobywa� mi�so tych owad�w.");			
};

// **************************************************
// 					TeachAboutMeatbugs
// **************************************************

instance DIA_Snaf_TeachAboutMeatbugs(C_Info)
{
	npc = VLK_581_Snaf;
	nr = 55;
	condition = DIA_Snaf_TeachAboutMeatbugs_Condition;
	information = DIA_Snaf_TeachAboutMeatbugs_Info;
	permanent = 1;
	description = "Jak zdobywa� mi�so chrz�szczy? (1 punkt nauki)";
};


func int DIA_Snaf_TeachAboutMeatbugs_Condition()
{
	if((Snaf_Zutaten == LOG_RUNNING) && (Knows_GetMeatBugs == FALSE))
	{
		return 1;
	};
};

func void DIA_Snaf_TeachAboutMeatbugs_Info()
{
	AI_Output(other,self,"DIA_Snaf_TeachAboutMeatbugs_15_00");	//Jak zdobywa� mi�so chrz�szczy?
	if(other.lp >= 1)
	{
		other.lp = other.lp - 1;
		PrintScreen("Nowa umiej�tno��: Patroszenie owad�w",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"DIA_Snaf_TeachAboutMeatbugs_01_01");	//Na pocz�tku musisz naci�� delikatnie sk�r� tu� przy samym pancerzu. 
		AI_Output(self,other,"DIA_Snaf_TeachAboutMeatbugs_01_02");	//Gdy ju� to zrobisz, oderwij go pewnym ruchem i wytnij mi�so.
		Knows_GetMeatBugs = true;
		Log_CreateTopic(GE_AnimalTrophies,LOG_NOTE);
		B_LogEntry(GE_AnimalTrophies,"Umiej�tno�� zdobywania mi�sa chrz�szczy.");
	}
	else
	{
		AI_Output(self,other,"DIA_Snaf_TeachAboutMeatbugs_01_03");	//Musisz nabra� troch� wi�cej do�wiadczenia.
	};
};

// **************************************************
// 					Where Mushrooms
// **************************************************

INSTANCE DIA_Snaf_WhereMushrooms (C_INFO)
{
	npc				= Vlk_581_Snaf;
	nr				= 4;
	condition		= DIA_Snaf_WhereMushrooms_Condition;
	information		= DIA_Snaf_WhereMushrooms_Info;
	permanent		= 0;
	description		= "Gdzie znajd� te piekielniki?";
};

FUNC INT DIA_Snaf_WhereMushrooms_Condition()
{	
	if ( (Snaf_Zutaten==LOG_RUNNING) )
	{
		return 1;
	};
};

FUNC VOID DIA_Snaf_WhereMushrooms_Info()
{
	AI_Output (other, self,"DIA_Snaf_WhereMushrooms_15_00"); //Gdzie znajd� te piekielniki?
	AI_Output (self, other,"DIA_Snaf_WhereMushrooms_01_01"); //Wyjd� z Obozu przez po�udniow� bram�, to ta pod zawalon� wie��. Znajdziesz si� na ��ce, na kt�rej rosn� grzyby.
	
	B_LogEntry( CH1_SnafsRecipe, "Piekielniki rosn� na ��ce, przy zawalonej wie�y po�udniowej bramy.");			
};

// **************************************************
// 					Where Nek
// **************************************************

INSTANCE DIA_Snaf_WhereNek (C_INFO)
{
	npc				= Vlk_581_Snaf;
	nr				= 5;
	condition		= DIA_Snaf_WhereNek_Condition;
	information		= DIA_Snaf_WhereNek_Info;
	permanent		= 0;
	description		= "Kim by� cz�owiek, kt�rego wys�a�e� na poszukiwania przede mn�?";
};

FUNC INT DIA_Snaf_WhereNek_Condition()
{	
	if ( (Snaf_Zutaten==LOG_RUNNING) )
	{
		return 1;
	};
};

FUNC VOID DIA_Snaf_WhereNek_Info()
{
	AI_Output (other, self,"DIA_Snaf_WhereNek_15_00"); //Kim by� cz�owiek, kt�rego wys�a�e� na poszukiwania przede mn�?
	AI_Output (self, other,"DIA_Snaf_WhereNek_01_01"); //Nazywa� si� Nek. Chyba nie czu� si� tu zbyt dobrze. Podejrzewam, �e uciek� do Nowego Obozu.
	AI_Output (self, other,"DIA_Snaf_WhereNek_01_02"); //Wys�a�em go po grzyby, ale nigdy nie wr�ci�...
	
	if	(Sly_LostNek != LOG_SUCCESS)
	&&	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		Log_CreateTopic		(CH1_LostNek,	LOG_MISSION);
		Log_SetTopicStatus	(CH1_LostNek,	LOG_RUNNING);
	};
	B_LogEntry			(CH1_LostNek,	"Snaf wys�a� Neka na poszukiwanie grzyb�w.");
};

// **************************************************
// 					Trade
// **************************************************
instance DIA_SNAF_TRADER(C_Info)
{
	npc = VLK_581_Snaf;
	nr = 3;
	condition = dia_snaf_trader_condition;
	information = dia_snaf_trader_info;
	permanent = 0;
	description = "Mog� co� od ciebie kupi�?";
};


func int dia_snaf_trader_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Snaf_Hello))
	{
		return 1;
	};
};

func void dia_snaf_trader_info()
{
	AI_Output (other, self,"STT_335_Santino_BUY_Info_15_01"); //Mog� co� od ciebie kupi�?
	AI_Output(self,other,"DIA_Snaf_Trader_01_01");	//Je�eli chcesz, to mog� ci sprzeda� cz�� moich zapas�w.
	AI_Output(self,other,"DIA_Snaf_Trader_01_02");	//Mam tu troch� soli i cukru z zamku.
	Log_CreateTopic(GE_TraderOC,LOG_NOTE);
	B_LogEntry(GE_TraderOC,"Snaf mo�e mi sprzeda� sk�adniki do gotowania, g��wnie cukier i s�l.");
};


instance DIA_SNAF_TRADE(C_Info)
{
	npc = VLK_581_Snaf;
	nr = 3;
	condition = dia_snaf_trade_condition;
	information = dia_snaf_trade_info;
	permanent = 1;
	trade = 1;
	description = DIALOG_TRADE;
};


func int dia_snaf_trade_condition()
{
	if(Npc_KnowsInfo(hero,dia_snaf_trader))
	{
		return 1;
	};
};

func void dia_snaf_trade_info()
{
	AI_Output (other, self,"Stt_311_Fisk_Trade_15_00"); //Poka� mi swoje towary.
};




	
	 




