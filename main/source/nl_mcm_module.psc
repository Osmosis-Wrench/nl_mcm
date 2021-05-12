Scriptname nl_mcm_module extends Quest
{
	This documents the new API functions in nl_mcm. \
	For the original MCM Api, view [link](https://github.com/schlangster/skyui/wiki/MCM-API-Reference). \
	Only the original STATE api functions are still supported as part of the new api.
	@author NeverLost
	@version 1.0.0
}

import Debug

;-------\----------\
; MODULE \ INTERNAL \ - ALSO KNOWN AS, IGNORE THIS SECTION
;--------------------------------------------------------

int property EVENT_DEFAULT = 0 autoreadonly
int property EVENT_HIGHLIGHT = 1 autoreadonly
int property EVENT_SELECT = 2 autoreadonly
int property EVENT_OPEN = 3 autoreadonly
int property EVENT_ACCEPT = 4 autoreadonly
int property EVENT_CHANGE = 5 autoreadonly

string property DEBUG_MSG
	string function Get()
		return "NL_MCM(" + _page_name + "): "
	endfunction
endproperty

; PERMANENT
nl_mcm _MCM

string _page_name

int _current_version
int _font
int _z

; CACHE
string _quest_editorid
string _mod_name
string _splash_path

float _splash_x
float _splash_y

event _OnPageDraw(int font)
	int version = GetVersion()
	
	if _current_version < version
		_MCM.ShowMessage("New module version: " + _current_version + " -> " + version + "\nUPDATING", false, "$OK", "")
		OnVersionUpdateBase(version)
		OnVersionUpdate(version)
		_current_version = version
	endIf

	_font = font
	
	OnPageDraw()
endevent

event _OnPageEvent(string state_name, int event_id, float f, string str)
	GoToState(state_name)

	if event_id == EVENT_DEFAULT
		OnDefaultST()
	elseif event_id == EVENT_HIGHLIGHT
		OnHighlightST()
	elseif event_id == EVENT_SELECT
		OnSelectST()
	elseif event_id == EVENT_OPEN
		OnSliderOpenST()
		OnMenuOpenST()
		OnColorOpenST()
		OnInputOpenST()
	elseif event_id == EVENT_ACCEPT
		OnSliderAcceptST(f)
		OnMenuAcceptST(f as int)
		OnColorAcceptST(f as int)
		OnInputAcceptST(str)
	elseif event_id == EVENT_CHANGE
		OnKeyMapChangeST(f as int)
	endif
endevent

auto state _inactive
	event _OnConfigManagerReady(string a_eventName, string a_strArg, float a_numArg, Form a_sender)
		int return_code = RegisterModule(_page_name, _z, _quest_editorid)
		
		if return_code == OK || return_code == ERROR_MCM_NONE
			StopTryingToRegister()
		endif
	endevent

	event _OnPageDraw(int font)
		Trace(DEBUG_MSG + "_OnPageDraw has been called in an invalid state.")
	endevent

	event _OnPageEvent(string state_name, int event_id, float f, string str)
		Trace(DEBUG_MSG + "_OnPageEvent has been called in an invalid state.")
	endevent

	function AddParagraph(string text, string format = "", int flags = 0x01)
		Trace(DEBUG_MSG + "AddParagraph has been called in an invalid state.")
	endfunction
	
	function SetSliderDialog(float value, float range_start, float range_end, float interval, float default = 0.0)
		Trace(DEBUG_MSG + "SetSliderDialog has been called in an invalid state.")
	endFunction 
	
	function SetMenuDialog(string[] options, int start_i, int default_i = 0)
		Trace(DEBUG_MSG + "SetMenuDialog has been called in an invalid state.")
	endFunction
	
	function RefreshPages()
		Trace(DEBUG_MSG + "RefreshPages has been called in an invalid state.")
	endfunction
	
	function CloseMCM(bool close_journal = false)
		Trace(DEBUG_MSG + "CloseMCM has been called in an invalid state.")
	endfunction

	function SaveMCMToPreset(string preset_path)
		Trace(DEBUG_MSG + "SaveMCMToPreset has been called in an invalid state.")
	endfunction
	
	function LoadMCMFromPreset(string preset_path)
		Trace(DEBUG_MSG + "LoadMCMFromPreset has been called in an invalid state.")
	endfunction
	
	string[] function GetMCMSavedPresets(string default, string dir_path = ".")
		Trace(DEBUG_MSG + "GetMCMSavedPresets has been called in an invalid state.")
		return None
	endfunction 
	
	function DeleteMCMSavedPreset(string preset_path)
		Trace(DEBUG_MSG + "DeleteMCMSavedPreset has been called in an invalid state.")
	endfunction

	function SetCursorFillMode(int a_fillMode)
		Trace(DEBUG_MSG + "SetCursorFillMode has been called in an invalid state.")
	endfunction
	
	int function AddHeaderOption(string a_text, int a_flags = 0)
		Trace(DEBUG_MSG + "AddHeaderOption has been called in an invalid state.")
		return ERROR_MODULE_INIT
	endfunction
	
	int function AddEmptyOption()
		Trace(DEBUG_MSG + "AddEmptyOption has been called in an invalid state.")
		return ERROR_MODULE_INIT
	endfunction
	
	function AddTextOptionST(string a_stateName, string a_text, string a_value, int a_flags = 0)
		Trace(DEBUG_MSG + "AddTextOptionST has been called in an invalid state.")
	endfunction
	
	function AddToggleOptionST(string a_stateName, string a_text, bool a_checked, int a_flags = 0)
		Trace(DEBUG_MSG + "AddToggleOptionST has been called in an invalid state.")
	endfunction
	
	function AddSliderOptionST(string a_stateName, string a_text, float a_value, string a_formatString = "{0}", int a_flags = 0)
		Trace(DEBUG_MSG + "AddSliderOptionST has been called in an invalid state.")
	endfunction
	
	function AddMenuOptionST(string a_stateName, string a_text, string a_value, int a_flags = 0)
		Trace(DEBUG_MSG + "AddMenuOptionST has been called in an invalid state.")
	endfunction
	
	function AddColorOptionST(string a_stateName, string a_text, int a_color, int a_flags = 0)
		Trace(DEBUG_MSG + "AddColorOptionST has been called in an invalid state.")
	endfunction
	
	function AddKeyMapOptionST(string a_stateName, string a_text, int a_keyCode, int a_flags = 0)	
		Trace(DEBUG_MSG + "AddKeyMapOptionST has been called in an invalid state.")
	endfunction
	
	function SetOptionFlagsST(int a_flags, bool a_noUpdate = false, string a_stateName = "")
		Trace(DEBUG_MSG + "SetOptionFlagsST has been called in an invalid state.")
	endfunction
	
	function SetTextOptionValueST(string a_value, bool a_noUpdate = false, string a_stateName = "")
		Trace(DEBUG_MSG + "SetTextOptionValueST has been called in an invalid state.")
	endfunction
	
	function SetToggleOptionValueST(bool a_checked, bool a_noUpdate = false, string a_stateName = "")
		Trace(DEBUG_MSG + "SetToggleOptionValueST has been called in an invalid state.")
	endfunction
	
	function SetSliderOptionValueST(float a_value, string a_formatString = "{0}", bool a_noUpdate = false, string a_stateName = "")	
		Trace(DEBUG_MSG + "SetSliderOptionValueST has been called in an invalid state.")
	endfunction
	
	function SetMenuOptionValueST(string a_value, bool a_noUpdate = false, string a_stateName = "")
		Trace(DEBUG_MSG + "SetMenuOptionValueST has been called in an invalid state.")
	endfunction
	
	function SetColorOptionValueST(int a_color, bool a_noUpdate = false, string a_stateName = "")
		Trace(DEBUG_MSG + "SetColorOptionValueST has been called in an invalid state.")
	endfunction
	
	function SetKeyMapOptionValueST(int a_keyCode, bool a_noUpdate = false, string a_stateName = "")
		Trace(DEBUG_MSG + "SetKeyMapOptionValueST has been called in an invalid state.")
	endfunction
	
	function SetSliderDialogStartValue(float a_value)
		Trace(DEBUG_MSG + "SetSliderDialogStartValue has been called in an invalid state.")
	endfunction
	
	function SetSliderDialogDefaultValue(float a_value)
		Trace(DEBUG_MSG + "SetSliderDialogDefaultValue has been called in an invalid state.")
	endfunction
	
	function SetSliderDialogRange(float a_minValue, float a_maxValue)
		Trace(DEBUG_MSG + "SetSliderDialogRange has been called in an invalid state.")
	endfunction
	
	function SetSliderDialogInterval(float a_value)
		Trace(DEBUG_MSG + "SetSliderDialogInterval has been called in an invalid state.")
	endfunction
	
	function SetMenuDialogStartIndex(int a_value)
		Trace(DEBUG_MSG + "SetMenuDialogStartIndex has been called in an invalid state.")
	endfunction
	
	function SetMenuDialogDefaultIndex(int a_value)
		Trace(DEBUG_MSG + "SetMenuDialogDefaultIndex has been called in an invalid state.")
	endfunction
	
	function SetMenuDialogOptions(string[] a_options)
		Trace(DEBUG_MSG + "SetMenuDialogOptions has been called in an invalid state.")
	endfunction
	
	function SetColorDialogStartColor(int a_color)
		Trace(DEBUG_MSG + "SetColorDialogStartColor has been called in an invalid state.")
	endfunction
	
	function SetColorDialogDefaultColor(int a_color)
		Trace(DEBUG_MSG + "SetColorDialogDefaultColor has been called in an invalid state.")
	endfunction
	
	function SetCursorPosition(int a_position)
		Trace(DEBUG_MSG + "SetCursorPosition has been called in an invalid state.")
	endfunction
	
	function SetInfoText(string a_text)
		Trace(DEBUG_MSG + "SetInfoText has been called in an invalid state.")
	endfunction
	
	function ForcePageReset()
		Trace(DEBUG_MSG + "ForcePageReset has been called in an invalid state.")
	endfunction
	
	function LoadCustomContent(string a_source, float a_x = 0.0, float a_y = 0.0)
		Trace(DEBUG_MSG + "LoadCustomContent has been called in an invalid state.")
	endfunction
	
	function UnloadCustomContent()
		Trace(DEBUG_MSG + "UnloadCustomContent has been called in an invalid state.")
	endfunction
	
	bool function ShowMessage(string a_message, bool a_withCancel = true, string a_acceptLabel = "$Accept", string a_cancelLabel = "$Cancel")
		Trace(DEBUG_MSG + "ShowMessage has been called in an invalid state.")
		return false
	endfunction

;-------\-----\
; MODULE \ API \
;--------------------------------------------------------

	function SetModName(string name)
		_mod_name = name
	endfunction

	function SetSplashScreen(string path, float x = 0.0, float y = 0.0)
		_splash_path = path
		_splash_x = x
		_splash_y = y
	endfunction

	function SetFont(int font = 0x00)
		_font = font
	endfunction

	function KeepTryingToRegister()
		if _page_name != ""
			RegisterForModEvent("SKICP_configManagerReady", "_OnConfigManagerReady")
		endif
	endfunction

	int function RegisterModule(string page_name, int z = 0, string quest_editorid = "")				
		_quest_editorid = quest_editorid
		_page_name = page_name
		_z = z
		
		if quest_editorid == ""
			_MCM = (self as quest) as nl_mcm
		else
			quest mcm_quest = Quest.GetQuest(quest_editorid)
			
			if !mcm_quest
				Notification(DEBUG_MSG + "Quest with editor id " + _quest_editorid + " could not be found.")
				return ERROR_MCM_NONEQUEST
			endif
		
			_MCM = mcm_quest as nl_mcm
		endif
		
		if !_MCM
			Notification(DEBUG_MSG + "Quest with editor id " + _quest_editorid + " has no nl_mcm attached.")
			return ERROR_MCM_NONE
		endif
		
		int error_code = _MCM._RegisterModule(self, page_name, z)
		
		if error_code == OK
			_current_version = GetVersion()
			OnPageInit()
			GoToState("")
		elseif error_code == ERROR_MODULE_FULL
			Notification(DEBUG_MSG + "The hooked MCM has already reached the page limit.")
		elseif error_code == ERROR_MODULE_TAKEN
			Notification(DEBUG_MSG + "The hooked MCM already has a page with the same name.")
		endif
		
		return error_code
	endfunction
		
	int function UnregisterModule()
		return ERROR
	endfunction
endstate

function KeepTryingToRegister()
	Trace(DEBUG_MSG + "KeepTryingToRegister has been called in an invalid state.")
endfunction

function StopTryingToRegister()
	UnregisterForModEvent("SKICP_configManagerReady")

	if _MCM
		if _mod_name
			_MCM.SetModName(_mod_name)
		endif

		if _splash_path
			_MCM.SetSplashScreen(_splash_path, _splash_x, _splash_y)
		endif

		if _font
			_MCM.SetFont(_font)
		endif
	else
		_page_name = ""
		_z = 0
	endif

	_quest_editorid = ""
	_mod_name = ""
	_splash_path = ""
	_splash_x = 0.0
	_splash_y = 0.0
endfunction

event _OnConfigManagerReady(string a_eventName, string a_strArg, float a_numArg, Form a_sender)
	Trace(DEBUG_MSG + "_OnConfigManagerReady has been called in an invalid state.")
endevent

int function RegisterModule(string page_name, int z = 0, string quest_editorid = "")
	return ERROR
endfunction

int function UnregisterModule()
	int error_code = _MCM._UnregisterModule(_page_name)
	
	if error_code == OK
		GoToState("_inactive")
		_quest_editorid = ""
		_page_name = ""
		_z = 0
	elseif error_code == ERROR_MODULE_INIT
		Notification(DEBUG_MSG + "The hooked MCM is not initialized.")
	elseif error_code == ERROR_MODULE_NONE
		Notification(DEBUG_MSG + "The hooked MCM has no matching page name.")
	endif
	
	return error_code
endfunction

;--------\-----\
; MCM API \ NEW \
;--------------------------------------------------------

; ERROR CODES
int property OK = 1 autoreadonly
int property ERROR = 0 autoreadonly

int property ERROR_MODULE_FULL = -1 autoreadonly
int property ERROR_MODULE_TAKEN = -2 autoreadonly
int property ERROR_MODULE_INIT = -3 autoreadonly
int property ERROR_MODULE_NONE = -4 autoreadonly

int property ERROR_MCM_NONEQUEST = -10 autoreadonly
int property ERROR_MCM_NONE = -20 autoreadonly

; FONTS
int property FONT_DEFAULT = 0x00 autoreadonly
{ Default font color }
int property FONT_PAPER = 0x01 autoreadonly
{ Paper font color }

int property CURRENT_FONT
{
	Get the current font.
	@get Current font
}
    int function Get()
		if _font > FONT_PAPER
			return FONT_DEFAULT
		endif
		return _font
	endfunction
endproperty

string function FONT_PRIMARY(string text = "")
	if _font == FONT_PAPER
		return "<font color='#005500'>" + text + "</font>"
	endif
	return "<font color='#EDDA87'>" + text + "</font>"
endfunction

string function FONT_SECONDARY(string text = "")
	if _font == FONT_PAPER
		return "<font color='#412600'>" + text + "</font>"
	endif
	return "<font color='#6B7585'>" + text + "</font>"
endfunction

string function FONT_SUCCESS(string text = "")
	if _font == FONT_PAPER
		return "<font color='#006D00'>" + text + "</font>"
	endif
	return "<font color='#51DB2E'>" + text + "</font>"
endfunction

string function FONT_DANGER(string text = "")
	if _font == FONT_PAPER
		return "<font color='#5E000E'>" + text + "</font>"
	endif
	return "<font color='#C73636'>" + text + "</font>"
endfunction

string function FONT_WARNING(string text = "")
	if _font == FONT_PAPER
		return "<font color='#FFFF00'>" + text + "</font>"
	endif
	return "<font color='#EAAB00'>" + text + "</font>"
endfunction

string function FONT_INFO(string text = "")
	if _font == FONT_PAPER
		return "<font color='#121C4A'>" + text + "</font>"
	endif
	return "<font color='#A2BEFF'>" + text + "</font>"
endfunction

; PROPERTIES
nl_mcm property UNSAFE_RAW_MCM
{
	Grab the pointer to the main mcm script. \
	Note: You can speed up your script by using this, but you better know what you are doing.
	@get The nl_mcm script
}
    nl_mcm function Get()
        return _MCM
	endfunction
endproperty

quest property OWNING_QUEST
{
	Grab the owning quest of the main mcm script. \
	This is identical to casting "UNSAFE_RAW_MCM as quest".
	@get The nl_mcm quest
}
	quest function Get()
		return _MCM as quest
	endfunction
endproperty

int property MCM_ID
{
	Retrieve's the mcm's mod id. \
	Note: Don't cache this, as it might change on gamereloads.
	@get Mcm id
}
	int function get()
		return _MCM.MCM_ID
	endfunction
endproperty

int property MCM_QuickHotkey
{
	If this hotkey is set, it allows the user to immediately open or close the mcm menu \
	by pressing the defined hotkey.
	@get Get the current quickhotkey for the mcm
	@set Set the new quickhotkey for the mcm
}
	int function Get()
		return _MCM.MCM_QuickHotkey
	endfunction

	function Set(int keycode)
		_MCM.MCM_QuickHotkey = keycode
	endfunction
endproperty

string function GetCommonStore(bool lock)
{
	Get the shared common store string. \
	NOTE: Always lock the storage if you are planning on using SetCommonStore afterwards.
	@param lock - If the shared common store should lock changes from other pages
	@return The common store string
}
	return _MCM.GetCommonStore(_page_name, lock)
endfunction

function SetCommonStore(string new_value)
{
	Set the shared common store string. \
	NOTE: This will always unlock the common store
	@param new_value - The new string
}
	_MCM.SetCommonStore(_page_name, new_value)
endfunction

function AddParagraph(string text, string format = "", int flags = 0x01)
{
	A convenience function to add a paragraph of text to the mcm page. \
	Text splitting occurs when the max line length is reached,or when a newline character (\n) is encountered. \
	NOTE: You need to use the format parameter for fonts
	@param text - The text to add as a paragraph to the page
	@param format - The format/font to wrap the text in.
	@param flags - The default flag of the added text options 
}
	_MCM.AddParagraph(text, format, flags)
endfunction

function SetModName(string name)
{
	Set the mod page name. Can only be used before the MCM has been initialized.
	@param name - The mod's name
}
	_MCM.SetModName(name)
endfunction

function SetSplashScreen(string path, float x = 0.0, float y = 0.0)
{
	Set a splash screen to use for the "" page of the mcm menu.
	@param path - File path of the splash screen
	@param x - The x position of the splash screen
	@param y - The y position of the splash screen
}
	_MCM.SetSplashScreen(path, x, y)
endfunction

function SetFont(int font = 0x00)
{
	Set font color. \
	See: [Default Color](#FONT_DEFAULT) and [Paper Color](#FONT_PAPER).
	@param font - The new font color
}
	_MCM.SetFont(font)
endfunction

function SetSliderDialog(float value, float range_start, float range_end, float interval, float default = 0.0)
{
	A convenience function to set all of the slider data using only 1 function.
	@param value - The value the slider is set at
	@param range_start - The start value of the slider
	@param range_end - The end value of the slider
	@param interval - The interval at which increments/decrements are done to the value
	@param default - The default value of the slider
}
	_MCM.SetSliderDialog(value, range_start, range_end, interval, default)
endFunction 

function SetMenuDialog(string[] options, int start_i, int default_i = 0)
{
	A convenience function to set all of the menu data using only 1 function.
	@param options - The array containig the options for the menu
	@param start_i - The start selection/index of the menu
	@param default_i - The default selection/index for the menu
}
	_MCM.SetMenuDialog(options, start_i, default_i)
endFunction

function RefreshPages()
{
	Refreshes the mod's mcm pages. \
	Useful for situations where new pages/modules have been registered whilst the player is still in the mod's mcm menu, \
	which will require the page list to be refreshed.
}
	_MCM.RefreshPages()
endfunction

function CloseMCM(bool close_journal = false)
{
	Close the current MCM.
	@param close_journal - If set to true, it will close the quest journal too
}
	_MCM.CloseMCM(close_journal)
endfunction

function SaveMCMToPreset(string preset_path)
{
	Calls the local SaveData function on all module scripts, storing the resulting JObjects under the given file name.
	@param preset_path - The path to the preset to store the settings under
}
	_MCM.SaveMCMToPreset(preset_path)
endfunction
	
function LoadMCMFromPreset(string preset_path)
{
	Calls the local LoadData function on all module scripts, using the JObjects loaded from the given file.
	@param preset_path - The path to the preset to load settings from
}
	_MCM.LoadMCMFromPreset(preset_path)
endfunction
	
string[] function GetMCMSavedPresets(string default, string dir_path = ".")
{
	Get an array containing the name of all saved presets.
	@param default - A default string to fill the list with. Used to create a "fake exit" button for mcm menus
	@param dir_path - The directory path of the presets. Defaults to current mcm menu directory 
	@return Saved preset names at given path
}
	return _MCM.GetMCMSavedPresets(default, dir_path)
endfunction 
	
function DeleteMCMSavedPreset(string preset_path)
{
	Delete a given preset from the settings folder. 
	@param preset_path - The path to the preset to delete
}
	_MCM.DeleteMCMSavedPreset(preset_path)
endfunction

;--------\----------\
; MCM API \ ORIGINAL \
;--------------------------------------------------------

; PAGE FLAGS
int property OPTION_FLAG_NONE = 0x00 autoReadonly
int property OPTION_FLAG_DISABLED = 0x01 autoReadonly
int property OPTION_FLAG_HIDDEN	 = 0x02 autoReadonly
int property OPTION_FLAG_WITH_UNMAP	= 0x04 autoReadonly

int property LEFT_TO_RIGHT = 1 autoReadonly
int property TOP_TO_BOTTOM = 2 autoReadonly

; VERSION
int property CurrentVersion hidden
    int function Get()
        return _current_version
    endFunction
endproperty

function SetCursorFillMode(int a_fillMode)
	_MCM.SetCursorFillMode(a_fillMode)
endfunction

int function AddHeaderOption(string a_text, int a_flags = 0)
	return _MCM.AddHeaderOption(a_text, a_flags)
endfunction

int function AddEmptyOption()
	return _MCM.AddEmptyOption()
endfunction

function AddTextOptionST(string a_stateName, string a_text, string a_value, int a_flags = 0)
	_MCM.AddTextOptionST(a_stateName, a_text, a_value, a_flags)
endfunction

function AddToggleOptionST(string a_stateName, string a_text, bool a_checked, int a_flags = 0)
	_MCM.AddToggleOptionST(a_stateName, a_text, a_checked, a_flags)
endfunction

function AddSliderOptionST(string a_stateName, string a_text, float a_value, string a_formatString = "{0}", int a_flags = 0)
	_MCM.AddSliderOptionST(a_stateName, a_text, a_value, a_formatString, a_flags)
endfunction

function AddMenuOptionST(string a_stateName, string a_text, string a_value, int a_flags = 0)
	_MCM.AddMenuOptionST(a_stateName, a_text, a_value, a_flags)
endfunction

function AddColorOptionST(string a_stateName, string a_text, int a_color, int a_flags = 0)
	_MCM.AddColorOptionST(a_stateName, a_text, a_color, a_flags)
endfunction

function AddKeyMapOptionST(string a_stateName, string a_text, int a_keyCode, int a_flags = 0)	
	_MCM.AddKeyMapOptionST(a_stateName, a_text, a_keyCode, a_flags)
endfunction

function SetOptionFlagsST(int a_flags, bool a_noUpdate = false, string a_stateName = "")
	_MCM.SetOptionFlagsST(a_flags, a_noUpdate, a_stateName)
endfunction

function SetTextOptionValueST(string a_value, bool a_noUpdate = false, string a_stateName = "")
	_MCM.SetTextOptionValueST(a_value, a_noUpdate, a_stateName)
endfunction

function SetToggleOptionValueST(bool a_checked, bool a_noUpdate = false, string a_stateName = "")
	_MCM.SetToggleOptionValueST(a_checked, a_noUpdate, a_stateName)
endfunction

function SetSliderOptionValueST(float a_value, string a_formatString = "{0}", bool a_noUpdate = false, string a_stateName = "")	
	_MCM.SetSliderOptionValueST(a_value, a_formatString, a_noUpdate, a_stateName)
endfunction

function SetMenuOptionValueST(string a_value, bool a_noUpdate = false, string a_stateName = "")
	_MCM.SetMenuOptionValueST(a_value, a_noUpdate, a_stateName)
endfunction

function SetColorOptionValueST(int a_color, bool a_noUpdate = false, string a_stateName = "")
	_MCM.SetColorOptionValueST(a_color, a_noUpdate, a_stateName)
endfunction

function SetKeyMapOptionValueST(int a_keyCode, bool a_noUpdate = false, string a_stateName = "")
	_MCM.SetKeyMapOptionValueST(a_keyCode, a_noUpdate, a_stateName)
endfunction

function SetSliderDialogStartValue(float a_value)
	_MCM.SetSliderDialogStartValue(a_value)
endfunction

function SetSliderDialogDefaultValue(float a_value)
	_MCM.SetSliderDialogDefaultValue(a_value)
endfunction

function SetSliderDialogRange(float a_minValue, float a_maxValue)
	_MCM.SetSliderDialogRange(a_minValue, a_maxValue)
endfunction

function SetSliderDialogInterval(float a_value)
	_MCM.SetSliderDialogInterval(a_value)
endfunction

function SetMenuDialogStartIndex(int a_value)
	_MCM.SetMenuDialogStartIndex(a_value)
endfunction

function SetMenuDialogDefaultIndex(int a_value)
    _MCM.SetMenuDialogDefaultIndex(a_value)
endfunction

function SetMenuDialogOptions(string[] a_options)
	_MCM.SetMenuDialogOptions(a_options)
endfunction

function SetColorDialogStartColor(int a_color)
	_MCM.SetColorDialogStartColor(a_color)
endfunction

function SetColorDialogDefaultColor(int a_color)
	_MCM.SetColorDialogDefaultColor(a_color)
endfunction

function SetCursorPosition(int a_position)
	_MCM.SetCursorPosition(a_position)
endfunction

function SetInfoText(string a_text)
	_MCM.SetInfoText(a_text)
endfunction

function ForcePageReset()
	_MCM.ForcePageReset()
endfunction

function LoadCustomContent(string a_source, float a_x = 0.0, float a_y = 0.0)
	_MCM.LoadCustomContent(a_source, a_x, a_y)
endfunction

function UnloadCustomContent()
	_MCM.UnloadCustomContent()
endfunction

bool function ShowMessage(string a_message, bool a_withCancel = true, string a_acceptLabel = "$Accept", string a_cancelLabel = "$Cancel")
	return _MCM.ShowMessage(a_message, a_withCancel, a_acceptLabel, a_cancelLabel)
endfunction

;-------------\
; OVERRIDE API \
;--------------------------------------------------------

int function GetVersion()
	return 1
endfunction

int function SaveData()
endfunction

function LoadData(int jObj)
endfunction

event OnVersionUpdateBase(int a_version)
endevent

event OnVersionUpdate(int a_version)
endevent

event OnConfigClose()
endevent

event OnPageInit()
endevent

event OnPageDraw()
endevent

event OnDefaultST()
endevent

event OnHighlightST()
endevent

event OnSelectST()
endevent

event OnSliderOpenST()
endevent

event OnMenuOpenST()
endevent

event OnColorOpenST()
endevent

event OnSliderAcceptST(float f)
endevent

event OnMenuAcceptST(int i)
endevent

event OnColorAcceptST(int col)
endevent

event OnInputOpenST()
endevent

event OnInputAcceptST(string str)
endevent

event OnKeyMapChangeST(int keycode)
endevent
