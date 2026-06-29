#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDtcNetworkAccessConfig.ahk" { IDtcNetworkAccessConfig }
#Import ".\AUTHENTICATION_LEVEL.ahk" { AUTHENTICATION_LEVEL }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 */
export default struct IDtcNetworkAccessConfig2 extends IDtcNetworkAccessConfig {
    /**
     * The interface identifier for IDtcNetworkAccessConfig2
     * @type {Guid}
     */
    static IID := Guid("{a7aa013b-eb7d-4f42-b41c-b2dec09ae034}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDtcNetworkAccessConfig2 interfaces
    */
    struct Vtbl extends IDtcNetworkAccessConfig.Vtbl {
        GetNetworkInboundAccess  : IntPtr
        GetNetworkOutboundAccess : IntPtr
        SetNetworkInboundAccess  : IntPtr
        SetNetworkOutboundAccess : IntPtr
        GetAuthenticationLevel   : IntPtr
        SetAuthenticationLevel   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDtcNetworkAccessConfig2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {BOOL} 
     */
    GetNetworkInboundAccess() {
        result := ComCall(16, this, BOOL.Ptr, &pbInbound := 0, "HRESULT")
        return pbInbound
    }

    /**
     * 
     * @returns {BOOL} 
     */
    GetNetworkOutboundAccess() {
        result := ComCall(17, this, BOOL.Ptr, &pbOutbound := 0, "HRESULT")
        return pbOutbound
    }

    /**
     * 
     * @param {BOOL} bInbound 
     * @returns {HRESULT} 
     */
    SetNetworkInboundAccess(bInbound) {
        result := ComCall(18, this, BOOL, bInbound, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} bOutbound 
     * @returns {HRESULT} 
     */
    SetNetworkOutboundAccess(bOutbound) {
        result := ComCall(19, this, BOOL, bOutbound, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {AUTHENTICATION_LEVEL} 
     */
    GetAuthenticationLevel() {
        result := ComCall(20, this, "int*", &pAuthLevel := 0, "HRESULT")
        return pAuthLevel
    }

    /**
     * 
     * @param {AUTHENTICATION_LEVEL} AuthLevel 
     * @returns {HRESULT} 
     */
    SetAuthenticationLevel(AuthLevel) {
        result := ComCall(21, this, AUTHENTICATION_LEVEL, AuthLevel, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDtcNetworkAccessConfig2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetNetworkInboundAccess := CallbackCreate(GetMethod(implObj, "GetNetworkInboundAccess"), flags, 2)
        this.vtbl.GetNetworkOutboundAccess := CallbackCreate(GetMethod(implObj, "GetNetworkOutboundAccess"), flags, 2)
        this.vtbl.SetNetworkInboundAccess := CallbackCreate(GetMethod(implObj, "SetNetworkInboundAccess"), flags, 2)
        this.vtbl.SetNetworkOutboundAccess := CallbackCreate(GetMethod(implObj, "SetNetworkOutboundAccess"), flags, 2)
        this.vtbl.GetAuthenticationLevel := CallbackCreate(GetMethod(implObj, "GetAuthenticationLevel"), flags, 2)
        this.vtbl.SetAuthenticationLevel := CallbackCreate(GetMethod(implObj, "SetAuthenticationLevel"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetNetworkInboundAccess)
        CallbackFree(this.vtbl.GetNetworkOutboundAccess)
        CallbackFree(this.vtbl.SetNetworkInboundAccess)
        CallbackFree(this.vtbl.SetNetworkOutboundAccess)
        CallbackFree(this.vtbl.GetAuthenticationLevel)
        CallbackFree(this.vtbl.SetAuthenticationLevel)
    }
}
