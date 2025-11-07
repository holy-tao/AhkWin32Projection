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
     * 
     * @param {Integer} eCmdID 
     * @param {Integer} nState 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iconsoleverb-getverbstate
     */
    GetVerbState(eCmdID, nState) {
        result := ComCall(3, this, "int", eCmdID, "int", nState, "int*", &pState := 0, "HRESULT")
        return pState
    }

    /**
     * 
     * @param {Integer} eCmdID 
     * @param {Integer} nState 
     * @param {BOOL} bState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iconsoleverb-setverbstate
     */
    SetVerbState(eCmdID, nState, bState) {
        result := ComCall(4, this, "int", eCmdID, "int", nState, "int", bState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} eCmdID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iconsoleverb-setdefaultverb
     */
    SetDefaultVerb(eCmdID) {
        result := ComCall(5, this, "int", eCmdID, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iconsoleverb-getdefaultverb
     */
    GetDefaultVerb() {
        result := ComCall(6, this, "int*", &peCmdID := 0, "HRESULT")
        return peCmdID
    }
}
