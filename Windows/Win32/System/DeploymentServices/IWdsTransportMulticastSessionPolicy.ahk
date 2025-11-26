#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWdsTransportCacheable.ahk

/**
 * This interface represents the multicast session policy portion of a WDS Transport server’s configuration.
 * @see https://docs.microsoft.com/windows/win32/api//wdstptmgmt/nn-wdstptmgmt-iwdstransportmulticastsessionpolicy
 * @namespace Windows.Win32.System.DeploymentServices
 * @version v4.0.30319
 */
class IWdsTransportMulticastSessionPolicy extends IWdsTransportCacheable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWdsTransportMulticastSessionPolicy
     * @type {Guid}
     */
    static IID => Guid("{4e5753cf-68ec-4504-a951-4a003266606b}")

    /**
     * The class identifier for WdsTransportMulticastSessionPolicy
     * @type {Guid}
     */
    static CLSID => Guid("{3c6bc3f4-6418-472a-b6f1-52d457195437}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 11

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SlowClientHandling", "put_SlowClientHandling", "get_AutoDisconnectThreshold", "put_AutoDisconnectThreshold", "get_MultistreamStreamCount", "put_MultistreamStreamCount", "get_SlowClientFallback", "put_SlowClientFallback"]

    /**
     * @type {Integer} 
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
     * Sets or retrieves a WDSTRANSPORT_SLOW_CLIENT_HANDLING_TYPE value that indicates the method used by the server to handle clients that are slowing down a multicast transmission.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//wdstptmgmt/nf-wdstptmgmt-iwdstransportmulticastsessionpolicy-get_slowclienthandling
     */
    get_SlowClientHandling() {
        result := ComCall(11, this, "int*", &pSlowClientHandling := 0, "HRESULT")
        return pSlowClientHandling
    }

    /**
     * Sets or retrieves a WDSTRANSPORT_SLOW_CLIENT_HANDLING_TYPE value that indicates the method used by the server to handle clients that are slowing down a multicast transmission.
     * @param {Integer} SlowClientHandling 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//wdstptmgmt/nf-wdstptmgmt-iwdstransportmulticastsessionpolicy-put_slowclienthandling
     */
    put_SlowClientHandling(SlowClientHandling) {
        result := ComCall(12, this, "int", SlowClientHandling, "HRESULT")
        return result
    }

    /**
     * Sets or retrieves the threshold transmission rate, in kilobytes per second, used by the server.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//wdstptmgmt/nf-wdstptmgmt-iwdstransportmulticastsessionpolicy-get_autodisconnectthreshold
     */
    get_AutoDisconnectThreshold() {
        result := ComCall(13, this, "uint*", &pulThreshold := 0, "HRESULT")
        return pulThreshold
    }

    /**
     * Sets or retrieves the threshold transmission rate, in kilobytes per second, used by the server.
     * @param {Integer} ulThreshold 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//wdstptmgmt/nf-wdstptmgmt-iwdstransportmulticastsessionpolicy-put_autodisconnectthreshold
     */
    put_AutoDisconnectThreshold(ulThreshold) {
        result := ComCall(14, this, "uint", ulThreshold, "HRESULT")
        return result
    }

    /**
     * Receives the maximum number of multicast streams per transmission used by the server.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//wdstptmgmt/nf-wdstptmgmt-iwdstransportmulticastsessionpolicy-get_multistreamstreamcount
     */
    get_MultistreamStreamCount() {
        result := ComCall(15, this, "uint*", &pulStreamCount := 0, "HRESULT")
        return pulStreamCount
    }

    /**
     * Receives the maximum number of multicast streams per transmission used by the server.
     * @param {Integer} ulStreamCount 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//wdstptmgmt/nf-wdstptmgmt-iwdstransportmulticastsessionpolicy-put_multistreamstreamcount
     */
    put_MultistreamStreamCount(ulStreamCount) {
        result := ComCall(16, this, "uint", ulStreamCount, "HRESULT")
        return result
    }

    /**
     * Receives a value that indicates the fallback policy requested by the server when automatically disconnecting slow clients from a multicast transmission.
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//wdstptmgmt/nf-wdstptmgmt-iwdstransportmulticastsessionpolicy-get_slowclientfallback
     */
    get_SlowClientFallback() {
        result := ComCall(17, this, "short*", &pbClientFallback := 0, "HRESULT")
        return pbClientFallback
    }

    /**
     * Receives a value that indicates the fallback policy requested by the server when automatically disconnecting slow clients from a multicast transmission.
     * @param {VARIANT_BOOL} bClientFallback 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//wdstptmgmt/nf-wdstptmgmt-iwdstransportmulticastsessionpolicy-put_slowclientfallback
     */
    put_SlowClientFallback(bClientFallback) {
        result := ComCall(18, this, "short", bClientFallback, "HRESULT")
        return result
    }
}
