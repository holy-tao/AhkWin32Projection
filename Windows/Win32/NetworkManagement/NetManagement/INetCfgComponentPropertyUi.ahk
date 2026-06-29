#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct INetCfgComponentPropertyUi extends IUnknown {
    /**
     * The interface identifier for INetCfgComponentPropertyUi
     * @type {Guid}
     */
    static IID := Guid("{932238e0-bea1-11d0-9298-00c04fc99dcf}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for INetCfgComponentPropertyUi interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        QueryPropertyUi    : IntPtr
        SetContext         : IntPtr
        MergePropPages     : IntPtr
        ValidateProperties : IntPtr
        ApplyProperties    : IntPtr
        CancelProperties   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := INetCfgComponentPropertyUi.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IUnknown} pUnkReserved 
     * @returns {HRESULT} 
     */
    QueryPropertyUi(pUnkReserved) {
        result := ComCall(3, this, "ptr", pUnkReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} pUnkReserved 
     * @returns {HRESULT} 
     */
    SetContext(pUnkReserved) {
        result := ComCall(4, this, "ptr", pUnkReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwDefPages 
     * @param {Pointer<Pointer<Integer>>} pahpspPrivate 
     * @param {Pointer<Integer>} pcPages 
     * @param {HWND} hwndParent 
     * @param {Pointer<PWSTR>} pszStartPage 
     * @returns {HRESULT} 
     */
    MergePropPages(pdwDefPages, pahpspPrivate, pcPages, hwndParent, pszStartPage) {
        pdwDefPagesMarshal := pdwDefPages is VarRef ? "uint*" : "ptr"
        pahpspPrivateMarshal := pahpspPrivate is VarRef ? "ptr*" : "ptr"
        pcPagesMarshal := pcPages is VarRef ? "uint*" : "ptr"
        pszStartPageMarshal := pszStartPage is VarRef ? "ptr*" : "ptr"

        result := ComCall(5, this, pdwDefPagesMarshal, pdwDefPages, pahpspPrivateMarshal, pahpspPrivate, pcPagesMarshal, pcPages, HWND, hwndParent, pszStartPageMarshal, pszStartPage, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} hwndSheet 
     * @returns {HRESULT} 
     */
    ValidateProperties(hwndSheet) {
        result := ComCall(6, this, HWND, hwndSheet, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ApplyProperties() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    CancelProperties() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (INetCfgComponentPropertyUi.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.QueryPropertyUi := CallbackCreate(GetMethod(implObj, "QueryPropertyUi"), flags, 2)
        this.vtbl.SetContext := CallbackCreate(GetMethod(implObj, "SetContext"), flags, 2)
        this.vtbl.MergePropPages := CallbackCreate(GetMethod(implObj, "MergePropPages"), flags, 6)
        this.vtbl.ValidateProperties := CallbackCreate(GetMethod(implObj, "ValidateProperties"), flags, 2)
        this.vtbl.ApplyProperties := CallbackCreate(GetMethod(implObj, "ApplyProperties"), flags, 1)
        this.vtbl.CancelProperties := CallbackCreate(GetMethod(implObj, "CancelProperties"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.QueryPropertyUi)
        CallbackFree(this.vtbl.SetContext)
        CallbackFree(this.vtbl.MergePropPages)
        CallbackFree(this.vtbl.ValidateProperties)
        CallbackFree(this.vtbl.ApplyProperties)
        CallbackFree(this.vtbl.CancelProperties)
    }
}
