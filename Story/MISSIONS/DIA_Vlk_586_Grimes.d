// ************************ EXIT **************************

instance VLK_586_Grimes_Exit (C_INFO)
{
	npc			= VLK_586_Grimes;
	nr			= 999;
	condition	= VLK_586_Grimes_Exit_Condition;
	information	= VLK_586_Grimes_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  VLK_586_Grimes_Exit_Condition()
{
	return 1;
};

FUNC VOID  VLK_586_Grimes_Exit_Info()
{
	AI_Output (other, self,"VLK_586_Grimes_Exit_Info_15_01"); //Powodzenia!
	AI_Output (self, other,"VLK_586_Grimes_Exit_Info_04_02"); //Nawzajem, ch�opcze. Nawzajem.
	
	AI_StopProcessInfos	( self );
};




// ***************** Infos *****************************

instance  VLK_586_Grimes_STORY (C_INFO)
{
	npc				= VLK_586_Grimes;
	condition		= VLK_586_Grimes_STORY_Condition;
	information		= VLK_586_Grimes_STORY_Info;
	important		= 0;
	permanent		= 0;
	description		= "Od dawna tu jeste�?"; 
};

FUNC int  VLK_586_Grimes_STORY_Condition()
{	
	if ( Npc_KnowsInfo (hero,VLK_586_Grimes_FIRST) )  
	{
		return 1;
	};

};


FUNC void  VLK_586_Grimes_STORY_Info()
{
	AI_Output (other, self,"VLK_586_Grimes_STORY_Info_15_01"); //Od dawna tu jeste�?
	AI_Output (self, other,"VLK_586_Grimes_STORY_Info_04_02"); //Od ca�ych 10 lat. Uwierz mi, du�o ju� tu widzia�em.
	AI_Output (self, other,"VLK_586_Grimes_STORY_Info_04_03"); //Stawi�em czo�a wielu niebezpiecze�stwom, ale jako� uda�o mi si� z nich wybrn��.
	AI_Output (self, other,"VLK_586_Grimes_STORY_Info_04_04"); //Pami�tam jak pracowali�my jeszcze w pierwszej kopalni, tej, kt�ra teraz stoi pusta. Pewnego dnia nie wytrzyma�y podpory...
	AI_Output (self, other,"VLK_586_Grimes_STORY_Info_04_05"); //Ale to stare dzieje...
};

instance  VLK_586_Grimes_KNOW (C_INFO)
{
	npc				= VLK_586_Grimes;
	condition		= VLK_586_Grimes_KNOW_Condition;
	information		= VLK_586_Grimes_KNOW_Info;
	important		= 0;
	permanent		= 0;
	description		= "Zapewne s�ysza�e� te� o wielu planach ucieczki."; 
};

FUNC int  VLK_586_Grimes_KNOW_Condition()
{	
	if ( Npc_KnowsInfo (hero,VLK_586_Grimes_STORY) )  
	{
		return 1;
	};

};
FUNC void  VLK_586_Grimes_KNOW_Info()
{
	AI_Output (other, self,"VLK_586_Grimes_KNOW_Info_15_01"); //Zapewne s�ysza�e� te� o wielu planach ucieczki.
	AI_Output (self, other,"VLK_586_Grimes_KNOW_Info_04_02"); //Pos�uchaj, ch�opcze. Wiem, �e chcia�by� si� st�d wydosta�, ale zapomnij o tym.
	AI_Output (self, other,"VLK_586_Grimes_KNOW_Info_04_03"); //St�d nie ma ucieczki! Widzia�em twarze tych, kt�rzy pr�bowali sforsowa� Barier�.
	AI_Output (self, other,"VLK_586_Grimes_KNOW_Info_04_04"); //Nie pope�niaj tego samego b��du. Bariera powstrzyma ka�dego.
	AI_Output (other, self,"VLK_586_Grimes_KNOW_Info_15_05"); //Nie chc� sp�dzi� nast�pnych 10 lat mojego �ycia wydobywaj�c rud�!
	AI_Output (self, other,"VLK_586_Grimes_KNOW_Info_04_06"); //Wcale nie musisz. Mo�e zostaniesz wielk� szych�, kto wie?
	AI_Output (self, other,"VLK_586_Grimes_KNOW_Info_04_07"); //Mo�esz pi�� si� do g�ry, ale niewa�ne jak wysokie stanowisko uda ci si� osi�gn�� - Bariera wreszcie ci� zatrzyma.
};

instance VLK_586_Grimes_FIRST (C_INFO)
{
	npc				= VLK_586_Grimes;
	condition		= VLK_586_Grimes_FIRST_Condition;
	information		= VLK_586_Grimes_FIRST_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  VLK_586_Grimes_FIRST_Condition()
{
	return 1;
};

func void  VLK_586_Grimes_FIRST_Info()
{
	AI_Output (self, other,"VLK_586_Grimes_FIRST_Info_04_02"); //Oho! Nowa twarz! Pracowa�e� kiedy� jako g�rnik, ch�opcze?
};  
instance  VLK_586_Grimes_LEARN (C_INFO)
{
	npc				= VLK_586_Grimes;
	condition		= VLK_586_Grimes_LEARN_Condition;
	information		= VLK_586_Grimes_LEARN_Info;
	important		= 0;
	permanent		= 0;
	description		= "Szukam kogo�, kto nauczy mnie kopa� rud�."; 
};

FUNC int  VLK_586_Grimes_LEARN_Condition()
{	
		if (Npc_GetTalentSkill(hero, NPC_TALENT_REGENERATE) == 0)
		{
		return 1;
		};
};

FUNC void  VLK_586_Grimes_LEARN_Info()
{
	AI_Output (other, self,"VLK_586_Grimes_LEARN_Info_15_01"); //Szukam kogo�, kto nauczy mnie kopa� rud�.
	if (Npc_GetTrueGuild(other) == GIL_VLK)
	{
	AI_Output (self, other,"VLK_586_Grimes_LEARN_Info_04_02"); //Ach, to ciebie Ian ostatnio przyj�� do pracy. Nauka b�dzie ci� kosztowa� kilka bry�ek rudy.
	AI_Output (other, self,"VLK_586_Grimes_LEARN_Info_15_03"); //Nic nie mam. Ian wszystko mi zabra�. Powiedzia�, �e mam wykopa� 500 bry�ek rudy.
	AI_Output (self, other,"VLK_586_Grimes_LEARN_Info_04_04"); //Jeste� w ci�kiej sytuacji, rozumiem. Tym razem zrobi� wi�c wyj�tek. 
	
		Log_CreateTopic   	(GE_TeacherOM,LOG_NOTE);
		B_LogEntry			(GE_TeacherOM,"Grimes mo�e mnie nauczy� jak wydobywa� rud�. Za nauk� nie musz� nic p�aci�, poniewa� jestem Kopaczem.");
	}
	else
	{
	AI_Output (self, other,"VLK_586_Grimes_LEARN_Info_04_06"); //Nauka tego fachu nie jest taka trudna, jednak b�dzie ci� to kosztowa� 60 bry�ek rudy.
	
		Log_CreateTopic   	(GE_TeacherOM,LOG_NOTE);
		B_LogEntry			(GE_TeacherOM,"Grimes mo�e mnie nauczy� jak wydobywa� rud�. Za nauk� musz� zap�aci� 60 bry�ek rudy.");
	};
};

instance  VLK_586_Grimes_START_LEARN (C_INFO)
{
	npc				= VLK_586_Grimes;
	condition		= VLK_586_Grimes_START_LEARN_Condition;
	information		= VLK_586_Grimes_START_LEARN_Info;
	important		= 0;
	permanent		= 1;
	description		= "Naucz mnie kopa� rud�. (5 punkt�w nauki, 60 bry�ek rudy)"; 
};

FUNC int  VLK_586_Grimes_START_LEARN_Condition()
{	
		if (Npc_GetTalentSkill(hero, NPC_TALENT_REGENERATE) == 0) 
		{
		return 1;
		};
};

FUNC void  VLK_586_Grimes_START_LEARN_Info()
{
	AI_Output (other, self,"VLK_586_Grimes_START_LEARN_Info_15_01"); //Naucz mnie kopa� rud�.
	if (hero.lp >=5)
	{
	if (Npc_GetTrueGuild(other) == GIL_VLK)
	{
	AI_Output (self, other,"VLK_586_Grimes_START_LEARN_Info_04_02"); //Pocz�tki nie s� zbyt trudne. Musisz umie� odpowiednio uderzy�. 
	AI_Output (self, other,"VLK_586_Grimes_START_LEARN_Info_04_03"); //Najwa�niejsza jest rozwaga. WIelu g�rnik�w zgin�o przyci�ni�tych przez ska�y, bo uderzali zbyt mocno.
	AI_Output (self, other,"VLK_586_Grimes_START_LEARN_Info_04_04"); //Z kolei inni kopali dniami i nocami bez rezultatu, bo uderzali zbyt s�abo lub kopali w nieodpowiednim miejscu.
	AI_Output (self, other,"VLK_586_Grimes_START_LEARN_Info_04_05"); //Uderzaj kilka razy lekko, aby zbada� ska�� i nieco j� rozbi�. Potem uderz silnie lub nawet bardzo silnie.
	AI_Output (self, other,"VLK_586_Grimes_START_LEARN_Info_04_06"); //Je�eli b�dziesz mia� troch� szcz�cia szybko wydob�dziesz bry�ki.
	AI_Output (self, other,"VLK_586_Grimes_START_LEARN_Info_04_07"); //Jeszcze jedno, pami�taj, �e ka�da �y�a rudy kiedy� si� sko�czy.
	VLK_586_Grimes_START_LEARN.permanent = false;
	hero.lp = hero.lp - 5;
	Npc_SetTalentSkill(hero, NPC_TALENT_REGENERATE, 1);
	PrintScreen	("Nowa umiej�tno��: G�rnictwo", -1,-1,"FONT_OLD_20_WHITE.tga",2);
	}
	else
	{
	if (Npc_HasItems (hero, ItMiNugget)>=60)
	{
	AI_Output (self, other,"VLK_586_Grimes_START_LEARN_Info_04_02"); //Pocz�tki nie s� zbyt trudne. Musisz umie� odpowiednio uderzy�. 
	AI_Output (self, other,"VLK_586_Grimes_START_LEARN_Info_04_03"); //Najwa�niejsza jest rozwaga. WIelu g�rnik�w zgin�o przyci�ni�tych przez ska�y, bo uderzali zbyt mocno.
	AI_Output (self, other,"VLK_586_Grimes_START_LEARN_Info_04_04"); //Z kolei inni kopali dniami i nocami bez rezultatu, bo uderzali zbyt s�abo lub kopali w nieodpowiednim miejscu.
	AI_Output (self, other,"VLK_586_Grimes_START_LEARN_Info_04_05"); //Uderzaj kilka razy lekko, aby zbada� ska�� i nieco j� rozbi�. Potem uderz silnie lub nawet bardzo silnie.
	AI_Output (self, other,"VLK_586_Grimes_START_LEARN_Info_04_06"); //Je�eli b�dziesz mia� troch� szcz�cia szybko wydob�dziesz bry�ki.
	AI_Output (self, other,"VLK_586_Grimes_START_LEARN_Info_04_07"); //Jeszcze jedno, pami�taj, �e ka�da �y�a rudy kiedy� si� sko�czy.
	B_GiveInvItems (other,self, itminugget, 60);
	Npc_RemoveInvItems (self, itminugget,50);
	VLK_586_Grimes_START_LEARN.permanent = false;	
	hero.lp = hero.lp - 5;
	Npc_SetTalentSkill(hero, NPC_TALENT_REGENERATE, 1);
	PrintScreen	("Nowa umiej�tno��: G�rnictwo", -1,-1,"FONT_OLD_20_WHITE.tga",2);
	}
	else
	{
	AI_Output (self, other,"VLK_586_Grimes_START_LEARN_Info_04_08"); //Pr�bujesz okpi� staruszka? Brakuje ci rudy!
	VLK_586_Grimes_START_LEARN.permanent = true;
	};
	};
	}
	else
	{
	AI_Output (self, other,"VLK_586_Grimes_START_LEARN_Info_04_09"); //Nie mog� ci� niczego nauczy�! Barkuje ci do�wiadczenia. 
	};
};