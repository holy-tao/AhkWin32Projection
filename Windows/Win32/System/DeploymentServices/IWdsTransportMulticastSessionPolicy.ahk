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
     * 
     * @param {Pointer<Integer>} pSlowClientHandling 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportmulticastsessionpolicy-get_slowclienthandling
     */
    get_SlowClientHandling(pSlowClientHandling) {
        pSlowClientHandlingMarshal := pSlowClientHandling is VarRef ? "int*" : "ptr"

        result := ComCall(11, this, pSlowClientHandlingMarshal, pSlowClientHandling, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} SlowClientHandling 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportmulticastsessionpolicy-put_slowclienthandling
     */
    put_SlowClientHandling(SlowClientHandling) {
        result := ComCall(12, this, "int", SlowClientHandling, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pulThreshold 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportmulticastsessionpolicy-get_autodisconnectthreshold
     */
    get_AutoDisconnectThreshold(pulThreshold) {
        pulThresholdMarshal := pulThreshold is VarRef ? "uint*" : "ptr"

        result := ComCall(13, this, pulThresholdMarshal, pulThreshold, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulThreshold 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportmulticastsessionpolicy-put_autodisconnectthreshold
     */
    put_AutoDisconnectThreshold(ulThreshold) {
        result := ComCall(14, this, "uint", ulThreshold, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pulStreamCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportmulticastsessionpolicy-get_multistreamstreamcount
     */
    get_MultistreamStreamCount(pulStreamCount) {
        pulStreamCountMarshal := pulStreamCount is VarRef ? "uint*" : "ptr"

        result := ComCall(15, this, pulStreamCountMarshal, pulStreamCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulStreamCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportmulticastsessionpolicy-put_multistreamstreamcount
     */
    put_MultistreamStreamCount(ulStreamCount) {
        result := ComCall(16, this, "uint", ulStreamCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbClientFallback 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportmulticastsessionpolicy-get_slowclientfallback
     */
    get_SlowClientFallback(pbClientFallback) {
        result := ComCall(17, this, "ptr", pbClientFallback, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bClientFallback 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportmulticastsessionpolicy-put_slowclientfallback
     */
    put_SlowClientFallback(bClientFallback) {
        result := ComCall(18, this, "short", bClientFallback, "HRESULT")
        return result
    }
}
