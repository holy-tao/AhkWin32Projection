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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_BufferingTime", "put_BufferingTime", "get_UseFixedUDPPort", "put_UseFixedUDPPort", "get_FixedUDPPort", "put_FixedUDPPort", "get_UseHTTPProxy", "put_UseHTTPProxy", "get_EnableAutoProxy", "put_EnableAutoProxy", "get_HTTPProxyHost", "put_HTTPProxyHost", "get_HTTPProxyPort", "put_HTTPProxyPort", "get_EnableMulticast", "put_EnableMulticast", "get_EnableUDP", "put_EnableUDP", "get_EnableTCP", "put_EnableTCP", "get_EnableHTTP", "put_EnableHTTP"]

    /**
     * 
     * @param {Pointer<Float>} pBufferingTime 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iamnetshowconfig-get_bufferingtime
     */
    get_BufferingTime(pBufferingTime) {
        result := ComCall(7, this, "double*", pBufferingTime, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} BufferingTime 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iamnetshowconfig-put_bufferingtime
     */
    put_BufferingTime(BufferingTime) {
        result := ComCall(8, this, "double", BufferingTime, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pUseFixedUDPPort 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iamnetshowconfig-get_usefixedudpport
     */
    get_UseFixedUDPPort(pUseFixedUDPPort) {
        result := ComCall(9, this, "ptr", pUseFixedUDPPort, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} UseFixedUDPPort 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iamnetshowconfig-put_usefixedudpport
     */
    put_UseFixedUDPPort(UseFixedUDPPort) {
        result := ComCall(10, this, "short", UseFixedUDPPort, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pFixedUDPPort 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iamnetshowconfig-get_fixedudpport
     */
    get_FixedUDPPort(pFixedUDPPort) {
        result := ComCall(11, this, "int*", pFixedUDPPort, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} FixedUDPPort 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iamnetshowconfig-put_fixedudpport
     */
    put_FixedUDPPort(FixedUDPPort) {
        result := ComCall(12, this, "int", FixedUDPPort, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pUseHTTPProxy 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iamnetshowconfig-get_usehttpproxy
     */
    get_UseHTTPProxy(pUseHTTPProxy) {
        result := ComCall(13, this, "ptr", pUseHTTPProxy, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} UseHTTPProxy 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iamnetshowconfig-put_usehttpproxy
     */
    put_UseHTTPProxy(UseHTTPProxy) {
        result := ComCall(14, this, "short", UseHTTPProxy, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pEnableAutoProxy 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iamnetshowconfig-get_enableautoproxy
     */
    get_EnableAutoProxy(pEnableAutoProxy) {
        result := ComCall(15, this, "ptr", pEnableAutoProxy, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} EnableAutoProxy 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iamnetshowconfig-put_enableautoproxy
     */
    put_EnableAutoProxy(EnableAutoProxy) {
        result := ComCall(16, this, "short", EnableAutoProxy, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrHTTPProxyHost 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iamnetshowconfig-get_httpproxyhost
     */
    get_HTTPProxyHost(pbstrHTTPProxyHost) {
        result := ComCall(17, this, "ptr", pbstrHTTPProxyHost, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrHTTPProxyHost 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iamnetshowconfig-put_httpproxyhost
     */
    put_HTTPProxyHost(bstrHTTPProxyHost) {
        bstrHTTPProxyHost := bstrHTTPProxyHost is String ? BSTR.Alloc(bstrHTTPProxyHost).Value : bstrHTTPProxyHost

        result := ComCall(18, this, "ptr", bstrHTTPProxyHost, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pHTTPProxyPort 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iamnetshowconfig-get_httpproxyport
     */
    get_HTTPProxyPort(pHTTPProxyPort) {
        result := ComCall(19, this, "int*", pHTTPProxyPort, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} HTTPProxyPort 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iamnetshowconfig-put_httpproxyport
     */
    put_HTTPProxyPort(HTTPProxyPort) {
        result := ComCall(20, this, "int", HTTPProxyPort, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pEnableMulticast 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iamnetshowconfig-get_enablemulticast
     */
    get_EnableMulticast(pEnableMulticast) {
        result := ComCall(21, this, "ptr", pEnableMulticast, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} EnableMulticast 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iamnetshowconfig-put_enablemulticast
     */
    put_EnableMulticast(EnableMulticast) {
        result := ComCall(22, this, "short", EnableMulticast, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pEnableUDP 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iamnetshowconfig-get_enableudp
     */
    get_EnableUDP(pEnableUDP) {
        result := ComCall(23, this, "ptr", pEnableUDP, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} EnableUDP 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iamnetshowconfig-put_enableudp
     */
    put_EnableUDP(EnableUDP) {
        result := ComCall(24, this, "short", EnableUDP, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pEnableTCP 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iamnetshowconfig-get_enabletcp
     */
    get_EnableTCP(pEnableTCP) {
        result := ComCall(25, this, "ptr", pEnableTCP, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} EnableTCP 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iamnetshowconfig-put_enabletcp
     */
    put_EnableTCP(EnableTCP) {
        result := ComCall(26, this, "short", EnableTCP, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pEnableHTTP 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iamnetshowconfig-get_enablehttp
     */
    get_EnableHTTP(pEnableHTTP) {
        result := ComCall(27, this, "ptr", pEnableHTTP, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} EnableHTTP 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iamnetshowconfig-put_enablehttp
     */
    put_EnableHTTP(EnableHTTP) {
        result := ComCall(28, this, "short", EnableHTTP, "HRESULT")
        return result
    }
}
