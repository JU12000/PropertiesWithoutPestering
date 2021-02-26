;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname QF_PWPSetInitialHouseCost_0600AA02 Extends Quest Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;For each home being effected by this mod, get the inital price of the home
;and save it for later, then set the home price to the higher price (no favor quests complete)

PWPHPMarkarth.SetValue(HPMarkarth.GetValue())
HPMarkarth.SetValue(PWPHPMarkarthNoFavor.GetValue())
HousePurchase.UpdateCurrentInstanceGlobal(HPMarkarth)

PWPHPRiften.SetValue(HPRiften.GetValue())
HPRiften.SetValue(PWPHPRiftenNoFavor.GetValue())
HousePurchase.UpdateCurrentInstanceGlobal(HPRiften)

PWPHPSolitude.SetValue(HPSolitude.GetValue())
HPSolitude.SetValue(PWPHPSolitudeNoFavor.GetValue())
HousePurchase.UpdateCurrentInstanceGlobal(HPSolitude)

PWPHPWhiterun.SetValue(HPWhiterun.GetValue())
HPWhiterun.SetValue(PWPHPWhiterunNoFavor.GetValue())
HousePurchase.UpdateCurrentInstanceGlobal(HPWhiterun)

PWPHPWindhelm.SetValue(HPWindhelm.GetValue())
HPWindhelm.SetValue(PWPHPWindhelmNoFavor.GetValue())
HousePurchase.UpdateCurrentInstanceGlobal(HPWindhelm)
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
GlobalVariable Property PWPHPRiften  Auto  
GlobalVariable Property PWPHPSolitude  Auto  
GlobalVariable Property PWPHPWhiterun  Auto  
GlobalVariable Property PWPHPWindhelm  Auto  

GlobalVariable Property PWPHPMarkarthNoFavor  Auto  
GlobalVariable Property PWPHPRiftenNoFavor  Auto  
GlobalVariable Property PWPHPSolitudeNoFavor Auto  
GlobalVariable Property PWPHPWhiterunNoFavor Auto  
GlobalVariable Property PWPHPWindhelmNoFavor Auto  

Quest Property HousePurchase  Auto  
