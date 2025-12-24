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
     */
    BufferingTime {
        get => this.get_BufferingTime()
        set => this.put_BufferingTime(value)
    }

    /**
     */
    UseFixedUDPPort {
        get => this.get_UseFixedUDPPort()
        set => this.put_UseFixedUDPPort(value)
    }

    /**
     */
    FixedUDPPort {
        get => this.get_FixedUDPPort()
        set => this.put_FixedUDPPort(value)
    }

    /**
     */
    UseHTTPProxy {
        get => this.get_UseHTTPProxy()
        set => this.put_UseHTTPProxy(value)
    }

    /**
     */
    EnableAutoProxy {
        get => this.get_EnableAutoProxy()
        set => this.put_EnableAutoProxy(value)
    }

    /**
     */
    HTTPProxyHost {
        get => this.get_HTTPProxyHost()
        set => this.put_HTTPProxyHost(value)
    }

    /**
     */
    HTTPProxyPort {
        get => this.get_HTTPProxyPort()
        set => this.put_HTTPProxyPort(value)
    }

    /**
     */
    EnableMulticast {
        get => this.get_EnableMulticast()
        set => this.put_EnableMulticast(value)
    }

    /**
     */
    EnableUDP {
        get => this.get_EnableUDP()
        set => this.put_EnableUDP(value)
    }

    /**
     */
    EnableTCP {
        get => this.get_EnableTCP()
        set => this.put_EnableTCP(value)
    }

    /**
     */
    EnableHTTP {
        get => this.get_EnableHTTP()
        set => this.put_EnableHTTP(value)
    }

    /**
     * The get_BufferingTime method retrieves the buffering time.
     * @param {Pointer<Float>} pBufferingTime Pointer that receives the buffering time, in seconds.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//qnetwork/nf-qnetwork-iamnetshowconfig-get_bufferingtime
     */
    get_BufferingTime(pBufferingTime) {
        pBufferingTimeMarshal := pBufferingTime is VarRef ? "double*" : "ptr"

        result := ComCall(7, this, pBufferingTimeMarshal, pBufferingTime, "HRESULT")
        return result
    }

    /**
     * The put_BufferingTime method specifies the buffering time.
     * @param {Float} BufferingTime Specifies the buffering time, in seconds.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//qnetwork/nf-qnetwork-iamnetshowconfig-put_bufferingtime
     */
    put_BufferingTime(BufferingTime) {
        result := ComCall(8, this, "double", BufferingTime, "HRESULT")
        return result
    }

    /**
     * The get_UseFixedUDPPort method queries whether the filter should use the fixed UDP port.
     * @param {Pointer<VARIANT_BOOL>} pUseFixedUDPPort Pointer to a variable that receives a Boolean value.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//qnetwork/nf-qnetwork-iamnetshowconfig-get_usefixedudpport
     */
    get_UseFixedUDPPort(pUseFixedUDPPort) {
        pUseFixedUDPPortMarshal := pUseFixedUDPPort is VarRef ? "short*" : "ptr"

        result := ComCall(9, this, pUseFixedUDPPortMarshal, pUseFixedUDPPort, "HRESULT")
        return result
    }

    /**
     * The put_UseFixedUDPPort method specifies whether to use a fixed UDP port number.
     * @param {VARIANT_BOOL} UseFixedUDPPort 
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//qnetwork/nf-qnetwork-iamnetshowconfig-put_usefixedudpport
     */
    put_UseFixedUDPPort(UseFixedUDPPort) {
        result := ComCall(10, this, "short", UseFixedUDPPort, "HRESULT")
        return result
    }

    /**
     * The get_FixedUDPPort method gets the fixed UDP port number.
     * @param {Pointer<Integer>} pFixedUDPPort Pointer to a variable that receives the fixed UDP port number.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//qnetwork/nf-qnetwork-iamnetshowconfig-get_fixedudpport
     */
    get_FixedUDPPort(pFixedUDPPort) {
        pFixedUDPPortMarshal := pFixedUDPPort is VarRef ? "int*" : "ptr"

        result := ComCall(11, this, pFixedUDPPortMarshal, pFixedUDPPort, "HRESULT")
        return result
    }

    /**
     * The put_FixedUDPPort method specifies the fixed UDP port.
     * @param {Integer} FixedUDPPort Specifies the fixed UDP port number.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//qnetwork/nf-qnetwork-iamnetshowconfig-put_fixedudpport
     */
    put_FixedUDPPort(FixedUDPPort) {
        result := ComCall(12, this, "int", FixedUDPPort, "HRESULT")
        return result
    }

    /**
     * The get_UseHTTPProxy method queries whether the filter should use the HTTP proxy server.
     * @param {Pointer<VARIANT_BOOL>} pUseHTTPProxy Pointer to a variable that receives a Boolean value.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//qnetwork/nf-qnetwork-iamnetshowconfig-get_usehttpproxy
     */
    get_UseHTTPProxy(pUseHTTPProxy) {
        pUseHTTPProxyMarshal := pUseHTTPProxy is VarRef ? "short*" : "ptr"

        result := ComCall(13, this, pUseHTTPProxyMarshal, pUseHTTPProxy, "HRESULT")
        return result
    }

    /**
     * The put_UseHTTPProxy method specifies whether to use an HTTP proxy server.
     * @param {VARIANT_BOOL} UseHTTPProxy 
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//qnetwork/nf-qnetwork-iamnetshowconfig-put_usehttpproxy
     */
    put_UseHTTPProxy(UseHTTPProxy) {
        result := ComCall(14, this, "short", UseHTTPProxy, "HRESULT")
        return result
    }

    /**
     * The get_EnableAutoProxy method queries whether the control or filter should use the browser's proxy settings.
     * @param {Pointer<VARIANT_BOOL>} pEnableAutoProxy Pointer to a variable that receives a Boolean value.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//qnetwork/nf-qnetwork-iamnetshowconfig-get_enableautoproxy
     */
    get_EnableAutoProxy(pEnableAutoProxy) {
        pEnableAutoProxyMarshal := pEnableAutoProxy is VarRef ? "short*" : "ptr"

        result := ComCall(15, this, pEnableAutoProxyMarshal, pEnableAutoProxy, "HRESULT")
        return result
    }

    /**
     * The put_EnableAutoProxy method enables or disables auto-proxy.
     * @param {VARIANT_BOOL} EnableAutoProxy 
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//qnetwork/nf-qnetwork-iamnetshowconfig-put_enableautoproxy
     */
    put_EnableAutoProxy(EnableAutoProxy) {
        result := ComCall(16, this, "short", EnableAutoProxy, "HRESULT")
        return result
    }

    /**
     * The get_HTTPProxyHost method retrieves the HTTP address of the proxy host.
     * @param {Pointer<BSTR>} pbstrHTTPProxyHost Pointer to a variable that receives the HTTP address.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//qnetwork/nf-qnetwork-iamnetshowconfig-get_httpproxyhost
     */
    get_HTTPProxyHost(pbstrHTTPProxyHost) {
        result := ComCall(17, this, "ptr", pbstrHTTPProxyHost, "HRESULT")
        return result
    }

    /**
     * The put_HTTPProxyHost method specifies the address of the HTTP proxy server.
     * @param {BSTR} bstrHTTPProxyHost Specifies the proxy's address.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//qnetwork/nf-qnetwork-iamnetshowconfig-put_httpproxyhost
     */
    put_HTTPProxyHost(bstrHTTPProxyHost) {
        bstrHTTPProxyHost := bstrHTTPProxyHost is String ? BSTR.Alloc(bstrHTTPProxyHost).Value : bstrHTTPProxyHost

        result := ComCall(18, this, "ptr", bstrHTTPProxyHost, "HRESULT")
        return result
    }

    /**
     * The get_HTTPProxyPort method retrieves the HTTP proxy port.
     * @param {Pointer<Integer>} pHTTPProxyPort Pointer to a variable that receives the port number.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//qnetwork/nf-qnetwork-iamnetshowconfig-get_httpproxyport
     */
    get_HTTPProxyPort(pHTTPProxyPort) {
        pHTTPProxyPortMarshal := pHTTPProxyPort is VarRef ? "int*" : "ptr"

        result := ComCall(19, this, pHTTPProxyPortMarshal, pHTTPProxyPort, "HRESULT")
        return result
    }

    /**
     * The put_HTTPProxyPort method specifies the port for the HTTP proxy server.
     * @param {Integer} HTTPProxyPort Specifies the HTTP proxy port.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//qnetwork/nf-qnetwork-iamnetshowconfig-put_httpproxyport
     */
    put_HTTPProxyPort(HTTPProxyPort) {
        result := ComCall(20, this, "int", HTTPProxyPort, "HRESULT")
        return result
    }

    /**
     * The get_EnableMulticast method queries whether multicast-type streaming is enabled.
     * @param {Pointer<VARIANT_BOOL>} pEnableMulticast Pointer to a variable that receives a Boolean value.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//qnetwork/nf-qnetwork-iamnetshowconfig-get_enablemulticast
     */
    get_EnableMulticast(pEnableMulticast) {
        pEnableMulticastMarshal := pEnableMulticast is VarRef ? "short*" : "ptr"

        result := ComCall(21, this, pEnableMulticastMarshal, pEnableMulticast, "HRESULT")
        return result
    }

    /**
     * The put_EnableMulticast method enables or disables multicast-based streaming.
     * @param {VARIANT_BOOL} EnableMulticast 
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//qnetwork/nf-qnetwork-iamnetshowconfig-put_enablemulticast
     */
    put_EnableMulticast(EnableMulticast) {
        result := ComCall(22, this, "short", EnableMulticast, "HRESULT")
        return result
    }

    /**
     * The get_EnableUDP method queries whether UDP-based streaming is enabled.
     * @param {Pointer<VARIANT_BOOL>} pEnableUDP Pointer to a variable that receives a Boolean value.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//qnetwork/nf-qnetwork-iamnetshowconfig-get_enableudp
     */
    get_EnableUDP(pEnableUDP) {
        pEnableUDPMarshal := pEnableUDP is VarRef ? "short*" : "ptr"

        result := ComCall(23, this, pEnableUDPMarshal, pEnableUDP, "HRESULT")
        return result
    }

    /**
     * The put_EnableUDP method enables or disablles UDP-based streaming.
     * @param {VARIANT_BOOL} EnableUDP 
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//qnetwork/nf-qnetwork-iamnetshowconfig-put_enableudp
     */
    put_EnableUDP(EnableUDP) {
        result := ComCall(24, this, "short", EnableUDP, "HRESULT")
        return result
    }

    /**
     * The get_EnableTCP method queries whether TCP-based streaming is enabled.
     * @param {Pointer<VARIANT_BOOL>} pEnableTCP Pointer to a variable that receives a Boolean value.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//qnetwork/nf-qnetwork-iamnetshowconfig-get_enabletcp
     */
    get_EnableTCP(pEnableTCP) {
        pEnableTCPMarshal := pEnableTCP is VarRef ? "short*" : "ptr"

        result := ComCall(25, this, pEnableTCPMarshal, pEnableTCP, "HRESULT")
        return result
    }

    /**
     * The put_EnableTCP method enables or disables TCP-based streaming.
     * @param {VARIANT_BOOL} EnableTCP 
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//qnetwork/nf-qnetwork-iamnetshowconfig-put_enabletcp
     */
    put_EnableTCP(EnableTCP) {
        result := ComCall(26, this, "short", EnableTCP, "HRESULT")
        return result
    }

    /**
     * The get_EnableHTTP method queries whether HTTP-type streaming is enabled.
     * @param {Pointer<VARIANT_BOOL>} pEnableHTTP Pointer to a variable that receives a Boolean value.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//qnetwork/nf-qnetwork-iamnetshowconfig-get_enablehttp
     */
    get_EnableHTTP(pEnableHTTP) {
        pEnableHTTPMarshal := pEnableHTTP is VarRef ? "short*" : "ptr"

        result := ComCall(27, this, pEnableHTTPMarshal, pEnableHTTP, "HRESULT")
        return result
    }

    /**
     * The put_EnableHTTP method enables or disables HTTP-based streaming.
     * @param {VARIANT_BOOL} EnableHTTP 
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//qnetwork/nf-qnetwork-iamnetshowconfig-put_enablehttp
     */
    put_EnableHTTP(EnableHTTP) {
        result := ComCall(28, this, "short", EnableHTTP, "HRESULT")
        return result
    }
}
