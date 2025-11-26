#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMAPITable.ahk
#Include .\MAPIUID.ahk
#Include .\IProfSect.ahk
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
     * 
     * @param {HRESULT} hResult 
     * @param {Integer} ulFlags 
     * @returns {Pointer<MAPIERROR>} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/iprovideradmin-getlasterror
     */
    GetLastError(hResult, ulFlags) {
        result := ComCall(3, this, "int", hResult, "uint", ulFlags, "ptr*", &lppMAPIError := 0, "HRESULT")
        return lppMAPIError
    }

    /**
     * 
     * @param {Integer} ulFlags 
     * @returns {IMAPITable} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/iprovideradmin-getprovidertable
     */
    GetProviderTable(ulFlags) {
        result := ComCall(4, this, "uint", ulFlags, "ptr*", &lppTable := 0, "HRESULT")
        return IMAPITable(lppTable)
    }

    /**
     * 
     * @param {Pointer<Integer>} lpszProvider 
     * @param {Integer} cValues 
     * @param {Pointer<SPropValue>} lpProps 
     * @param {Pointer} ulUIParam 
     * @param {Integer} ulFlags 
     * @returns {MAPIUID} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/iprovideradmin-createprovider
     */
    CreateProvider(lpszProvider, cValues, lpProps, ulUIParam, ulFlags) {
        lpszProviderMarshal := lpszProvider is VarRef ? "char*" : "ptr"

        lpUID := MAPIUID()
        result := ComCall(5, this, lpszProviderMarshal, lpszProvider, "uint", cValues, "ptr", lpProps, "ptr", ulUIParam, "uint", ulFlags, "ptr", lpUID, "HRESULT")
        return lpUID
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
     * @returns {IProfSect} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/iprovideradmin-openprofilesection
     */
    OpenProfileSection(lpUID, lpInterface, ulFlags) {
        result := ComCall(7, this, "ptr", lpUID, "ptr", lpInterface, "uint", ulFlags, "ptr*", &lppProfSect := 0, "HRESULT")
        return IProfSect(lppProfSect)
    }
}
