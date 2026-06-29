#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\MMC_CONSOLE_VERB.ahk" { MMC_CONSOLE_VERB }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\MMC_BUTTON_STATE.ahk" { MMC_BUTTON_STATE }

/**
 * The IConsoleVerb interface allows snap-ins to enable standard verbs including cut, copy, paste, delete, properties, rename, refresh, and print. When an item is selected, the snap-in can update the state of these verbs.
 * @remarks
 * IID_IConsoleVerb is defined as E49F7A60-74AF-11D0-A286-00C04FD8FE93.
 * @see https://learn.microsoft.com/windows/win32/api/mmc/nn-mmc-iconsoleverb
 * @namespace Windows.Win32.System.Mmc
 */
export default struct IConsoleVerb extends IUnknown {
    /**
     * The interface identifier for IConsoleVerb
     * @type {Guid}
     */
    static IID := Guid("{e49f7a60-74af-11d0-a286-00c04fd8fe93}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IConsoleVerb interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetVerbState   : IntPtr
        SetVerbState   : IntPtr
        SetDefaultVerb : IntPtr
        GetDefaultVerb : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IConsoleVerb.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The GetVerbState method enables a snap-in to obtain a given verb's current state.
     * @remarks
     * When an item is selected, the verb states for all the commands are reset to disabled and hidden. It is up to the snap-in developer to update the verb state when an item is selected.
     * @param {MMC_CONSOLE_VERB} eCmdID A value that specifies the command identifier of the verb. Taken from the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/ne-mmc-mmc_console_verb">MMC_CONSOLE_VERB</a> enumeration. This value cannot be MMC_VERB_NONE.
     * @param {MMC_BUTTON_STATE} nState A value that identifies the possible states of the button. Taken from the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/ne-mmc-mmc_button_state">MMC_BUTTON_STATE</a> enumeration.
     * @returns {BOOL} A pointer to the state information returned. <b>TRUE</b> if the state is enabled or hidden and <b>FALSE</b> if the state is disabled or visible.
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iconsoleverb-getverbstate
     */
    GetVerbState(eCmdID, nState) {
        result := ComCall(3, this, MMC_CONSOLE_VERB, eCmdID, MMC_BUTTON_STATE, nState, BOOL.Ptr, &pState := 0, "HRESULT")
        return pState
    }

    /**
     * The SetVerbState method enables a snap-in to set a given verb's button state.
     * @param {MMC_CONSOLE_VERB} eCmdID A value that specifies the command identifier of the verb. Values are taken from the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/ne-mmc-mmc_console_verb">MMC_CONSOLE_VERB</a> enumeration. This value cannot be MMC_VERB_NONE.
     * @param {MMC_BUTTON_STATE} nState Identifies the possible states of the button. Taken from the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/ne-mmc-mmc_button_state">MMC_BUTTON_STATE</a> enumeration.
     * @param {BOOL} bState This value is <b>TRUE</b> to enable or hide the verb, <b>FALSE</b> to disable or show the selected verb.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iconsoleverb-setverbstate
     */
    SetVerbState(eCmdID, nState, bState) {
        result := ComCall(4, this, MMC_CONSOLE_VERB, eCmdID, MMC_BUTTON_STATE, nState, BOOL, bState, "HRESULT")
        return result
    }

    /**
     * The SetDefaultVerb method sets the default action on an object.
     * @remarks
     * The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/ne-mmc-mmc_console_verb">MMC_CONSOLE_VERB</a> enumeration defines the set of default verbs. The snap-in can set any verb as the default verb. Setting a default verb causes MMC to:
     * 
     * <ul>
     * <li>Show the context menu item for the verb in bold.</li>
     * <li>Perform a default action (only for properties and open verbs) if the snap-in returns S_FALSE in its <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mmc/mmcn-dblclick">MMCN_DBLCLICK</a> notification handler.</li>
     * </ul>
     * @param {MMC_CONSOLE_VERB} eCmdID The default verb.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iconsoleverb-setdefaultverb
     */
    SetDefaultVerb(eCmdID) {
        result := ComCall(5, this, MMC_CONSOLE_VERB, eCmdID, "HRESULT")
        return result
    }

    /**
     * The GetDefaultVerb method gets the snap-in's default verb.
     * @remarks
     * The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/ne-mmc-mmc_console_verb">MMC_CONSOLE_VERB</a> enumeration defines the set of default verbs.
     * @returns {MMC_CONSOLE_VERB} A pointer to where the snap-in's default verb is returned.
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iconsoleverb-getdefaultverb
     */
    GetDefaultVerb() {
        result := ComCall(6, this, "int*", &peCmdID := 0, "HRESULT")
        return peCmdID
    }

    Query(iid) {
        if (IConsoleVerb.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetVerbState := CallbackCreate(GetMethod(implObj, "GetVerbState"), flags, 4)
        this.vtbl.SetVerbState := CallbackCreate(GetMethod(implObj, "SetVerbState"), flags, 4)
        this.vtbl.SetDefaultVerb := CallbackCreate(GetMethod(implObj, "SetDefaultVerb"), flags, 2)
        this.vtbl.GetDefaultVerb := CallbackCreate(GetMethod(implObj, "GetDefaultVerb"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetVerbState)
        CallbackFree(this.vtbl.SetVerbState)
        CallbackFree(this.vtbl.SetDefaultVerb)
        CallbackFree(this.vtbl.GetDefaultVerb)
    }
}
