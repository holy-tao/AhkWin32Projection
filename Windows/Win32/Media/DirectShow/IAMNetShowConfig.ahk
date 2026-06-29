#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * The IAMNetShowConfig interface configures the legacy Windows Media Player 6.4 source filter. The Windows Media Source filter implements this interface.
 * @remarks
 * To define the interface identifier, include the header file Initguid.h before Qnetwork.h, but after Dshow.h and other header files:
 * 
 * <pre class="syntax" xml:space="preserve"><code>#include &lt;dshow.h&gt;
 * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nn-qnetwork-iamnetshowconfig
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IAMNetShowConfig extends IDispatch {
    /**
     * The interface identifier for IAMNetShowConfig
     * @type {Guid}
     */
    static IID := Guid("{fa2aa8f1-8b62-11d0-a520-000000000000}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAMNetShowConfig interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_BufferingTime   : IntPtr
        put_BufferingTime   : IntPtr
        get_UseFixedUDPPort : IntPtr
        put_UseFixedUDPPort : IntPtr
        get_FixedUDPPort    : IntPtr
        put_FixedUDPPort    : IntPtr
        get_UseHTTPProxy    : IntPtr
        put_UseHTTPProxy    : IntPtr
        get_EnableAutoProxy : IntPtr
        put_EnableAutoProxy : IntPtr
        get_HTTPProxyHost   : IntPtr
        put_HTTPProxyHost   : IntPtr
        get_HTTPProxyPort   : IntPtr
        put_HTTPProxyPort   : IntPtr
        get_EnableMulticast : IntPtr
        put_EnableMulticast : IntPtr
        get_EnableUDP       : IntPtr
        put_EnableUDP       : IntPtr
        get_EnableTCP       : IntPtr
        put_EnableTCP       : IntPtr
        get_EnableHTTP      : IntPtr
        put_EnableHTTP      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAMNetShowConfig.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Float} 
     */
    BufferingTime {
        get => this.get_BufferingTime()
        set => this.put_BufferingTime(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    UseFixedUDPPort {
        get => this.get_UseFixedUDPPort()
        set => this.put_UseFixedUDPPort(value)
    }

    /**
     * @type {Integer} 
     */
    FixedUDPPort {
        get => this.get_FixedUDPPort()
        set => this.put_FixedUDPPort(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    UseHTTPProxy {
        get => this.get_UseHTTPProxy()
        set => this.put_UseHTTPProxy(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    EnableAutoProxy {
        get => this.get_EnableAutoProxy()
        set => this.put_EnableAutoProxy(value)
    }

    /**
     * @type {BSTR} 
     */
    HTTPProxyHost {
        get => this.get_HTTPProxyHost()
        set => this.put_HTTPProxyHost(value)
    }

    /**
     * @type {Integer} 
     */
    HTTPProxyPort {
        get => this.get_HTTPProxyPort()
        set => this.put_HTTPProxyPort(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    EnableMulticast {
        get => this.get_EnableMulticast()
        set => this.put_EnableMulticast(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    EnableUDP {
        get => this.get_EnableUDP()
        set => this.put_EnableUDP(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    EnableTCP {
        get => this.get_EnableTCP()
        set => this.put_EnableTCP(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    EnableHTTP {
        get => this.get_EnableHTTP()
        set => this.put_EnableHTTP(value)
    }

    /**
     * The get_BufferingTime method retrieves the buffering time.
     * @param {Pointer<Float>} pBufferingTime Pointer that receives the buffering time, in seconds.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iamnetshowconfig-get_bufferingtime
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
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iamnetshowconfig-put_bufferingtime
     */
    put_BufferingTime(BufferingTime) {
        result := ComCall(8, this, "double", BufferingTime, "HRESULT")
        return result
    }

    /**
     * The get_UseFixedUDPPort method queries whether the filter should use the fixed UDP port.
     * @param {Pointer<VARIANT_BOOL>} pUseFixedUDPPort Pointer to a variable that receives a Boolean value.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iamnetshowconfig-get_usefixedudpport
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
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iamnetshowconfig-put_usefixedudpport
     */
    put_UseFixedUDPPort(UseFixedUDPPort) {
        result := ComCall(10, this, VARIANT_BOOL, UseFixedUDPPort, "HRESULT")
        return result
    }

    /**
     * The get_FixedUDPPort method gets the fixed UDP port number.
     * @param {Pointer<Integer>} pFixedUDPPort Pointer to a variable that receives the fixed UDP port number.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iamnetshowconfig-get_fixedudpport
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
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iamnetshowconfig-put_fixedudpport
     */
    put_FixedUDPPort(FixedUDPPort) {
        result := ComCall(12, this, "int", FixedUDPPort, "HRESULT")
        return result
    }

    /**
     * The get_UseHTTPProxy method queries whether the filter should use the HTTP proxy server.
     * @param {Pointer<VARIANT_BOOL>} pUseHTTPProxy Pointer to a variable that receives a Boolean value.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iamnetshowconfig-get_usehttpproxy
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
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iamnetshowconfig-put_usehttpproxy
     */
    put_UseHTTPProxy(UseHTTPProxy) {
        result := ComCall(14, this, VARIANT_BOOL, UseHTTPProxy, "HRESULT")
        return result
    }

    /**
     * The get_EnableAutoProxy method queries whether the control or filter should use the browser's proxy settings.
     * @remarks
     * This flag is <b>TRUE</b> by default.
     * @param {Pointer<VARIANT_BOOL>} pEnableAutoProxy Pointer to a variable that receives a Boolean value.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iamnetshowconfig-get_enableautoproxy
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
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iamnetshowconfig-put_enableautoproxy
     */
    put_EnableAutoProxy(EnableAutoProxy) {
        result := ComCall(16, this, VARIANT_BOOL, EnableAutoProxy, "HRESULT")
        return result
    }

    /**
     * The get_HTTPProxyHost method retrieves the HTTP address of the proxy host.
     * @remarks
     * The caller must release the returned <b>BSTR</b>, by calling <b>SysFreeString</b>.
     * @param {Pointer<BSTR>} pbstrHTTPProxyHost Pointer to a variable that receives the HTTP address.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iamnetshowconfig-get_httpproxyhost
     */
    get_HTTPProxyHost(pbstrHTTPProxyHost) {
        result := ComCall(17, this, BSTR.Ptr, pbstrHTTPProxyHost, "HRESULT")
        return result
    }

    /**
     * The put_HTTPProxyHost method specifies the address of the HTTP proxy server.
     * @param {BSTR} bstrHTTPProxyHost Specifies the proxy's address.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iamnetshowconfig-put_httpproxyhost
     */
    put_HTTPProxyHost(bstrHTTPProxyHost) {
        bstrHTTPProxyHost := bstrHTTPProxyHost is String ? BSTR.Alloc(bstrHTTPProxyHost).Value : bstrHTTPProxyHost

        result := ComCall(18, this, BSTR, bstrHTTPProxyHost, "HRESULT")
        return result
    }

    /**
     * The get_HTTPProxyPort method retrieves the HTTP proxy port.
     * @param {Pointer<Integer>} pHTTPProxyPort Pointer to a variable that receives the port number.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iamnetshowconfig-get_httpproxyport
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
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iamnetshowconfig-put_httpproxyport
     */
    put_HTTPProxyPort(HTTPProxyPort) {
        result := ComCall(20, this, "int", HTTPProxyPort, "HRESULT")
        return result
    }

    /**
     * The get_EnableMulticast method queries whether multicast-type streaming is enabled.
     * @param {Pointer<VARIANT_BOOL>} pEnableMulticast Pointer to a variable that receives a Boolean value.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iamnetshowconfig-get_enablemulticast
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
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iamnetshowconfig-put_enablemulticast
     */
    put_EnableMulticast(EnableMulticast) {
        result := ComCall(22, this, VARIANT_BOOL, EnableMulticast, "HRESULT")
        return result
    }

    /**
     * The get_EnableUDP method queries whether UDP-based streaming is enabled.
     * @param {Pointer<VARIANT_BOOL>} pEnableUDP Pointer to a variable that receives a Boolean value.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iamnetshowconfig-get_enableudp
     */
    get_EnableUDP(pEnableUDP) {
        pEnableUDPMarshal := pEnableUDP is VarRef ? "short*" : "ptr"

        result := ComCall(23, this, pEnableUDPMarshal, pEnableUDP, "HRESULT")
        return result
    }

    /**
     * The put_EnableUDP method enables or disables UDP-based streaming.
     * @param {VARIANT_BOOL} EnableUDP 
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iamnetshowconfig-put_enableudp
     */
    put_EnableUDP(EnableUDP) {
        result := ComCall(24, this, VARIANT_BOOL, EnableUDP, "HRESULT")
        return result
    }

    /**
     * The get_EnableTCP method queries whether TCP-based streaming is enabled.
     * @param {Pointer<VARIANT_BOOL>} pEnableTCP Pointer to a variable that receives a Boolean value.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iamnetshowconfig-get_enabletcp
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
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iamnetshowconfig-put_enabletcp
     */
    put_EnableTCP(EnableTCP) {
        result := ComCall(26, this, VARIANT_BOOL, EnableTCP, "HRESULT")
        return result
    }

    /**
     * The get_EnableHTTP method queries whether HTTP-type streaming is enabled.
     * @param {Pointer<VARIANT_BOOL>} pEnableHTTP Pointer to a variable that receives a Boolean value.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iamnetshowconfig-get_enablehttp
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
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iamnetshowconfig-put_enablehttp
     */
    put_EnableHTTP(EnableHTTP) {
        result := ComCall(28, this, VARIANT_BOOL, EnableHTTP, "HRESULT")
        return result
    }

    Query(iid) {
        if (IAMNetShowConfig.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_BufferingTime := CallbackCreate(GetMethod(implObj, "get_BufferingTime"), flags, 2)
        this.vtbl.put_BufferingTime := CallbackCreate(GetMethod(implObj, "put_BufferingTime"), flags, 2)
        this.vtbl.get_UseFixedUDPPort := CallbackCreate(GetMethod(implObj, "get_UseFixedUDPPort"), flags, 2)
        this.vtbl.put_UseFixedUDPPort := CallbackCreate(GetMethod(implObj, "put_UseFixedUDPPort"), flags, 2)
        this.vtbl.get_FixedUDPPort := CallbackCreate(GetMethod(implObj, "get_FixedUDPPort"), flags, 2)
        this.vtbl.put_FixedUDPPort := CallbackCreate(GetMethod(implObj, "put_FixedUDPPort"), flags, 2)
        this.vtbl.get_UseHTTPProxy := CallbackCreate(GetMethod(implObj, "get_UseHTTPProxy"), flags, 2)
        this.vtbl.put_UseHTTPProxy := CallbackCreate(GetMethod(implObj, "put_UseHTTPProxy"), flags, 2)
        this.vtbl.get_EnableAutoProxy := CallbackCreate(GetMethod(implObj, "get_EnableAutoProxy"), flags, 2)
        this.vtbl.put_EnableAutoProxy := CallbackCreate(GetMethod(implObj, "put_EnableAutoProxy"), flags, 2)
        this.vtbl.get_HTTPProxyHost := CallbackCreate(GetMethod(implObj, "get_HTTPProxyHost"), flags, 2)
        this.vtbl.put_HTTPProxyHost := CallbackCreate(GetMethod(implObj, "put_HTTPProxyHost"), flags, 2)
        this.vtbl.get_HTTPProxyPort := CallbackCreate(GetMethod(implObj, "get_HTTPProxyPort"), flags, 2)
        this.vtbl.put_HTTPProxyPort := CallbackCreate(GetMethod(implObj, "put_HTTPProxyPort"), flags, 2)
        this.vtbl.get_EnableMulticast := CallbackCreate(GetMethod(implObj, "get_EnableMulticast"), flags, 2)
        this.vtbl.put_EnableMulticast := CallbackCreate(GetMethod(implObj, "put_EnableMulticast"), flags, 2)
        this.vtbl.get_EnableUDP := CallbackCreate(GetMethod(implObj, "get_EnableUDP"), flags, 2)
        this.vtbl.put_EnableUDP := CallbackCreate(GetMethod(implObj, "put_EnableUDP"), flags, 2)
        this.vtbl.get_EnableTCP := CallbackCreate(GetMethod(implObj, "get_EnableTCP"), flags, 2)
        this.vtbl.put_EnableTCP := CallbackCreate(GetMethod(implObj, "put_EnableTCP"), flags, 2)
        this.vtbl.get_EnableHTTP := CallbackCreate(GetMethod(implObj, "get_EnableHTTP"), flags, 2)
        this.vtbl.put_EnableHTTP := CallbackCreate(GetMethod(implObj, "put_EnableHTTP"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_BufferingTime)
        CallbackFree(this.vtbl.put_BufferingTime)
        CallbackFree(this.vtbl.get_UseFixedUDPPort)
        CallbackFree(this.vtbl.put_UseFixedUDPPort)
        CallbackFree(this.vtbl.get_FixedUDPPort)
        CallbackFree(this.vtbl.put_FixedUDPPort)
        CallbackFree(this.vtbl.get_UseHTTPProxy)
        CallbackFree(this.vtbl.put_UseHTTPProxy)
        CallbackFree(this.vtbl.get_EnableAutoProxy)
        CallbackFree(this.vtbl.put_EnableAutoProxy)
        CallbackFree(this.vtbl.get_HTTPProxyHost)
        CallbackFree(this.vtbl.put_HTTPProxyHost)
        CallbackFree(this.vtbl.get_HTTPProxyPort)
        CallbackFree(this.vtbl.put_HTTPProxyPort)
        CallbackFree(this.vtbl.get_EnableMulticast)
        CallbackFree(this.vtbl.put_EnableMulticast)
        CallbackFree(this.vtbl.get_EnableUDP)
        CallbackFree(this.vtbl.put_EnableUDP)
        CallbackFree(this.vtbl.get_EnableTCP)
        CallbackFree(this.vtbl.put_EnableTCP)
        CallbackFree(this.vtbl.get_EnableHTTP)
        CallbackFree(this.vtbl.put_EnableHTTP)
    }
}
