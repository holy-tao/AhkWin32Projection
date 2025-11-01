#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 * @version v4.0.30319
 */
class IDtcToXaMapper extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDtcToXaMapper
     * @type {Guid}
     */
    static IID => Guid("{64ffabe0-7ce9-11d0-8ce6-00c04fdc877e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RequestNewResourceManager", "TranslateTridToXid", "EnlistResourceManager", "ReleaseResourceManager"]

    /**
     * 
     * @param {PSTR} pszDSN 
     * @param {PSTR} pszClientDllName 
     * @param {Pointer<Integer>} pdwRMCookie 
     * @returns {HRESULT} 
     */
    RequestNewResourceManager(pszDSN, pszClientDllName, pdwRMCookie) {
        pszDSN := pszDSN is String ? StrPtr(pszDSN) : pszDSN
        pszClientDllName := pszClientDllName is String ? StrPtr(pszClientDllName) : pszClientDllName

        result := ComCall(3, this, "ptr", pszDSN, "ptr", pszClientDllName, "uint*", pdwRMCookie, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwITransaction 
     * @param {Integer} dwRMCookie 
     * @param {Pointer<XID>} pXid 
     * @returns {HRESULT} 
     */
    TranslateTridToXid(pdwITransaction, dwRMCookie, pXid) {
        result := ComCall(4, this, "uint*", pdwITransaction, "uint", dwRMCookie, "ptr", pXid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwRMCookie 
     * @param {Pointer<Integer>} pdwITransaction 
     * @returns {HRESULT} 
     */
    EnlistResourceManager(dwRMCookie, pdwITransaction) {
        result := ComCall(5, this, "uint", dwRMCookie, "uint*", pdwITransaction, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwRMCookie 
     * @returns {HRESULT} 
     */
    ReleaseResourceManager(dwRMCookie) {
        result := ComCall(6, this, "uint", dwRMCookie, "HRESULT")
        return result
    }
}
