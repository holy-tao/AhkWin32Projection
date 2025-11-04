#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * 
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/iprovideradminiunknown
 * @namespace Windows.Win32.System.AddressBook
 * @version v4.0.30319
 */
class IProviderAdmin extends IUnknown{

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
    static VTableNames => ["GetLastError", "GetProviderTable", "CreateProvider", "DeleteProvider", "OpenProfileSection"]

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
     * @param {Pointer<IMAPITable>} lppTable 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/iprovideradmin-getprovidertable
     */
    GetProviderTable(ulFlags, lppTable) {
        result := ComCall(4, this, "uint", ulFlags, "ptr*", lppTable, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} lpszProvider 
     * @param {Integer} cValues 
     * @param {Pointer<SPropValue>} lpProps 
     * @param {Pointer} ulUIParam 
     * @param {Integer} ulFlags 
     * @param {Pointer<MAPIUID>} lpUID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/iprovideradmin-createprovider
     */
    CreateProvider(lpszProvider, cValues, lpProps, ulUIParam, ulFlags, lpUID) {
        lpszProviderMarshal := lpszProvider is VarRef ? "char*" : "ptr"

        result := ComCall(5, this, lpszProviderMarshal, lpszProvider, "uint", cValues, "ptr", lpProps, "ptr", ulUIParam, "uint", ulFlags, "ptr", lpUID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<MAPIUID>} lpUID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/iprovideradmin-deleteprovider
     */
    DeleteProvider(lpUID) {
        result := ComCall(6, this, "ptr", lpUID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<MAPIUID>} lpUID 
     * @param {Pointer<Guid>} lpInterface 
     * @param {Integer} ulFlags 
     * @param {Pointer<IProfSect>} lppProfSect 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/iprovideradmin-openprofilesection
     */
    OpenProfileSection(lpUID, lpInterface, ulFlags, lppProfSect) {
        result := ComCall(7, this, "ptr", lpUID, "ptr", lpInterface, "uint", ulFlags, "ptr*", lppProfSect, "HRESULT")
        return result
    }
}
