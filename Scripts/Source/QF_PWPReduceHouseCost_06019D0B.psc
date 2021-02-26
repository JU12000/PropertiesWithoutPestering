;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname QF_PWPReduceHouseCost_06019D0B Extends Quest Hidden

;BEGIN ALIAS PROPERTY Laila
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Laila Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Maven
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Maven Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NPC1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_NPC1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Ulfric
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Ulfric Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Igmund
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Igmund Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ElisifTheFair
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ElisifTheFair Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BalgruuftheGreater
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BalgruuftheGreater Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY VignarGrayMane
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_VignarGrayMane Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NPC2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_NPC2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Thongvor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Thongvor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Brunwulf
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Brunwulf Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Figure out which NPC the jarl is
ActorBase jarl

if Alias_NPC1.GetReference() == game.GetPlayer()
  jarl = (Alias_NPC2.GetReference() as Actor).GetActorBase()
elseif Alias_NPC2.GetReference() == game.GetPlayer()
  jarl = (Alias_NPC1.GetReference() as Actor).GetActorBase()
endif

;figure out which jarl it is
if jarl == (Alias_BalgruuftheGreater.GetReference() as Actor).GetActorBase()
  HPWhiterun.SetValue(PWPHPWhiterun.GetValue())
  HousePurchase.UpdateCurrentInstanceGlobal(HPWhiterun)
elseif jarl == (Alias_Brunwulf.GetReference() as Actor).GetActorBase()
  HPWindhelm.SetValue(PWPHPWindhelm.GetValue())
  HousePurchase.UpdateCurrentInstanceGlobal(HPWindhelm)
elseif jarl == (Alias_ElisiftheFair.GetReference() as Actor).GetActorBase()
  HPSolitude.SetValue(PWPHPSolitude.GetValue())
  HousePurchase.UpdateCurrentInstanceGlobal(HPSolitude)
elseif jarl == (Alias_Igmund.GetReference() as Actor).GetActorBase()
  HPMarkarth.SetValue(PWPHPMarkarth.GetValue())
  HousePurchase.UpdateCurrentInstanceGlobal(HPMarkarth)
elseif jarl == (Alias_Laila.GetReference() as Actor).GetActorBase()
  HPRiften.SetValue(PWPHPRiften.GetValue())
  HousePurchase.UpdateCurrentInstanceGlobal(HPRiften)
elseif jarl == (Alias_Maven.GetReference() as Actor).GetActorBase()
  HPRiften.SetValue(PWPHPRiften.GetValue())
  HousePurchase.UpdateCurrentInstanceGlobal(HPRiften)
elseif jarl == (Alias_Thongvor.GetReference() as Actor).GetActorBase()
  HPMarkarth.SetValue(PWPHPMarkarth.GetValue())
  HousePurchase.UpdateCurrentInstanceGlobal(HPMarkarth)
elseif jarl == (Alias_Ulfric.GetReference() as Actor).GetActorBase()
  HPWindhelm.SetValue(PWPHPWindhelm.GetValue())
  HousePurchase.UpdateCurrentInstanceGlobal(HPWindhelm)
elseif jarl == (Alias_VignarGrayMane.GetReference() as Actor).GetActorBase()
  HPWhiterun.SetValue(PWPHPWhiterun.GetValue())
  HousePurchase.UpdateCurrentInstanceGlobal(HPWhiterun)
endif

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property HPMarkarth  Auto  
GlobalVariable Property HPRiften  Auto  
GlobalVariable Property HPSolitude  Auto  
GlobalVariable Property HPWhiterun  Auto  
GlobalVariable Property HPWindhelm  Auto  

GlobalVariable Property PWPHPMarkarth  Auto  
GlobalVariable Property PWPHPRiften Auto
GlobalVariable Property PWPHPSolitude Auto
GlobalVariable Property PWPHPWhiterun Auto
GlobalVariable Property PWPHPWindhelm Auto

Quest Property HousePurchase  Auto  
