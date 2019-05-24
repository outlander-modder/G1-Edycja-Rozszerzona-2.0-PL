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
	AI_Output (self, other,"VLK_586_Grimes_Exit_Info_04_02"); //Nawzajem, ch³opcze. Nawzajem.
	
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
	description		= "Od dawna tu jesteœ?"; 
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
	AI_Output (other, self,"VLK_586_Grimes_STORY_Info_15_01"); //Od dawna tu jesteœ?
	AI_Output (self, other,"VLK_586_Grimes_STORY_Info_04_02"); //Od ca³ych 10 lat. Uwierz mi, du¿o ju¿ tu widzia³em.
	AI_Output (self, other,"VLK_586_Grimes_STORY_Info_04_03"); //Stawi³em czo³a wielu niebezpieczeñstwom, ale jakoœ uda³o mi siê z nich wybrn¹æ.
	AI_Output (self, other,"VLK_586_Grimes_STORY_Info_04_04"); //Pamiêtam jak pracowaliœmy jeszcze w pierwszej kopalni, tej, która teraz stoi pusta. Pewnego dnia nie wytrzyma³y podpory...
	AI_Output (self, other,"VLK_586_Grimes_STORY_Info_04_05"); //Ale to stare dzieje...
};

instance  VLK_586_Grimes_KNOW (C_INFO)
{
	npc				= VLK_586_Grimes;
	condition		= VLK_586_Grimes_KNOW_Condition;
	information		= VLK_586_Grimes_KNOW_Info;
	important		= 0;
	permanent		= 0;
	description		= "Zapewne s³ysza³eœ te¿ o wielu planach ucieczki."; 
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
	AI_Output (other, self,"VLK_586_Grimes_KNOW_Info_15_01"); //Zapewne s³ysza³eœ te¿ o wielu planach ucieczki.
	AI_Output (self, other,"VLK_586_Grimes_KNOW_Info_04_02"); //Pos³uchaj, ch³opcze. Wiem, ¿e chcia³byœ siê st¹d wydostaæ, ale zapomnij o tym.
	AI_Output (self, other,"VLK_586_Grimes_KNOW_Info_04_03"); //St¹d nie ma ucieczki! Widzia³em twarze tych, którzy próbowali sforsowaæ Barierê.
	AI_Output (self, other,"VLK_586_Grimes_KNOW_Info_04_04"); //Nie pope³niaj tego samego b³êdu. Bariera powstrzyma ka¿dego.
	AI_Output (other, self,"VLK_586_Grimes_KNOW_Info_15_05"); //Nie chcê spêdziæ nastêpnych 10 lat mojego ¿ycia wydobywaj¹c rudê!
	AI_Output (self, other,"VLK_586_Grimes_KNOW_Info_04_06"); //Wcale nie musisz. Mo¿e zostaniesz wielk¹ szych¹, kto wie?
	AI_Output (self, other,"VLK_586_Grimes_KNOW_Info_04_07"); //Mo¿esz pi¹æ siê do góry, ale niewa¿ne jak wysokie stanowisko uda ci siê osi¹gn¹æ - Bariera wreszcie ciê zatrzyma.
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
	AI_Output (self, other,"VLK_586_Grimes_FIRST_Info_04_02"); //Oho! Nowa twarz! Pracowa³eœ kiedyœ jako górnik, ch³opcze?
};  
instance  VLK_586_Grimes_LEARN (C_INFO)
{
	npc				= VLK_586_Grimes;
	condition		= VLK_586_Grimes_LEARN_Condition;
	information		= VLK_586_Grimes_LEARN_Info;
	important		= 0;
	permanent		= 0;
	description		= "Szukam kogoœ, kto nauczy mnie kopaæ rudê."; 
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
	AI_Output (other, self,"VLK_586_Grimes_LEARN_Info_15_01"); //Szukam kogoœ, kto nauczy mnie kopaæ rudê.
	if (Npc_GetTrueGuild(other) == GIL_VLK)
	{
	AI_Output (self, other,"VLK_586_Grimes_LEARN_Info_04_02"); //Ach, to ciebie Ian ostatnio przyj¹³ do pracy. Nauka bêdzie ciê kosztowaæ kilka bry³ek rudy.
	AI_Output (other, self,"VLK_586_Grimes_LEARN_Info_15_03"); //Nic nie mam. Ian wszystko mi zabra³. Powiedzia³, ¿e mam wykopaæ 500 bry³ek rudy.
	AI_Output (self, other,"VLK_586_Grimes_LEARN_Info_04_04"); //Jesteœ w ciê¿kiej sytuacji, rozumiem. Tym razem zrobiê wiêc wyj¹tek. 
	
		Log_CreateTopic   	(GE_TeacherOM,LOG_NOTE);
		B_LogEntry			(GE_TeacherOM,"Grimes mo¿e mnie nauczyæ jak wydobywaæ rudê. Za naukê nie muszê nic p³aciæ, poniewa¿ jestem Kopaczem.");
	}
	else
	{
	AI_Output (self, other,"VLK_586_Grimes_LEARN_Info_04_06"); //Nauka tego fachu nie jest taka trudna, jednak bêdzie ciê to kosztowaæ 60 bry³ek rudy.
	
		Log_CreateTopic   	(GE_TeacherOM,LOG_NOTE);
		B_LogEntry			(GE_TeacherOM,"Grimes mo¿e mnie nauczyæ jak wydobywaæ rudê. Za naukê muszê zap³aciæ 60 bry³ek rudy.");
	};
};

instance  VLK_586_Grimes_START_LEARN (C_INFO)
{
	npc				= VLK_586_Grimes;
	condition		= VLK_586_Grimes_START_LEARN_Condition;
	information		= VLK_586_Grimes_START_LEARN_Info;
	important		= 0;
	permanent		= 1;
	description		= "Naucz mnie kopaæ rudê. (5 punktów nauki, 60 bry³ek rudy)"; 
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
	AI_Output (other, self,"VLK_586_Grimes_START_LEARN_Info_15_01"); //Naucz mnie kopaæ rudê.
	if (hero.lp >=5)
	{
	if (Npc_GetTrueGuild(other) == GIL_VLK)
	{
	AI_Output (self, other,"VLK_586_Grimes_START_LEARN_Info_04_02"); //Pocz¹tki nie s¹ zbyt trudne. Musisz umieæ odpowiednio uderzyæ. 
	AI_Output (self, other,"VLK_586_Grimes_START_LEARN_Info_04_03"); //Najwa¿niejsza jest rozwaga. WIelu górników zginê³o przyciœniêtych przez ska³y, bo uderzali zbyt mocno.
	AI_Output (self, other,"VLK_586_Grimes_START_LEARN_Info_04_04"); //Z kolei inni kopali dniami i nocami bez rezultatu, bo uderzali zbyt s³abo lub kopali w nieodpowiednim miejscu.
	AI_Output (self, other,"VLK_586_Grimes_START_LEARN_Info_04_05"); //Uderzaj kilka razy lekko, aby zbadaæ ska³ê i nieco j¹ rozbiæ. Potem uderz silnie lub nawet bardzo silnie.
	AI_Output (self, other,"VLK_586_Grimes_START_LEARN_Info_04_06"); //Je¿eli bêdziesz mia³ trochê szczêœcia szybko wydobêdziesz bry³ki.
	AI_Output (self, other,"VLK_586_Grimes_START_LEARN_Info_04_07"); //Jeszcze jedno, pamiêtaj, ¿e ka¿da ¿y³a rudy kiedyœ siê skoñczy.
	VLK_586_Grimes_START_LEARN.permanent = false;
	hero.lp = hero.lp - 5;
	Npc_SetTalentSkill(hero, NPC_TALENT_REGENERATE, 1);
	PrintScreen	("Nowa umiejêtnoœæ: Górnictwo", -1,-1,"FONT_OLD_20_WHITE.tga",2);
	}
	else
	{
	if (Npc_HasItems (hero, ItMiNugget)>=60)
	{
	AI_Output (self, other,"VLK_586_Grimes_START_LEARN_Info_04_02"); //Pocz¹tki nie s¹ zbyt trudne. Musisz umieæ odpowiednio uderzyæ. 
	AI_Output (self, other,"VLK_586_Grimes_START_LEARN_Info_04_03"); //Najwa¿niejsza jest rozwaga. WIelu górników zginê³o przyciœniêtych przez ska³y, bo uderzali zbyt mocno.
	AI_Output (self, other,"VLK_586_Grimes_START_LEARN_Info_04_04"); //Z kolei inni kopali dniami i nocami bez rezultatu, bo uderzali zbyt s³abo lub kopali w nieodpowiednim miejscu.
	AI_Output (self, other,"VLK_586_Grimes_START_LEARN_Info_04_05"); //Uderzaj kilka razy lekko, aby zbadaæ ska³ê i nieco j¹ rozbiæ. Potem uderz silnie lub nawet bardzo silnie.
	AI_Output (self, other,"VLK_586_Grimes_START_LEARN_Info_04_06"); //Je¿eli bêdziesz mia³ trochê szczêœcia szybko wydobêdziesz bry³ki.
	AI_Output (self, other,"VLK_586_Grimes_START_LEARN_Info_04_07"); //Jeszcze jedno, pamiêtaj, ¿e ka¿da ¿y³a rudy kiedyœ siê skoñczy.
	B_GiveInvItems (other,self, itminugget, 60);
	Npc_RemoveInvItems (self, itminugget,50);
	VLK_586_Grimes_START_LEARN.permanent = false;	
	hero.lp = hero.lp - 5;
	Npc_SetTalentSkill(hero, NPC_TALENT_REGENERATE, 1);
	PrintScreen	("Nowa umiejêtnoœæ: Górnictwo", -1,-1,"FONT_OLD_20_WHITE.tga",2);
	}
	else
	{
	AI_Output (self, other,"VLK_586_Grimes_START_LEARN_Info_04_08"); //Próbujesz okpiæ staruszka? Brakuje ci rudy!
	VLK_586_Grimes_START_LEARN.permanent = true;
	};
	};
	}
	else
	{
	AI_Output (self, other,"VLK_586_Grimes_START_LEARN_Info_04_09"); //Nie mogê ciê niczego nauczyæ! Barkuje ci doœwiadczenia. 
	};
};