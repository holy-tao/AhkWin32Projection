#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 * @version v4.0.30319
 */
class IDtcToXaHelperSinglePipe extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDtcToXaHelperSinglePipe
     * @type {Guid}
     */
    static IID => Guid("{47ed4971-53b3-11d1-bbb9-00c04fd658f6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["XARMCreate", "ConvertTridToXID", "EnlistWithRM", "ReleaseRMCookie"]

    /**
     * 
     * @param {PSTR} pszDSN 
     * @param {PSTR} pszClientDll 
     * @param {Pointer<Integer>} pdwRMCookie 
     * @returns {HRESULT} 
     */
    XARMCreate(pszDSN, pszClientDll, pdwRMCookie) {
        result := ComCall(3, this, "ptr", pszDSN, "ptr", pszClientDll, "uint*", pdwRMCookie, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwITrans 
     * @param {Integer} dwRMCookie 
     * @param {Pointer<XID>} pxid 
     * @returns {HRESULT} 
     */
    ConvertTridToXID(pdwITrans, dwRMCookie, pxid) {
        result := ComCall(4, this, "uint*", pdwITrans, "uint", dwRMCookie, "ptr", pxid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwRMCookie 
     * @param {ITransaction} i_pITransaction 
     * @param {ITransactionResourceAsync} i_pITransRes 
     * @param {Pointer<ITransactionEnlistmentAsync>} o_ppITransEnslitment 
     * @returns {HRESULT} 
     */
    EnlistWithRM(dwRMCookie, i_pITransaction, i_pITransRes, o_ppITransEnslitment) {
        result := ComCall(5, this, "uint", dwRMCookie, "ptr", i_pITransaction, "ptr", i_pITransRes, "ptr*", o_ppITransEnslitment, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} i_dwRMCookie 
     * @param {BOOL} i_fNormal 
     * @returns {String} Nothing - always returns an empty string
     */
    ReleaseRMCookie(i_dwRMCookie, i_fNormal) {
        ComCall(6, this, "uint", i_dwRMCookie, "int", i_fNormal)
    }
}
