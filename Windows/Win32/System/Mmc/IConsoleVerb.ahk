#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * The IConsoleVerb interface allows snap-ins to enable standard verbs including cut, copy, paste, delete, properties, rename, refresh, and print. When an item is selected, the snap-in can update the state of these verbs.
 * @remarks
 * 
 * IID_IConsoleVerb is defined as E49F7A60-74AF-11D0-A286-00C04FD8FE93.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mmc/nn-mmc-iconsoleverb
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class IConsoleVerb extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IConsoleVerb
     * @type {Guid}
     */
    static IID => Guid("{e49f7a60-74af-11d0-a286-00c04fd8fe93}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetVerbState", "SetVerbState", "SetDefaultVerb", "GetDefaultVerb"]

    /**
     * The GetVerbState method enables a snap-in to obtain a given verb's current state.
     * @param {Integer} eCmdID A value that specifies the command identifier of the verb. Taken from the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/ne-mmc-mmc_console_verb">MMC_CONSOLE_VERB</a> enumeration. This value cannot be MMC_VERB_NONE.
     * @param {Integer} nState A value that identifies the possible states of the button. Taken from the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/ne-mmc-mmc_button_state">MMC_BUTTON_STATE</a> enumeration.
     * @returns {BOOL} A pointer to the state information returned. <b>TRUE</b> if the state is enabled or hidden and <b>FALSE</b> if the state is disabled or visible.
     * @see https://docs.microsoft.com/windows/win32/api//mmc/nf-mmc-iconsoleverb-getverbstate
     */
    GetVerbState(eCmdID, nState) {
        result := ComCall(3, this, "int", eCmdID, "int", nState, "int*", &pState := 0, "HRESULT")
        return pState
    }

    /**
     * The SetVerbState method enables a snap-in to set a given verb's button state.
     * @param {Integer} eCmdID A value that specifies the command identifier of the verb. Values are taken from the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/ne-mmc-mmc_console_verb">MMC_CONSOLE_VERB</a> enumeration. This value cannot be MMC_VERB_NONE.
     * @param {Integer} nState Identifies the possible states of the button. Taken from the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/ne-mmc-mmc_button_state">MMC_BUTTON_STATE</a> enumeration.
     * @param {BOOL} bState This value is <b>TRUE</b> to enable or hide the verb, <b>FALSE</b> to disable or show the selected verb.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://docs.microsoft.com/windows/win32/api//mmc/nf-mmc-iconsoleverb-setverbstate
     */
    SetVerbState(eCmdID, nState, bState) {
        result := ComCall(4, this, "int", eCmdID, "int", nState, "int", bState, "HRESULT")
        return result
    }

    /**
     * The SetDefaultVerb method sets the default action on an object.
     * @param {Integer} eCmdID The default verb.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://docs.microsoft.com/windows/win32/api//mmc/nf-mmc-iconsoleverb-setdefaultverb
     */
    SetDefaultVerb(eCmdID) {
        result := ComCall(5, this, "int", eCmdID, "HRESULT")
        return result
    }

    /**
     * The GetDefaultVerb method gets the snap-in's default verb.
     * @returns {Integer} A pointer to where the snap-in's default verb is returned.
     * @see https://docs.microsoft.com/windows/win32/api//mmc/nf-mmc-iconsoleverb-getdefaultverb
     */
    GetDefaultVerb() {
        result := ComCall(6, this, "int*", &peCmdID := 0, "HRESULT")
        return peCmdID
    }
}
