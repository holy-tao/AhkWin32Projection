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
     * 
     * @param {Integer} eCmdID 
     * @param {Integer} nState 
     * @param {Pointer<BOOL>} pState 
     * @returns {HRESULT} 
     */
    GetVerbState(eCmdID, nState, pState) {
        result := ComCall(3, this, "int", eCmdID, "int", nState, "ptr", pState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} eCmdID 
     * @param {Integer} nState 
     * @param {BOOL} bState 
     * @returns {HRESULT} 
     */
    SetVerbState(eCmdID, nState, bState) {
        result := ComCall(4, this, "int", eCmdID, "int", nState, "int", bState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} eCmdID 
     * @returns {HRESULT} 
     */
    SetDefaultVerb(eCmdID) {
        result := ComCall(5, this, "int", eCmdID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} peCmdID 
     * @returns {HRESULT} 
     */
    GetDefaultVerb(peCmdID) {
        result := ComCall(6, this, "int*", peCmdID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
