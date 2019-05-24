// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE Info_Swiney_EXIT(C_INFO)
{
	npc			= SfB_1037_Swiney ;
	nr			= 999;
	condition	= Info_Swiney_EXIT_Condition;
	information	= Info_Swiney_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_Swiney_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Swiney_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 						Hallo
// ************************************************************

INSTANCE Info_Swiney_Hello(C_INFO)
{
	npc			= SfB_1037_Swiney;
	nr			= 1;
	condition	= Info_Swiney_Hello_Condition;
	information	= Info_Swiney_Hello_Info;
	permanent	= 0;
	description = "Kim jeste�?";
};                       

FUNC INT Info_Swiney_Hello_Condition()
{
	return 1;
};

FUNC VOID Info_Swiney_Hello_Info()
{	
	AI_Output (other, self,"Info_Swiney_Hello_15_00"); //Kim jeste�?
	AI_Output (self, other,"Info_Swiney_Hello_09_01"); //Jestem najlepszym in�ynierem, jakiego ta przekl�ta kolonia kiedykolwiek widzia�a, ch�opcze.
	AI_Output (self, other,"Info_Swiney_Hello_09_02"); //Pilnuj�, �eby nasi ch�opcy nie �ci�gn�li sobie na g�owy sterty kamieni kopi�c w niew�a�ciwym miejscu.
};

// ************************************************************
// 						Sch�rfer
// ************************************************************

INSTANCE Info_Swiney_Schuerfer(C_INFO)
{
	npc			= SfB_1037_Swiney;
	nr			= 1;
	condition	= Info_Swiney_Schuerfer_Condition;
	information	= Info_Swiney_Schuerfer_Info;
	permanent	= 0;
	description = "Chcia�bym do was do��czy�, jako Kret.";
};                       

FUNC INT Info_Swiney_Schuerfer_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Swiney_Hello))
	{
		return 1;
	};
};

FUNC VOID Info_Swiney_Schuerfer_Info()
{	
	AI_Output (other, self,"Info_Swiney_Schuerfer_15_00"); //Chcia�bym do was do��czy�, jako Kret.
	AI_Output (self, other,"Info_Swiney_Schuerfer_09_01"); //Czy�by? Tylko nie oczekuj zbyt wiele po tej robocie. Trzy porcje ry�u na dzie�. Reszt� musisz sobie sam za�atwi�.
	AI_Output (self, other,"Info_Swiney_Schuerfer_09_02"); //Wiesz dlaczego odwalamy ca�� t� brudn� robot�? �eby pewnego dnia m�c wyj�� na wolno�� z tego przekl�tego wi�zienia.
	AI_Output (self, other,"Info_Swiney_Schuerfer_09_03"); //Ca�y nasz urobek jest sk�adowany na wielkim kopcu. Raz w miesi�cu ka�dy z nas dostaje 50 bry�ek, �eby m�c si� porz�dnie upi�.
	AI_Output (self, other,"Info_Swiney_Schuerfer_09_04"); //To najwa�niejsze rzeczy, kt�re powiniene� wiedzie�.
	AI_Output (self, other,"Info_Swiney_Schuerfer_09_05"); //Masz chocia� jakie� do�wiadczenie w tej robocie?
	
	Info_ClearChoices(Info_Swiney_Schuerfer);
	Info_AddChoice   (Info_Swiney_Schuerfer, "Nie."	,Info_Swiney_Schuerfer_Nein);
	Info_AddChoice	 (Info_Swiney_Schuerfer, "Tak." 		,Info_Swiney_Schuerfer_Ja);
};

func void Info_Swiney_Schuerfer_Ja()
{
	AI_Output (other, self,"Info_Swiney_Schuerfer_Ja_15_00"); //Tak.
	AI_Output (self, other,"Info_Swiney_Schuerfer_Ja_09_01"); //To �wietnie! Zatem wiesz, na co nale�y uwa�a�. Masz tu sw�j str�j roboczy. Kilof musisz znale�� sobie sam. Mi�ej zabawy.
	CreateInvItem (self, SFB_ARMOR_L);
	B_GiveInvItems(self, hero, SFB_ARMOR_L, 1);
	
	Info_ClearChoices(Info_Swiney_Schuerfer);
};

func void Info_Swiney_Schuerfer_Nein()
{
	AI_Output (other, self,"Info_Swiney_Schuerfer_Nein_15_00"); //Nie.
	AI_Output (self, other,"Info_Swiney_Schuerfer_Nein_09_01"); //No jasne! Dlaczego to zawsze ja musz� was u�wiadamia�. S�uchaj uwa�nie: we� te ciuchy i za�� je na siebie - tutaj.
	AI_Output (self, other,"Info_Swiney_Schuerfer_Nein_09_02"); //Gdyby kawa�ek rudy spad� ci na bos� stop�, zosta�by� kalek� do ko�ca �ycia. Oczywi�cie wtedy by�by� dla nas znacznie mniej przydatny.
	AI_Output (self, other,"Info_Swiney_Schuerfer_Nein_09_03"); //Gdzie� w pobli�u powinien le�e� jaki� kilof.
	AI_Output (self, other,"Info_Swiney_Schuerfer_Nein_09_04"); //Oczywi�cie wiele z nim nie zdzia�asz... M�wi si� trudno...
	
	CreateInvItem (self, SFB_ARMOR_L);
	B_GiveInvItems(self, hero, SFB_ARMOR_L, 1);
	
	Info_ClearChoices(Info_Swiney_Schuerfer);
};

// ************************************************************
// 							PERM
// ************************************************************

INSTANCE Info_Swiney_PERM(C_INFO)
{
	npc			= SfB_1037_Swiney;
	nr			= 1;
	condition	= Info_Swiney_PERM_Condition;
	information	= Info_Swiney_PERM_Info;
	permanent	= 1;
	description = "Jak du�o rudy uda�o si� wam uzbiera� do tej pory?";
};                       

FUNC INT Info_Swiney_PERM_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Swiney_Schuerfer)) 
	{
		return 1;
	};
};

FUNC VOID Info_Swiney_PERM_Info()
{	
	AI_Output (other, self,"Info_Swiney_PERM_15_00"); //Jak du�o rudy uda�o si� wam uzbiera� do tej pory?
	AI_Output (self, other,"Info_Swiney_PERM_09_01"); //Magowie m�wi�, �e mamy ju� niemal ca�� potrzebn� ilo��. Kiedy b�dziesz w Nowym Obozie rzu� okiem na kopiec.
	AI_StopProcessInfos	(self);
};

instance  Swiney_START_LEARN (C_INFO)
{
	npc					= SfB_1037_Swiney;
	condition			= Swiney_START_LEARN_Condition;
	information		= Swiney_START_LEARN_Info;
	important			= 0;
	permanent		= 1;
	nr 					= 800;
	description		= "Naucz mnie kopa� rud� (5 punkt�w nauki)."; 
};

FUNC int  Swiney_START_LEARN_Condition()
{	
		if (Npc_GetTalentSkill(hero, NPC_TALENT_REGENERATE) == 0) && (Npc_KnowsInfo(hero,Info_Swiney_Hello))
		{
		return 1;
		};
};

FUNC void  Swiney_START_LEARN_Info()
{
	AI_Output (other, self,"Swiney_START_LEARN_Info_15_01"); //Naucz mnie kopa� rud�.
	if ((hero.lp >=5))
	{
	if (Npc_GetTrueGuild(other) == GIL_SFB)
	{
	AI_Output (self, other,"Swiney_START_LEARN_Info_04_02"); //Pocz�tki nie s� zbyt trudne. Musisz umie� odpowiednio uderzy�. 
	AI_Output (self, other,"Swiney_START_LEARN_Info_04_03"); //Najwa�niejsza jest rozwaga. WIelu g�rnik�w zgin�o przyci�ni�tych przez ska�y, bo uderzali zbyt mocno.
	AI_Output (self, other,"Swiney_START_LEARN_Info_04_04"); //Z kolei inni kopali dniami i nocami bez rezultatu, bo uderzali zbyt s�abo lub kopali w nieodpowiednim miejscu.
	AI_Output (self, other,"Swiney_START_LEARN_Info_04_05"); //Uderzaj kilka razy lekko, aby zbada� ska�� i nieco j� rozbi�. Potem uderz silnie lub nawet bardzo silnie.
	AI_Output (self, other,"Swiney_START_LEARN_Info_04_06"); //Je�eli b�dziesz mia� troch� szcz�cia szybko wydob�dziesz bry�ki.
	AI_Output (self, other,"Swiney_START_LEARN_Info_04_07"); //Jeszcze jedno, pami�taj, �e ka�da �y�a rudy kiedy� si� sko�czy.
	hero.lp = hero.lp - 5;
	Npc_SetTalentSkill(hero, NPC_TALENT_REGENERATE, 1);
	PrintScreen	("Nowa umiej�tno��: G�rnictwo", -1,-1,"FONT_OLD_20_WHITE.tga",2);
	//PrintS_Ext ("Nowa umiej�tno��: G�rnictwo",COL_Lime);
	}
	else
	{
	if (Npc_HasItems (hero, ItMiNugget)>=50)
	{
	AI_Output (self, other,"Swiney_START_LEARN_Info_04_02"); //Pocz�tki nie s� zbyt trudne. Musisz umie� odpowiednio uderzy�. 
	AI_Output (self, other,"Swiney_START_LEARN_Info_04_03"); //Najwa�niejsza jest rozwaga. WIelu g�rnik�w zgin�o przyci�ni�tych przez ska�y, bo uderzali zbyt mocno.
	AI_Output (self, other,"Swiney_START_LEARN_Info_04_04"); //Z kolei inni kopali dniami i nocami bez rezultatu, bo uderzali zbyt s�abo lub kopali w nieodpowiednim miejscu.
	AI_Output (self, other,"Swiney_START_LEARN_Info_04_05"); //Uderzaj kilka razy lekko, aby zbada� ska�� i nieco j� rozbi�. Potem uderz silnie lub nawet bardzo silnie.
	AI_Output (self, other,"Swiney_START_LEARN_Info_04_06"); //Je�eli b�dziesz mia� troch� szcz�cia szybko wydob�dziesz bry�ki.
	AI_Output (self, other,"Swiney_START_LEARN_Info_04_07"); //Jeszcze jedno, pami�taj, �e ka�da �y�a rudy kiedy� si� sko�czy.
	B_GiveInvItems (other,self, itminugget, 50);
	hero.lp = hero.lp - 5;
	Npc_SetTalentSkill(hero, NPC_TALENT_REGENERATE, 1);
	PrintScreen	("Nowa umiej�tno��: G�rnictwo", -1,-1,"FONT_OLD_20_WHITE.tga",2);
	}
	else
	{
	AI_Output (self, other,"Swiney_START_LEARN_Info_04_08"); //Nauka kosztuje 50 bry�ek!
	};
	};
	}
	else
	{
	AI_Output (self, other,"Swiney_START_LEARN_Info_04_09"); //Brakuje ci do�wiadczenia!
	};
};
