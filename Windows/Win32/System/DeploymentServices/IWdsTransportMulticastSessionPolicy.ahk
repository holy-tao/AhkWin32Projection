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
     * 
     * @param {Pointer<Int32>} pSlowClientHandling 
     * @returns {HRESULT} 
     */
    get_SlowClientHandling(pSlowClientHandling) {
        result := ComCall(11, this, "int*", pSlowClientHandling, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} SlowClientHandling 
     * @returns {HRESULT} 
     */
    put_SlowClientHandling(SlowClientHandling) {
        result := ComCall(12, this, "int", SlowClientHandling, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pulThreshold 
     * @returns {HRESULT} 
     */
    get_AutoDisconnectThreshold(pulThreshold) {
        result := ComCall(13, this, "uint*", pulThreshold, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulThreshold 
     * @returns {HRESULT} 
     */
    put_AutoDisconnectThreshold(ulThreshold) {
        result := ComCall(14, this, "uint", ulThreshold, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pulStreamCount 
     * @returns {HRESULT} 
     */
    get_MultistreamStreamCount(pulStreamCount) {
        result := ComCall(15, this, "uint*", pulStreamCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulStreamCount 
     * @returns {HRESULT} 
     */
    put_MultistreamStreamCount(ulStreamCount) {
        result := ComCall(16, this, "uint", ulStreamCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbClientFallback 
     * @returns {HRESULT} 
     */
    get_SlowClientFallback(pbClientFallback) {
        result := ComCall(17, this, "ptr", pbClientFallback, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bClientFallback 
     * @returns {HRESULT} 
     */
    put_SlowClientFallback(bClientFallback) {
        result := ComCall(18, this, "short", bClientFallback, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
