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
     * Retrieves the calling thread's last-error code value.
     * @param {HRESULT} hResult 
     * @param {Integer} ulFlags 
     * @param {Pointer<Pointer<MAPIERROR>>} lppMAPIError 
     * @returns {HRESULT} The return value is the calling thread's last-error code.
     * 
     * The Return Value section of the documentation for each function that sets the last-error code notes the conditions under which the function sets the last-error code. Most functions that set the thread's last-error code set it when they fail. However, some functions also set the last-error code when they succeed. If the function is not documented to set the last-error code, the value returned by this function is simply the most recent last-error code to have been set; some functions set the last-error code to 0 on success and others do not.
     * @see https://docs.microsoft.com/windows/win32/api//errhandlingapi/nf-errhandlingapi-getlasterror
     */
    GetLastError(hResult, ulFlags, lppMAPIError) {
        lppMAPIErrorMarshal := lppMAPIError is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "int", hResult, "uint", ulFlags, lppMAPIErrorMarshal, lppMAPIError, "HRESULT")
        return result
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
