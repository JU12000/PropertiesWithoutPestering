Scriptname PWPMCMScript extends SKI_ConfigBase  

import FISSFactory
FISSInterface fiss

bool allowFISSOptions

int optionFISSImport
int optionFISSExport

float defaultMarkarthHP
float defaultMarkarthHPNoFavor
float defaultRiftenHP
float defaultRiftenHPNoFavor
float defaultSolitudeHP
float defaultSolitudeHPNoFavor
float defaultWhiterunHP
float defaultWhiterunHPNoFavor
float defaultWindhelmHP
float defaultWindhelmHPNoFavor
float defaultBYOHHPCost
float defaultBYOHHPCostNoFavor

int sliderMarkarthHP
int sliderMarkarthHPNoFavor
int sliderRiftenHP
int sliderRiftenHPNoFavor
int sliderSolitudeHP
int sliderSolitudeHPNoFavor
int sliderWhiterunHP
int sliderWhiterunHPNoFavor
int sliderWindhelmHP
int sliderWindhelmHPNoFavor
int sliderBYOHHPCost
int sliderBYOHHPCostNoFavor

Event OnConfigInit()
	fiss = FISSFactory.getFISS()

	If !fiss
		debug.Notification("PWP: FISSES is not installed. Disabling Import/Export")
		allowFISSOptions = false
	Else
		allowFISSOptions = true
	EndIf

	defaultMarkarthHP = HPMarkarth.GetValue()
	defaultMarkarthHPNoFavor = PWPHPMarkarthNoFavor.GetValue()

	defaultRiftenHP = HPRiften.GetValue()
	defaultRiftenHPNoFavor = PWPHPRiftenNoFavor.GetValue()

	defaultSolitudeHP = HPSolitude.GetValue()
	defaultSolitudeHPNoFavor = PWPHPSolitudeNoFavor.GetValue()

	defaultWhiterunHP = HPWhiterun.GetValue()
	defaultWhiterunHPNoFavor = PWPHPWhiterunNoFavor.GetValue()

	defaultWindhelmHP = HPWindhelm.GetValue()
	defaultWindhelmHPNoFavor = PWPHPWindhelmNoFavor.GetValue()

	defaultBYOHHPCost = BYOHHPCost.GetValue()
	defaultBYOHHPCostNoFavor = PWPBYOHHPCostNoFavor.GetValue()

	Debug.Notification("PWP Initialization Complete")
EndEvent

Event OnPageReset(string page)
	If (page == "")
		AddHeaderOption("House Prices: Favor")
		AddHeaderOption("House Prices: No Favor")

		sliderMarkarthHP = AddSliderOption("Markarth", HPMarkarth.GetValue())
		sliderMarkarthHPNoFavor = AddSliderOption("Markarth", PWPHPMarkarthNoFavor.GetValue())

		sliderRiftenHP = AddSliderOption("Riften", HPRiften.GetValue())
		sliderRiftenHPNoFavor = AddSliderOption("Riften", PWPHPRiftenNoFavor.GetValue())

		sliderSolitudeHP = AddSliderOption("Solitude", HPSolitude.GetValue())
		sliderSolitudeHPNoFavor = AddSliderOption("Solitude", PWPHPSolitudeNoFavor.GetValue())

		sliderWhiterunHP = AddSliderOption("Whiterun", HPWhiterun.GetValue())
		sliderWhiterunHPNoFavor = AddSliderOption("Whiterun", PWPHPWhiterunNoFavor.GetValue())

		sliderWindhelmHP = AddSliderOption("Windhelm", HPWindhelm.GetValue())
		sliderWindhelmHPNoFavor = AddSliderOption("Windhelm", PWPHPWindhelmNoFavor.GetValue())

		sliderBYOHHPCost = AddSliderOption("Hearthfire", BYOHHPCost.GetValue())
		sliderBYOHHPCostNoFavor = AddSliderOption("Hearthfire", PWPBYOHHPCostNoFavor.GetValue())

		If allowFISSOptions
			AddEmptyOption()
			AddEmptyOption()

			AddHeaderOption("FISSES")
			AddEmptyOption()

			optionFISSImport = AddTextOption("Import", "")
			optionFISSExport = AddTextOption("Export", "")
		EndIf
	EndIf
EndEvent

Event OnOptionSelect(int option)
	If (option == optionFISSImport)
		SetTextOptionValue(option, "")

		fiss.beginLoad("PropertiesWithoutPesteringSE.xml")
			HPMarkarth.SetValue(fiss.loadFloat("HPMarkarth"))
			HousePurchase.UpdateCurrentInstanceGlobal(HPMarkarth)
			SetSliderOptionValue(sliderMarkarthHP, HPMarkarth.GetValue())

			PWPHPMarkarthNoFavor.SetValue(fiss.loadFloat("PWPHPMarkarthNoFavor"))
			HousePurchase.UpdateCurrentInstanceGlobal(PWPHPMarkarthNoFavor)
			SetSliderOptionValue(sliderMarkarthHPNoFavor, PWPHPMarkarthNoFavor.GetValue())

			HPRiften.SetValue(fiss.loadFloat("HPRiften"))
			HousePurchase.UpdateCurrentInstanceGlobal(HPRiften)
			SetSliderOptionValue(sliderRiftenHP, HPRiften.GetValue())

			PWPHPRiftenNoFavor.SetValue(fiss.loadFloat("PWPHPRiftenNoFavor"))
			HousePurchase.UpdateCurrentInstanceGlobal(PWPHPRiftenNoFavor)
			SetSliderOptionValue(sliderRiftenHPNoFavor, PWPHPRiftenNoFavor.GetValue())

			HPSolitude.SetValue(fiss.loadFloat("HPSolitude"))
			HousePurchase.UpdateCurrentInstanceGlobal(HPSolitude)
			SetSliderOptionValue(sliderSolitudeHP, HPSolitude.GetValue())

			PWPHPSolitudeNoFavor.SetValue(fiss.loadFloat("PWPHPSolitudeNoFavor"))
			HousePurchase.UpdateCurrentInstanceGlobal(PWPHPSolitudeNoFavor)
			SetSliderOptionValue(sliderSolitudeHPNoFavor, PWPHPSolitudeNoFavor.GetValue())

			HPWhiterun.SetValue(fiss.loadFloat("HPWhiterun"))
			HousePurchase.UpdateCurrentInstanceGlobal(HPWhiterun)
			SetSliderOptionValue(sliderWhiterunHP, HPWhiterun.GetValue())

			PWPHPWhiterunNoFavor.SetValue(fiss.loadFloat("PWPHPWhiterunNoFavor"))
			HousePurchase.UpdateCurrentInstanceGlobal(PWPHPWhiterunNoFavor)
			SetSliderOptionValue(sliderWhiterunHPNoFavor, PWPHPWhiterunNoFavor.GetValue())

			HPWindhelm.SetValue(fiss.loadFloat("HPWindhelm"))
			HousePurchase.UpdateCurrentInstanceGlobal(HPWindhelm)
			SetSliderOptionValue(sliderWindhelmHP, HPWindhelm.GetValue())

			PWPHPWindhelmNoFavor.SetValue(fiss.loadFloat("PWPHPWindhelmNoFavor"))
			HousePurchase.UpdateCurrentInstanceGlobal(PWPHPWindhelmNoFavor)
			SetSliderOptionValue(sliderWindhelmHPNoFavor, PWPHPWindhelmNoFavor.GetValue())

			BYOHHPCost.SetValue(fiss.loadFloat("BYOHHPCost"))
			BYOHHouseFalkreath.UpdateCurrentInstanceGlobal(BYOHHPCost)
			BYOHHouseHjaalmarch.UpdateCurrentInstanceGlobal(BYOHHPCost)
			BYOHHousePale.UpdateCurrentInstanceGlobal(BYOHHPCost)
			SetSliderOptionValue(sliderBYOHHPCost, BYOHHPCost.GetValue())

			PWPBYOHHPCostNoFavor.SetValue(fiss.loadFloat("PWPBYOHHPCostNoFavor"))
			BYOHHouseFalkreath.UpdateCurrentInstanceGlobal(PWPBYOHHPCostNoFavor)
			BYOHHouseHjaalmarch.UpdateCurrentInstanceGlobal(PWPBYOHHPCostNoFavor)
			BYOHHousePale.UpdateCurrentInstanceGlobal(PWPBYOHHPCostNoFavor)
			SetSliderOptionValue(sliderBYOHHPCost, PWPBYOHHPCostNoFavor.GetValue())
		string loadResult = fiss.endLoad()

		If (loadResult != "")
			debug.Trace(loadResult)
			SetTextOptionValue(option, "Failure")
		Else
			SetTextOptionValue(option, "Success")
		EndIf
	ElseIf (option == optionFISSExport)
		SetTextOptionValue(option, "")

		fiss.beginSave("PropertiesWithoutPesteringSE.xml", "PropertiesWithoutPesteringSE")
			fiss.saveFloat("HPMarkarth", HPMarkarth.GetValue())
			fiss.saveFloat("PWPHPMarkarthNoFavor", PWPHPMarkarthNoFavor.GetValue())

			fiss.saveFloat("HPRiften", HPRiften.GetValue())
			fiss.saveFloat("PWPHPRiftenNoFavor", PWPHPRiftenNoFavor.GetValue())

			fiss.saveFloat("HPSolitude", HPSolitude.GetValue())
			fiss.saveFloat("PWPHPSolitudeNoFavor", PWPHPSolitudeNoFavor.GetValue())

			fiss.saveFloat("HPWhiterun", HPWhiterun.GetValue())
			fiss.saveFloat("PWPHPWhiterunNoFavor", PWPHPWhiterunNoFavor.GetValue())

			fiss.saveFloat("HPWindhelm", HPWindhelm.GetValue())
			fiss.saveFloat("PWPHPWindhelmNoFavor", PWPHPWindhelmNoFavor.GetValue())

			fiss.saveFloat("BYOHHPCost", BYOHHPCost.GetValue())
			fiss.saveFloat("PWPBYOHHPCostNoFavor", PWPBYOHHPCostNoFavor.GetValue())
		string saveResult = fiss.endSave()

		If (saveResult != "")
			debug.Trace(saveResult)
			SetTextOptionValue(option, "Failure")
		Else
			SetTextOptionValue(option, "Success")
		EndIf
	EndIf
EndEvent

Event OnOptionSliderOpen(int option)
	If (option == sliderMarkarthHP)
		SetSliderDialogStartValue(HPMarkarth.GetValue())
		SetSliderDialogDefaultValue(defaultMarkarthHP)
		SetSliderDialogRange(0, 100000)
		SetSliderDialogInterval(100)
	ElseIf (option == sliderMarkarthHPNoFavor)
		SetSliderDialogStartValue(PWPHPMarkarthNoFavor.GetValue())
		SetSliderDialogDefaultValue(defaultMarkarthHPNoFavor)
		SetSliderDialogRange(0, 100000)
		SetSliderDialogInterval(100)
	ElseIf (option == sliderRiftenHP)
		SetSliderDialogStartValue(HPRiften.GetValue())
		SetSliderDialogDefaultValue(defaultRiftenHP)
		SetSliderDialogRange(0, 100000)
		SetSliderDialogInterval(100)
	ElseIf (option == sliderRiftenHPNoFavor)
		SetSliderDialogStartValue(PWPHPRiftenNoFavor.GetValue())
		SetSliderDialogDefaultValue(defaultRiftenHPNoFavor)
		SetSliderDialogRange(0, 100000)
		SetSliderDialogInterval(100)
	ElseIf (option == sliderSolitudeHP)
		SetSliderDialogStartValue(HPSolitude.GetValue())
		SetSliderDialogDefaultValue(defaultSolitudeHP)
		SetSliderDialogRange(0, 100000)
		SetSliderDialogInterval(100)
	ElseIf (option == sliderSolitudeHPNoFavor)
		SetSliderDialogStartValue(PWPHPSolitudeNoFavor.GetValue())
		SetSliderDialogDefaultValue(defaultSolitudeHPNoFavor)
		SetSliderDialogRange(0, 100000)
		SetSliderDialogInterval(100)
	ElseIf (option == sliderWhiterunHP)
		SetSliderDialogStartValue(HPWhiterun.GetValue())
		SetSliderDialogDefaultValue(defaultWhiterunHP)
		SetSliderDialogRange(0, 100000)
		SetSliderDialogInterval(100)
	ElseIf (option == sliderWhiterunHPNoFavor)
		SetSliderDialogStartValue(PWPHPWhiterunNoFavor.GetValue())
		SetSliderDialogDefaultValue(defaultWhiterunHPNoFavor)
		SetSliderDialogRange(0, 100000)
		SetSliderDialogInterval(100)
	ElseIf (option == sliderWindhelmHP)
		SetSliderDialogStartValue(HPWindhelm.GetValue())
		SetSliderDialogDefaultValue(defaultWIndhelmHP)
		SetSliderDialogRange(0, 100000)
		SetSliderDialogInterval(100)
	ElseIf (option == sliderWindhelmHPNoFavor)
		SetSliderDialogStartValue(PWPHPWindhelmNoFavor.GetValue())
		SetSliderDialogDefaultValue(defaultWindhelmHPNoFavor)
		SetSliderDialogRange(0, 100000)
		SetSliderDialogInterval(100)
	ElseIf (option == sliderBYOHHPCost)
		SetSliderDialogStartValue(BYOHHPCost.GetValue())
		SetSliderDialogDefaultValue(defaultBYOHHPCost)
		SetSliderDialogRange(0, 100000)
		SetSliderDialogInterval(100)
	ElseIf (option == sliderBYOHHPCostNoFavor)
		SetSliderDialogStartValue(PWPBYOHHPCostNoFavor.GetValue())
		SetSliderDialogDefaultValue(defaultBYOHHPCostNoFavor)
		SetSliderDialogRange(0, 100000)
		SetSliderDialogInterval(100)
	EndIf
EndEvent

Event OnOptionSliderAccept(int option, float value)
	If (option == sliderMarkarthHP)
		HPMarkarth.SetValue(value)
		HousePurchase.UpdateCurrentInstanceGlobal(HPMarkarth)
		SetSliderOptionValue(option, value)
	ElseIf (option == sliderMarkarthHPNoFavor)
		PWPHPMarkarthNoFavor.SetValue(value)
		HousePurchase.UpdateCurrentInstanceGlobal(PWPHPMarkarthNoFavor)
		SetSliderOptionValue(option, value)
	ElseIf (option == sliderRiftenHP)
		HPRiften.SetValue(value)
		HousePurchase.UpdateCurrentInstanceGlobal(HPRiften)
		SetSliderOptionValue(option, value)
	ElseIf (option == sliderRiftenHPNoFavor)
		PWPHPRiftenNoFavor.SetValue(value)
		HousePurchase.UpdateCurrentInstanceGlobal(PWPHPRiftenNoFavor)
		SetSliderOptionValue(option, value)
	ElseIf (option == sliderSolitudeHP)
		HPSolitude.SetValue(value)
		HousePurchase.UpdateCurrentInstanceGlobal(HPSolitude)
		SetSliderOptionValue(option, value)
	ElseIf (option == sliderSolitudeHPNoFavor)
		PWPHPSolitudeNoFavor.SetValue(value)
		HousePurchase.UpdateCurrentInstanceGlobal(PWPHPSolitudeNoFavor)
		SetSliderOptionValue(option, value)
	ElseIf (option == sliderWhiterunHP)
		HPWhiterun.SetValue(value)
		HousePurchase.UpdateCurrentInstanceGlobal(HPWhiterun)
		SetSliderOptionValue(option, value)
	ElseIf (option == sliderWhiterunHPNoFavor)
		PWPHPWhiterunNoFavor.SetValue(value)
		HousePurchase.UpdateCurrentInstanceGlobal(PWPHPWhiterunNoFavor)
		SetSliderOptionValue(option, value)
	ElseIf (option == sliderWindhelmHP)
		HPWindhelm.SetValue(value)
		HousePurchase.UpdateCurrentInstanceGlobal(HPWindhelm)
		SetSliderOptionValue(option, value)
	ElseIf (option == sliderWindhelmHPNoFavor)
		PWPHPWindhelmNoFavor.SetValue(value)
		HousePurchase.UpdateCurrentInstanceGlobal(PWPHPWindhelmNoFavor)
		SetSliderOptionValue(option, value)
	ElseIf (option == sliderBYOHHPCost)
		BYOHHPCost.SetValue(value)
		BYOHHouseFalkreath.UpdateCurrentInstanceGlobal(BYOHHPCost)
		BYOHHouseHjaalmarch.UpdateCurrentInstanceGlobal(BYOHHPCost)
		BYOHHousePale.UpdateCurrentInstanceGlobal(BYOHHPCost)
		SetSliderOptionValue(option, value)
	ElseIf (option == sliderBYOHHPCostNoFavor)
		PWPBYOHHPCostNoFavor.SetValue(value)
		BYOHHouseFalkreath.UpdateCurrentInstanceGlobal(PWPBYOHHPCostNoFavor)
		BYOHHouseHjaalmarch.UpdateCurrentInstanceGlobal(PWPBYOHHPCostNoFavor)
		BYOHHousePale.UpdateCurrentInstanceGlobal(PWPBYOHHPCostNoFavor)
		SetSliderOptionValue(option, value)
	EndIf
EndEvent

GlobalVariable Property HPMarkarth Auto
GlobalVariable Property HPRiften Auto
GlobalVariable Property HPSolitude Auto
GlobalVariable Property HPWhiterun Auto
GlobalVariable Property HPWindhelm Auto
GlobalVariable Property BYOHHPCost  Auto  

GlobalVariable Property PWPHPMarkarthNoFavor  Auto  
GlobalVariable Property PWPHPRiftenNoFavor  Auto  
GlobalVariable Property PWPHPSolitudeNoFavor  Auto  
GlobalVariable Property PWPHPWhiterunNoFavor  Auto  
GlobalVariable Property PWPHPWindhelmNoFavor  Auto  
GlobalVariable Property PWPBYOHHPCostNoFavor  Auto  

Quest Property HousePurchase  Auto  
Quest Property BYOHHouseFalkreath  Auto  
Quest Property BYOHHouseHjaalmarch  Auto  
Quest Property BYOHHousePale  Auto  
