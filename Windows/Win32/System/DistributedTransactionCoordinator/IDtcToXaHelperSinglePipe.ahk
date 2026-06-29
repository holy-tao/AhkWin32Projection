#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ITransactionEnlistmentAsync.ahk" { ITransactionEnlistmentAsync }
#Import ".\ITransactionResourceAsync.ahk" { ITransactionResourceAsync }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\XID.ahk" { XID }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\ITransaction.ahk" { ITransaction }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 */
export default struct IDtcToXaHelperSinglePipe extends IUnknown {
    /**
     * The interface identifier for IDtcToXaHelperSinglePipe
     * @type {Guid}
     */
    static IID := Guid("{47ed4971-53b3-11d1-bbb9-00c04fd658f6}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDtcToXaHelperSinglePipe interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        XARMCreate       : IntPtr
        ConvertTridToXID : IntPtr
        EnlistWithRM     : IntPtr
        ReleaseRMCookie  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDtcToXaHelperSinglePipe.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PSTR} pszDSN 
     * @param {PSTR} pszClientDll 
     * @param {Pointer<Integer>} pdwRMCookie 
     * @returns {HRESULT} 
     */
    XARMCreate(pszDSN, pszClientDll, pdwRMCookie) {
        pszDSN := pszDSN is String ? StrPtr(pszDSN) : pszDSN
        pszClientDll := pszClientDll is String ? StrPtr(pszClientDll) : pszClientDll

        pdwRMCookieMarshal := pdwRMCookie is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", pszDSN, "ptr", pszClientDll, pdwRMCookieMarshal, pdwRMCookie, "HRESULT")
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
        pdwITransMarshal := pdwITrans is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, pdwITransMarshal, pdwITrans, "uint", dwRMCookie, XID.Ptr, pxid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwRMCookie 
     * @param {ITransaction} i_pITransaction 
     * @param {ITransactionResourceAsync} i_pITransRes 
     * @returns {ITransactionEnlistmentAsync} 
     */
    EnlistWithRM(dwRMCookie, i_pITransaction, i_pITransRes) {
        result := ComCall(5, this, "uint", dwRMCookie, "ptr", i_pITransaction, "ptr", i_pITransRes, "ptr*", &o_ppITransEnslitment := 0, "HRESULT")
        return ITransactionEnlistmentAsync(o_ppITransEnslitment)
    }

    /**
     * 
     * @param {Integer} i_dwRMCookie 
     * @param {BOOL} i_fNormal 
     * @returns {String} Nothing - always returns an empty string
     */
    ReleaseRMCookie(i_dwRMCookie, i_fNormal) {
        ComCall(6, this, "uint", i_dwRMCookie, BOOL, i_fNormal)
    }

    Query(iid) {
        if (IDtcToXaHelperSinglePipe.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.XARMCreate := CallbackCreate(GetMethod(implObj, "XARMCreate"), flags, 4)
        this.vtbl.ConvertTridToXID := CallbackCreate(GetMethod(implObj, "ConvertTridToXID"), flags, 4)
        this.vtbl.EnlistWithRM := CallbackCreate(GetMethod(implObj, "EnlistWithRM"), flags, 5)
        this.vtbl.ReleaseRMCookie := CallbackCreate(GetMethod(implObj, "ReleaseRMCookie"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.XARMCreate)
        CallbackFree(this.vtbl.ConvertTridToXID)
        CallbackFree(this.vtbl.EnlistWithRM)
        CallbackFree(this.vtbl.ReleaseRMCookie)
    }
}
