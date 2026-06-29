#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\XID.ahk" { XID }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 */
export default struct IDtcToXaMapper extends IUnknown {
    /**
     * The interface identifier for IDtcToXaMapper
     * @type {Guid}
     */
    static IID := Guid("{64ffabe0-7ce9-11d0-8ce6-00c04fdc877e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDtcToXaMapper interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        RequestNewResourceManager : IntPtr
        TranslateTridToXid        : IntPtr
        EnlistResourceManager     : IntPtr
        ReleaseResourceManager    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDtcToXaMapper.Vtbl()
        }
        super.__New(implObj, flags)
    }

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

        pdwRMCookieMarshal := pdwRMCookie is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", pszDSN, "ptr", pszClientDllName, pdwRMCookieMarshal, pdwRMCookie, "HRESULT")
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
        pdwITransactionMarshal := pdwITransaction is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, pdwITransactionMarshal, pdwITransaction, "uint", dwRMCookie, XID.Ptr, pXid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwRMCookie 
     * @param {Pointer<Integer>} pdwITransaction 
     * @returns {HRESULT} 
     */
    EnlistResourceManager(dwRMCookie, pdwITransaction) {
        pdwITransactionMarshal := pdwITransaction is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "uint", dwRMCookie, pdwITransactionMarshal, pdwITransaction, "HRESULT")
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

    Query(iid) {
        if (IDtcToXaMapper.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.RequestNewResourceManager := CallbackCreate(GetMethod(implObj, "RequestNewResourceManager"), flags, 4)
        this.vtbl.TranslateTridToXid := CallbackCreate(GetMethod(implObj, "TranslateTridToXid"), flags, 4)
        this.vtbl.EnlistResourceManager := CallbackCreate(GetMethod(implObj, "EnlistResourceManager"), flags, 3)
        this.vtbl.ReleaseResourceManager := CallbackCreate(GetMethod(implObj, "ReleaseResourceManager"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.RequestNewResourceManager)
        CallbackFree(this.vtbl.TranslateTridToXid)
        CallbackFree(this.vtbl.EnlistResourceManager)
        CallbackFree(this.vtbl.ReleaseResourceManager)
    }
}
