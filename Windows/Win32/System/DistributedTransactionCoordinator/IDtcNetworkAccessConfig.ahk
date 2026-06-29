#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 */
export default struct IDtcNetworkAccessConfig extends IUnknown {
    /**
     * The interface identifier for IDtcNetworkAccessConfig
     * @type {Guid}
     */
    static IID := Guid("{9797c15d-a428-4291-87b6-0995031a678d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDtcNetworkAccessConfig interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetAnyNetworkAccess            : IntPtr
        SetAnyNetworkAccess            : IntPtr
        GetNetworkAdministrationAccess : IntPtr
        SetNetworkAdministrationAccess : IntPtr
        GetNetworkTransactionAccess    : IntPtr
        SetNetworkTransactionAccess    : IntPtr
        GetNetworkClientAccess         : IntPtr
        SetNetworkClientAccess         : IntPtr
        GetNetworkTIPAccess            : IntPtr
        SetNetworkTIPAccess            : IntPtr
        GetXAAccess                    : IntPtr
        SetXAAccess                    : IntPtr
        RestartDtcService              : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDtcNetworkAccessConfig.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {BOOL} 
     */
    GetAnyNetworkAccess() {
        result := ComCall(3, this, BOOL.Ptr, &pbAnyNetworkAccess := 0, "HRESULT")
        return pbAnyNetworkAccess
    }

    /**
     * 
     * @param {BOOL} bAnyNetworkAccess 
     * @returns {HRESULT} 
     */
    SetAnyNetworkAccess(bAnyNetworkAccess) {
        result := ComCall(4, this, BOOL, bAnyNetworkAccess, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    GetNetworkAdministrationAccess() {
        result := ComCall(5, this, BOOL.Ptr, &pbNetworkAdministrationAccess := 0, "HRESULT")
        return pbNetworkAdministrationAccess
    }

    /**
     * 
     * @param {BOOL} bNetworkAdministrationAccess 
     * @returns {HRESULT} 
     */
    SetNetworkAdministrationAccess(bNetworkAdministrationAccess) {
        result := ComCall(6, this, BOOL, bNetworkAdministrationAccess, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    GetNetworkTransactionAccess() {
        result := ComCall(7, this, BOOL.Ptr, &pbNetworkTransactionAccess := 0, "HRESULT")
        return pbNetworkTransactionAccess
    }

    /**
     * 
     * @param {BOOL} bNetworkTransactionAccess 
     * @returns {HRESULT} 
     */
    SetNetworkTransactionAccess(bNetworkTransactionAccess) {
        result := ComCall(8, this, BOOL, bNetworkTransactionAccess, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    GetNetworkClientAccess() {
        result := ComCall(9, this, BOOL.Ptr, &pbNetworkClientAccess := 0, "HRESULT")
        return pbNetworkClientAccess
    }

    /**
     * 
     * @param {BOOL} bNetworkClientAccess 
     * @returns {HRESULT} 
     */
    SetNetworkClientAccess(bNetworkClientAccess) {
        result := ComCall(10, this, BOOL, bNetworkClientAccess, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    GetNetworkTIPAccess() {
        result := ComCall(11, this, BOOL.Ptr, &pbNetworkTIPAccess := 0, "HRESULT")
        return pbNetworkTIPAccess
    }

    /**
     * 
     * @param {BOOL} bNetworkTIPAccess 
     * @returns {HRESULT} 
     */
    SetNetworkTIPAccess(bNetworkTIPAccess) {
        result := ComCall(12, this, BOOL, bNetworkTIPAccess, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    GetXAAccess() {
        result := ComCall(13, this, BOOL.Ptr, &pbXAAccess := 0, "HRESULT")
        return pbXAAccess
    }

    /**
     * 
     * @param {BOOL} bXAAccess 
     * @returns {HRESULT} 
     */
    SetXAAccess(bXAAccess) {
        result := ComCall(14, this, BOOL, bXAAccess, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    RestartDtcService() {
        result := ComCall(15, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDtcNetworkAccessConfig.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetAnyNetworkAccess := CallbackCreate(GetMethod(implObj, "GetAnyNetworkAccess"), flags, 2)
        this.vtbl.SetAnyNetworkAccess := CallbackCreate(GetMethod(implObj, "SetAnyNetworkAccess"), flags, 2)
        this.vtbl.GetNetworkAdministrationAccess := CallbackCreate(GetMethod(implObj, "GetNetworkAdministrationAccess"), flags, 2)
        this.vtbl.SetNetworkAdministrationAccess := CallbackCreate(GetMethod(implObj, "SetNetworkAdministrationAccess"), flags, 2)
        this.vtbl.GetNetworkTransactionAccess := CallbackCreate(GetMethod(implObj, "GetNetworkTransactionAccess"), flags, 2)
        this.vtbl.SetNetworkTransactionAccess := CallbackCreate(GetMethod(implObj, "SetNetworkTransactionAccess"), flags, 2)
        this.vtbl.GetNetworkClientAccess := CallbackCreate(GetMethod(implObj, "GetNetworkClientAccess"), flags, 2)
        this.vtbl.SetNetworkClientAccess := CallbackCreate(GetMethod(implObj, "SetNetworkClientAccess"), flags, 2)
        this.vtbl.GetNetworkTIPAccess := CallbackCreate(GetMethod(implObj, "GetNetworkTIPAccess"), flags, 2)
        this.vtbl.SetNetworkTIPAccess := CallbackCreate(GetMethod(implObj, "SetNetworkTIPAccess"), flags, 2)
        this.vtbl.GetXAAccess := CallbackCreate(GetMethod(implObj, "GetXAAccess"), flags, 2)
        this.vtbl.SetXAAccess := CallbackCreate(GetMethod(implObj, "SetXAAccess"), flags, 2)
        this.vtbl.RestartDtcService := CallbackCreate(GetMethod(implObj, "RestartDtcService"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetAnyNetworkAccess)
        CallbackFree(this.vtbl.SetAnyNetworkAccess)
        CallbackFree(this.vtbl.GetNetworkAdministrationAccess)
        CallbackFree(this.vtbl.SetNetworkAdministrationAccess)
        CallbackFree(this.vtbl.GetNetworkTransactionAccess)
        CallbackFree(this.vtbl.SetNetworkTransactionAccess)
        CallbackFree(this.vtbl.GetNetworkClientAccess)
        CallbackFree(this.vtbl.SetNetworkClientAccess)
        CallbackFree(this.vtbl.GetNetworkTIPAccess)
        CallbackFree(this.vtbl.SetNetworkTIPAccess)
        CallbackFree(this.vtbl.GetXAAccess)
        CallbackFree(this.vtbl.SetXAAccess)
        CallbackFree(this.vtbl.RestartDtcService)
    }
}
