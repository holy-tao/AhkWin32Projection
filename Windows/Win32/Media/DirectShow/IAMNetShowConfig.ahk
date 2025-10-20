#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IAMNetShowConfig interface configures the legacy Windows Media Player 6.4 source filter. The Windows Media Source filter implements this interface.
 * @remarks
 * 
  * To define the interface identifier, include the header file Initguid.h before Qnetwork.h, but after Dshow.h and other header files:
  * 
  * <pre class="syntax" xml:space="preserve"><code>#include &lt;dshow.h&gt;
  * 
 * @see https://docs.microsoft.com/windows/win32/api//qnetwork/nn-qnetwork-iamnetshowconfig
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IAMNetShowConfig extends IDispatch{
    /**
     * The interface identifier for IAMNetShowConfig
     * @type {Guid}
     */
    static IID => Guid("{fa2aa8f1-8b62-11d0-a520-000000000000}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<Double>} pBufferingTime 
     * @returns {HRESULT} 
     */
    get_BufferingTime(pBufferingTime) {
        result := ComCall(7, this, "double*", pBufferingTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} BufferingTime 
     * @returns {HRESULT} 
     */
    put_BufferingTime(BufferingTime) {
        result := ComCall(8, this, "double", BufferingTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pUseFixedUDPPort 
     * @returns {HRESULT} 
     */
    get_UseFixedUDPPort(pUseFixedUDPPort) {
        result := ComCall(9, this, "ptr", pUseFixedUDPPort, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} UseFixedUDPPort 
     * @returns {HRESULT} 
     */
    put_UseFixedUDPPort(UseFixedUDPPort) {
        result := ComCall(10, this, "short", UseFixedUDPPort, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pFixedUDPPort 
     * @returns {HRESULT} 
     */
    get_FixedUDPPort(pFixedUDPPort) {
        result := ComCall(11, this, "int*", pFixedUDPPort, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} FixedUDPPort 
     * @returns {HRESULT} 
     */
    put_FixedUDPPort(FixedUDPPort) {
        result := ComCall(12, this, "int", FixedUDPPort, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pUseHTTPProxy 
     * @returns {HRESULT} 
     */
    get_UseHTTPProxy(pUseHTTPProxy) {
        result := ComCall(13, this, "ptr", pUseHTTPProxy, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} UseHTTPProxy 
     * @returns {HRESULT} 
     */
    put_UseHTTPProxy(UseHTTPProxy) {
        result := ComCall(14, this, "short", UseHTTPProxy, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pEnableAutoProxy 
     * @returns {HRESULT} 
     */
    get_EnableAutoProxy(pEnableAutoProxy) {
        result := ComCall(15, this, "ptr", pEnableAutoProxy, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} EnableAutoProxy 
     * @returns {HRESULT} 
     */
    put_EnableAutoProxy(EnableAutoProxy) {
        result := ComCall(16, this, "short", EnableAutoProxy, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrHTTPProxyHost 
     * @returns {HRESULT} 
     */
    get_HTTPProxyHost(pbstrHTTPProxyHost) {
        result := ComCall(17, this, "ptr", pbstrHTTPProxyHost, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrHTTPProxyHost 
     * @returns {HRESULT} 
     */
    put_HTTPProxyHost(bstrHTTPProxyHost) {
        bstrHTTPProxyHost := bstrHTTPProxyHost is String ? BSTR.Alloc(bstrHTTPProxyHost).Value : bstrHTTPProxyHost

        result := ComCall(18, this, "ptr", bstrHTTPProxyHost, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pHTTPProxyPort 
     * @returns {HRESULT} 
     */
    get_HTTPProxyPort(pHTTPProxyPort) {
        result := ComCall(19, this, "int*", pHTTPProxyPort, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} HTTPProxyPort 
     * @returns {HRESULT} 
     */
    put_HTTPProxyPort(HTTPProxyPort) {
        result := ComCall(20, this, "int", HTTPProxyPort, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pEnableMulticast 
     * @returns {HRESULT} 
     */
    get_EnableMulticast(pEnableMulticast) {
        result := ComCall(21, this, "ptr", pEnableMulticast, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} EnableMulticast 
     * @returns {HRESULT} 
     */
    put_EnableMulticast(EnableMulticast) {
        result := ComCall(22, this, "short", EnableMulticast, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pEnableUDP 
     * @returns {HRESULT} 
     */
    get_EnableUDP(pEnableUDP) {
        result := ComCall(23, this, "ptr", pEnableUDP, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} EnableUDP 
     * @returns {HRESULT} 
     */
    put_EnableUDP(EnableUDP) {
        result := ComCall(24, this, "short", EnableUDP, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pEnableTCP 
     * @returns {HRESULT} 
     */
    get_EnableTCP(pEnableTCP) {
        result := ComCall(25, this, "ptr", pEnableTCP, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} EnableTCP 
     * @returns {HRESULT} 
     */
    put_EnableTCP(EnableTCP) {
        result := ComCall(26, this, "short", EnableTCP, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pEnableHTTP 
     * @returns {HRESULT} 
     */
    get_EnableHTTP(pEnableHTTP) {
        result := ComCall(27, this, "ptr", pEnableHTTP, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} EnableHTTP 
     * @returns {HRESULT} 
     */
    put_EnableHTTP(EnableHTTP) {
        result := ComCall(28, this, "short", EnableHTTP, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
