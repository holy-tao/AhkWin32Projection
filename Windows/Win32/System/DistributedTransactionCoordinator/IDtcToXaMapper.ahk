#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 * @version v4.0.30319
 */
class IDtcToXaMapper extends IUnknown{
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
     * 
     * @param {PSTR} pszDSN 
     * @param {PSTR} pszClientDllName 
     * @param {Pointer<UInt32>} pdwRMCookie 
     * @returns {HRESULT} 
     */
    RequestNewResourceManager(pszDSN, pszClientDllName, pdwRMCookie) {
        result := ComCall(3, this, "ptr", pszDSN, "ptr", pszClientDllName, "uint*", pdwRMCookie, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwITransaction 
     * @param {Integer} dwRMCookie 
     * @param {Pointer<XID>} pXid 
     * @returns {HRESULT} 
     */
    TranslateTridToXid(pdwITransaction, dwRMCookie, pXid) {
        result := ComCall(4, this, "uint*", pdwITransaction, "uint", dwRMCookie, "ptr", pXid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwRMCookie 
     * @param {Pointer<UInt32>} pdwITransaction 
     * @returns {HRESULT} 
     */
    EnlistResourceManager(dwRMCookie, pdwITransaction) {
        result := ComCall(5, this, "uint", dwRMCookie, "uint*", pdwITransaction, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwRMCookie 
     * @returns {HRESULT} 
     */
    ReleaseResourceManager(dwRMCookie) {
        result := ComCall(6, this, "uint", dwRMCookie, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
