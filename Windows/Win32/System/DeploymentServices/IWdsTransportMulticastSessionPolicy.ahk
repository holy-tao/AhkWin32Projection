#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IWdsTransportCacheable.ahk" { IWdsTransportCacheable }
#Import ".\WDSTRANSPORT_SLOW_CLIENT_HANDLING_TYPE.ahk" { WDSTRANSPORT_SLOW_CLIENT_HANDLING_TYPE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * This interface represents the multicast session policy portion of a WDS Transport server’s configuration.
 * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nn-wdstptmgmt-iwdstransportmulticastsessionpolicy
 * @namespace Windows.Win32.System.DeploymentServices
 */
export default struct IWdsTransportMulticastSessionPolicy extends IWdsTransportCacheable {
    /**
     * The interface identifier for IWdsTransportMulticastSessionPolicy
     * @type {Guid}
     */
    static IID := Guid("{4e5753cf-68ec-4504-a951-4a003266606b}")

    /**
     * The class identifier for WdsTransportMulticastSessionPolicy
     * @type {Guid}
     */
    static CLSID := Guid("{3c6bc3f4-6418-472a-b6f1-52d457195437}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWdsTransportMulticastSessionPolicy interfaces
    */
    struct Vtbl extends IWdsTransportCacheable.Vtbl {
        get_SlowClientHandling      : IntPtr
        put_SlowClientHandling      : IntPtr
        get_AutoDisconnectThreshold : IntPtr
        put_AutoDisconnectThreshold : IntPtr
        get_MultistreamStreamCount  : IntPtr
        put_MultistreamStreamCount  : IntPtr
        get_SlowClientFallback      : IntPtr
        put_SlowClientFallback      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWdsTransportMulticastSessionPolicy.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {WDSTRANSPORT_SLOW_CLIENT_HANDLING_TYPE} 
     */
    SlowClientHandling {
        get => this.get_SlowClientHandling()
        set => this.put_SlowClientHandling(value)
    }

    /**
     * @type {Integer} 
     */
    AutoDisconnectThreshold {
        get => this.get_AutoDisconnectThreshold()
        set => this.put_AutoDisconnectThreshold(value)
    }

    /**
     * @type {Integer} 
     */
    MultistreamStreamCount {
        get => this.get_MultistreamStreamCount()
        set => this.put_MultistreamStreamCount(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    SlowClientFallback {
        get => this.get_SlowClientFallback()
        set => this.put_SlowClientFallback(value)
    }

    /**
     * Sets or retrieves a WDSTRANSPORT_SLOW_CLIENT_HANDLING_TYPE value that indicates the method used by the server to handle clients that are slowing down a multicast transmission. (Get)
     * @returns {WDSTRANSPORT_SLOW_CLIENT_HANDLING_TYPE} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportmulticastsessionpolicy-get_slowclienthandling
     */
    get_SlowClientHandling() {
        result := ComCall(11, this, "int*", &pSlowClientHandling := 0, "HRESULT")
        return pSlowClientHandling
    }

    /**
     * Sets or retrieves a WDSTRANSPORT_SLOW_CLIENT_HANDLING_TYPE value that indicates the method used by the server to handle clients that are slowing down a multicast transmission. (Put)
     * @param {WDSTRANSPORT_SLOW_CLIENT_HANDLING_TYPE} SlowClientHandling 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportmulticastsessionpolicy-put_slowclienthandling
     */
    put_SlowClientHandling(SlowClientHandling) {
        result := ComCall(12, this, WDSTRANSPORT_SLOW_CLIENT_HANDLING_TYPE, SlowClientHandling, "HRESULT")
        return result
    }

    /**
     * Sets or retrieves the threshold transmission rate, in kilobytes per second, used by the server. (Get)
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportmulticastsessionpolicy-get_autodisconnectthreshold
     */
    get_AutoDisconnectThreshold() {
        result := ComCall(13, this, "uint*", &pulThreshold := 0, "HRESULT")
        return pulThreshold
    }

    /**
     * Sets or retrieves the threshold transmission rate, in kilobytes per second, used by the server. (Put)
     * @param {Integer} ulThreshold 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportmulticastsessionpolicy-put_autodisconnectthreshold
     */
    put_AutoDisconnectThreshold(ulThreshold) {
        result := ComCall(14, this, "uint", ulThreshold, "HRESULT")
        return result
    }

    /**
     * Receives the maximum number of multicast streams per transmission used by the server. (Get)
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportmulticastsessionpolicy-get_multistreamstreamcount
     */
    get_MultistreamStreamCount() {
        result := ComCall(15, this, "uint*", &pulStreamCount := 0, "HRESULT")
        return pulStreamCount
    }

    /**
     * Receives the maximum number of multicast streams per transmission used by the server. (Put)
     * @param {Integer} ulStreamCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportmulticastsessionpolicy-put_multistreamstreamcount
     */
    put_MultistreamStreamCount(ulStreamCount) {
        result := ComCall(16, this, "uint", ulStreamCount, "HRESULT")
        return result
    }

    /**
     * Receives a value that indicates the fallback policy requested by the server when automatically disconnecting slow clients from a multicast transmission. (Get)
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportmulticastsessionpolicy-get_slowclientfallback
     */
    get_SlowClientFallback() {
        result := ComCall(17, this, VARIANT_BOOL.Ptr, &pbClientFallback := 0, "HRESULT")
        return pbClientFallback
    }

    /**
     * Receives a value that indicates the fallback policy requested by the server when automatically disconnecting slow clients from a multicast transmission. (Put)
     * @param {VARIANT_BOOL} bClientFallback 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportmulticastsessionpolicy-put_slowclientfallback
     */
    put_SlowClientFallback(bClientFallback) {
        result := ComCall(18, this, VARIANT_BOOL, bClientFallback, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWdsTransportMulticastSessionPolicy.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_SlowClientHandling := CallbackCreate(GetMethod(implObj, "get_SlowClientHandling"), flags, 2)
        this.vtbl.put_SlowClientHandling := CallbackCreate(GetMethod(implObj, "put_SlowClientHandling"), flags, 2)
        this.vtbl.get_AutoDisconnectThreshold := CallbackCreate(GetMethod(implObj, "get_AutoDisconnectThreshold"), flags, 2)
        this.vtbl.put_AutoDisconnectThreshold := CallbackCreate(GetMethod(implObj, "put_AutoDisconnectThreshold"), flags, 2)
        this.vtbl.get_MultistreamStreamCount := CallbackCreate(GetMethod(implObj, "get_MultistreamStreamCount"), flags, 2)
        this.vtbl.put_MultistreamStreamCount := CallbackCreate(GetMethod(implObj, "put_MultistreamStreamCount"), flags, 2)
        this.vtbl.get_SlowClientFallback := CallbackCreate(GetMethod(implObj, "get_SlowClientFallback"), flags, 2)
        this.vtbl.put_SlowClientFallback := CallbackCreate(GetMethod(implObj, "put_SlowClientFallback"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_SlowClientHandling)
        CallbackFree(this.vtbl.put_SlowClientHandling)
        CallbackFree(this.vtbl.get_AutoDisconnectThreshold)
        CallbackFree(this.vtbl.put_AutoDisconnectThreshold)
        CallbackFree(this.vtbl.get_MultistreamStreamCount)
        CallbackFree(this.vtbl.put_MultistreamStreamCount)
        CallbackFree(this.vtbl.get_SlowClientFallback)
        CallbackFree(this.vtbl.put_SlowClientFallback)
    }
}
