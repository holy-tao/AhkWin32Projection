#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * 
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapicontroliunknown
 * @namespace Windows.Win32.System.AddressBook
 * @version v4.0.30319
 */
class IMAPIControl extends IUnknown{

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetLastError", "Activate", "GetState"]

    /**
     * 
     * @param {HRESULT} hResult 
     * @param {Integer} ulFlags 
     * @returns {Pointer<MAPIERROR>} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapicontrol-getlasterror
     */
    GetLastError(hResult, ulFlags) {
        result := ComCall(3, this, "int", hResult, "uint", ulFlags, "ptr*", &lppMAPIError := 0, "HRESULT")
        return lppMAPIError
    }

    /**
     * 
     * @param {Integer} ulFlags 
     * @param {Pointer} ulUIParam 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapicontrol-activate
     */
    Activate(ulFlags, ulUIParam) {
        result := ComCall(4, this, "uint", ulFlags, "ptr", ulUIParam, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulFlags 
     * @param {Pointer<Integer>} lpulState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapicontrol-getstate
     */
    GetState(ulFlags, lpulState) {
        lpulStateMarshal := lpulState is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "uint", ulFlags, lpulStateMarshal, lpulState, "HRESULT")
        return result
    }
}
