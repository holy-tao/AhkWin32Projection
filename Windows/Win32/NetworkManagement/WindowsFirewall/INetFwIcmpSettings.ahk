#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * The INetFwIcmpSettings interface provides access to the settings controlling ICMP packets.
 * @remarks
 * Instances of this interface
 * are retrieved through the <a href="https://docs.microsoft.com/windows/desktop/api/netfw/nf-netfw-inetfwprofile-get_icmpsettings">IcmpSettings</a> property of the INetFwProfile interface.
 * 
 * Because the methods and properties of this interface enable all rules belonging to a given ICMP type, enabling a rule may enable rules from other groups as well.
 * 
 * All configuration changes take
 * effect immediately.
 * @see https://learn.microsoft.com/windows/win32/api/netfw/nn-netfw-inetfwicmpsettings
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 */
export default struct INetFwIcmpSettings extends IDispatch {
    /**
     * The interface identifier for INetFwIcmpSettings
     * @type {Guid}
     */
    static IID := Guid("{a6207b2e-7cdd-426a-951e-5e1cbc5afead}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for INetFwIcmpSettings interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_AllowOutboundDestinationUnreachable : IntPtr
        put_AllowOutboundDestinationUnreachable : IntPtr
        get_AllowRedirect                       : IntPtr
        put_AllowRedirect                       : IntPtr
        get_AllowInboundEchoRequest             : IntPtr
        put_AllowInboundEchoRequest             : IntPtr
        get_AllowOutboundTimeExceeded           : IntPtr
        put_AllowOutboundTimeExceeded           : IntPtr
        get_AllowOutboundParameterProblem       : IntPtr
        put_AllowOutboundParameterProblem       : IntPtr
        get_AllowOutboundSourceQuench           : IntPtr
        put_AllowOutboundSourceQuench           : IntPtr
        get_AllowInboundRouterRequest           : IntPtr
        put_AllowInboundRouterRequest           : IntPtr
        get_AllowInboundTimestampRequest        : IntPtr
        put_AllowInboundTimestampRequest        : IntPtr
        get_AllowInboundMaskRequest             : IntPtr
        put_AllowInboundMaskRequest             : IntPtr
        get_AllowOutboundPacketTooBig           : IntPtr
        put_AllowOutboundPacketTooBig           : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := INetFwIcmpSettings.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    AllowOutboundDestinationUnreachable {
        get => this.get_AllowOutboundDestinationUnreachable()
        set => this.put_AllowOutboundDestinationUnreachable(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    AllowRedirect {
        get => this.get_AllowRedirect()
        set => this.put_AllowRedirect(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    AllowInboundEchoRequest {
        get => this.get_AllowInboundEchoRequest()
        set => this.put_AllowInboundEchoRequest(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    AllowOutboundTimeExceeded {
        get => this.get_AllowOutboundTimeExceeded()
        set => this.put_AllowOutboundTimeExceeded(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    AllowOutboundParameterProblem {
        get => this.get_AllowOutboundParameterProblem()
        set => this.put_AllowOutboundParameterProblem(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    AllowOutboundSourceQuench {
        get => this.get_AllowOutboundSourceQuench()
        set => this.put_AllowOutboundSourceQuench(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    AllowInboundRouterRequest {
        get => this.get_AllowInboundRouterRequest()
        set => this.put_AllowInboundRouterRequest(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    AllowInboundTimestampRequest {
        get => this.get_AllowInboundTimestampRequest()
        set => this.put_AllowInboundTimestampRequest(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    AllowInboundMaskRequest {
        get => this.get_AllowInboundMaskRequest()
        set => this.put_AllowInboundMaskRequest(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    AllowOutboundPacketTooBig {
        get => this.get_AllowOutboundPacketTooBig()
        set => this.put_AllowOutboundPacketTooBig(value)
    }

    /**
     * Indicates whether this is allowed. (INetFwIcmpSettings.get_AllowOutboundDestinationUnreachable)
     * @remarks
     * This setting is common to IPv4 and IPv6.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwicmpsettings-get_allowoutbounddestinationunreachable
     */
    get_AllowOutboundDestinationUnreachable() {
        result := ComCall(7, this, VARIANT_BOOL.Ptr, &allow := 0, "HRESULT")
        return allow
    }

    /**
     * Indicates whether this is allowed. (INetFwIcmpSettings.put_AllowOutboundDestinationUnreachable)
     * @remarks
     * This setting is common to IPv4 and IPv6.
     * @param {VARIANT_BOOL} allow 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwicmpsettings-put_allowoutbounddestinationunreachable
     */
    put_AllowOutboundDestinationUnreachable(allow) {
        result := ComCall(8, this, VARIANT_BOOL, allow, "HRESULT")
        return result
    }

    /**
     * Indicates whether redirect is allowed. (Get)
     * @remarks
     * This setting is common to IPv4 and IPv6.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwicmpsettings-get_allowredirect
     */
    get_AllowRedirect() {
        result := ComCall(9, this, VARIANT_BOOL.Ptr, &allow := 0, "HRESULT")
        return allow
    }

    /**
     * Indicates whether redirect is allowed. (Put)
     * @remarks
     * This setting is common to IPv4 and IPv6.
     * @param {VARIANT_BOOL} allow 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwicmpsettings-put_allowredirect
     */
    put_AllowRedirect(allow) {
        result := ComCall(10, this, VARIANT_BOOL, allow, "HRESULT")
        return result
    }

    /**
     * Indicates whether this is allowed. (INetFwIcmpSettings.get_AllowInboundEchoRequest)
     * @remarks
     * This setting is common to IPv4 and IPv6.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwicmpsettings-get_allowinboundechorequest
     */
    get_AllowInboundEchoRequest() {
        result := ComCall(11, this, VARIANT_BOOL.Ptr, &allow := 0, "HRESULT")
        return allow
    }

    /**
     * Indicates whether this is allowed. (INetFwIcmpSettings.put_AllowInboundEchoRequest)
     * @remarks
     * This setting is common to IPv4 and IPv6.
     * @param {VARIANT_BOOL} allow 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwicmpsettings-put_allowinboundechorequest
     */
    put_AllowInboundEchoRequest(allow) {
        result := ComCall(12, this, VARIANT_BOOL, allow, "HRESULT")
        return result
    }

    /**
     * Indicates whether exceeding the outbound time is allowed. (Get)
     * @remarks
     * This setting is common to IPv4 and IPv6.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwicmpsettings-get_allowoutboundtimeexceeded
     */
    get_AllowOutboundTimeExceeded() {
        result := ComCall(13, this, VARIANT_BOOL.Ptr, &allow := 0, "HRESULT")
        return allow
    }

    /**
     * Indicates whether exceeding the outbound time is allowed. (Put)
     * @remarks
     * This setting is common to IPv4 and IPv6.
     * @param {VARIANT_BOOL} allow 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwicmpsettings-put_allowoutboundtimeexceeded
     */
    put_AllowOutboundTimeExceeded(allow) {
        result := ComCall(14, this, VARIANT_BOOL, allow, "HRESULT")
        return result
    }

    /**
     * Indicates whether this is allowed. (INetFwIcmpSettings.get_AllowOutboundParameterProblem)
     * @remarks
     * This setting is common to IPv4 and IPv6.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwicmpsettings-get_allowoutboundparameterproblem
     */
    get_AllowOutboundParameterProblem() {
        result := ComCall(15, this, VARIANT_BOOL.Ptr, &allow := 0, "HRESULT")
        return allow
    }

    /**
     * Indicates whether this is allowed. (INetFwIcmpSettings.put_AllowOutboundParameterProblem)
     * @remarks
     * This setting is common to IPv4 and IPv6.
     * @param {VARIANT_BOOL} allow 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwicmpsettings-put_allowoutboundparameterproblem
     */
    put_AllowOutboundParameterProblem(allow) {
        result := ComCall(16, this, VARIANT_BOOL, allow, "HRESULT")
        return result
    }

    /**
     * Indicates whether outbound source quench is allowed. (Get)
     * @remarks
     * This setting is  for IPv4 only.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwicmpsettings-get_allowoutboundsourcequench
     */
    get_AllowOutboundSourceQuench() {
        result := ComCall(17, this, VARIANT_BOOL.Ptr, &allow := 0, "HRESULT")
        return allow
    }

    /**
     * Indicates whether outbound source quench is allowed. (Put)
     * @remarks
     * This setting is  for IPv4 only.
     * @param {VARIANT_BOOL} allow 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwicmpsettings-put_allowoutboundsourcequench
     */
    put_AllowOutboundSourceQuench(allow) {
        result := ComCall(18, this, VARIANT_BOOL, allow, "HRESULT")
        return result
    }

    /**
     * Indicates whether this is allowed. (INetFwIcmpSettings.get_AllowInboundRouterRequest)
     * @remarks
     * This setting is  for IPv4 only.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwicmpsettings-get_allowinboundrouterrequest
     */
    get_AllowInboundRouterRequest() {
        result := ComCall(19, this, VARIANT_BOOL.Ptr, &allow := 0, "HRESULT")
        return allow
    }

    /**
     * Indicates whether this is allowed. (INetFwIcmpSettings.put_AllowInboundRouterRequest)
     * @remarks
     * This setting is  for IPv4 only.
     * @param {VARIANT_BOOL} allow 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwicmpsettings-put_allowinboundrouterrequest
     */
    put_AllowInboundRouterRequest(allow) {
        result := ComCall(20, this, VARIANT_BOOL, allow, "HRESULT")
        return result
    }

    /**
     * Indicates whether this is allowed. (INetFwIcmpSettings.get_AllowInboundTimestampRequest)
     * @remarks
     * This setting is  for IPv4 only.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwicmpsettings-get_allowinboundtimestamprequest
     */
    get_AllowInboundTimestampRequest() {
        result := ComCall(21, this, VARIANT_BOOL.Ptr, &allow := 0, "HRESULT")
        return allow
    }

    /**
     * Indicates whether this is allowed. (INetFwIcmpSettings.put_AllowInboundTimestampRequest)
     * @remarks
     * This setting is  for IPv4 only.
     * @param {VARIANT_BOOL} allow 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwicmpsettings-put_allowinboundtimestamprequest
     */
    put_AllowInboundTimestampRequest(allow) {
        result := ComCall(22, this, VARIANT_BOOL, allow, "HRESULT")
        return result
    }

    /**
     * Indicates whether this is allowed. (INetFwIcmpSettings.get_AllowInboundMaskRequest)
     * @remarks
     * This setting is  for IPv4 only.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwicmpsettings-get_allowinboundmaskrequest
     */
    get_AllowInboundMaskRequest() {
        result := ComCall(23, this, VARIANT_BOOL.Ptr, &allow := 0, "HRESULT")
        return allow
    }

    /**
     * Indicates whether this is allowed. (INetFwIcmpSettings.put_AllowInboundMaskRequest)
     * @remarks
     * This setting is  for IPv4 only.
     * @param {VARIANT_BOOL} allow 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwicmpsettings-put_allowinboundmaskrequest
     */
    put_AllowInboundMaskRequest(allow) {
        result := ComCall(24, this, VARIANT_BOOL, allow, "HRESULT")
        return result
    }

    /**
     * Indicates whether this is allowed. (INetFwIcmpSettings.get_AllowOutboundPacketTooBig)
     * @remarks
     * This setting is  for IPv6 only.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwicmpsettings-get_allowoutboundpackettoobig
     */
    get_AllowOutboundPacketTooBig() {
        result := ComCall(25, this, VARIANT_BOOL.Ptr, &allow := 0, "HRESULT")
        return allow
    }

    /**
     * Indicates whether this is allowed. (INetFwIcmpSettings.put_AllowOutboundPacketTooBig)
     * @remarks
     * This setting is  for IPv6 only.
     * @param {VARIANT_BOOL} allow 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwicmpsettings-put_allowoutboundpackettoobig
     */
    put_AllowOutboundPacketTooBig(allow) {
        result := ComCall(26, this, VARIANT_BOOL, allow, "HRESULT")
        return result
    }

    Query(iid) {
        if (INetFwIcmpSettings.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_AllowOutboundDestinationUnreachable := CallbackCreate(GetMethod(implObj, "get_AllowOutboundDestinationUnreachable"), flags, 2)
        this.vtbl.put_AllowOutboundDestinationUnreachable := CallbackCreate(GetMethod(implObj, "put_AllowOutboundDestinationUnreachable"), flags, 2)
        this.vtbl.get_AllowRedirect := CallbackCreate(GetMethod(implObj, "get_AllowRedirect"), flags, 2)
        this.vtbl.put_AllowRedirect := CallbackCreate(GetMethod(implObj, "put_AllowRedirect"), flags, 2)
        this.vtbl.get_AllowInboundEchoRequest := CallbackCreate(GetMethod(implObj, "get_AllowInboundEchoRequest"), flags, 2)
        this.vtbl.put_AllowInboundEchoRequest := CallbackCreate(GetMethod(implObj, "put_AllowInboundEchoRequest"), flags, 2)
        this.vtbl.get_AllowOutboundTimeExceeded := CallbackCreate(GetMethod(implObj, "get_AllowOutboundTimeExceeded"), flags, 2)
        this.vtbl.put_AllowOutboundTimeExceeded := CallbackCreate(GetMethod(implObj, "put_AllowOutboundTimeExceeded"), flags, 2)
        this.vtbl.get_AllowOutboundParameterProblem := CallbackCreate(GetMethod(implObj, "get_AllowOutboundParameterProblem"), flags, 2)
        this.vtbl.put_AllowOutboundParameterProblem := CallbackCreate(GetMethod(implObj, "put_AllowOutboundParameterProblem"), flags, 2)
        this.vtbl.get_AllowOutboundSourceQuench := CallbackCreate(GetMethod(implObj, "get_AllowOutboundSourceQuench"), flags, 2)
        this.vtbl.put_AllowOutboundSourceQuench := CallbackCreate(GetMethod(implObj, "put_AllowOutboundSourceQuench"), flags, 2)
        this.vtbl.get_AllowInboundRouterRequest := CallbackCreate(GetMethod(implObj, "get_AllowInboundRouterRequest"), flags, 2)
        this.vtbl.put_AllowInboundRouterRequest := CallbackCreate(GetMethod(implObj, "put_AllowInboundRouterRequest"), flags, 2)
        this.vtbl.get_AllowInboundTimestampRequest := CallbackCreate(GetMethod(implObj, "get_AllowInboundTimestampRequest"), flags, 2)
        this.vtbl.put_AllowInboundTimestampRequest := CallbackCreate(GetMethod(implObj, "put_AllowInboundTimestampRequest"), flags, 2)
        this.vtbl.get_AllowInboundMaskRequest := CallbackCreate(GetMethod(implObj, "get_AllowInboundMaskRequest"), flags, 2)
        this.vtbl.put_AllowInboundMaskRequest := CallbackCreate(GetMethod(implObj, "put_AllowInboundMaskRequest"), flags, 2)
        this.vtbl.get_AllowOutboundPacketTooBig := CallbackCreate(GetMethod(implObj, "get_AllowOutboundPacketTooBig"), flags, 2)
        this.vtbl.put_AllowOutboundPacketTooBig := CallbackCreate(GetMethod(implObj, "put_AllowOutboundPacketTooBig"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_AllowOutboundDestinationUnreachable)
        CallbackFree(this.vtbl.put_AllowOutboundDestinationUnreachable)
        CallbackFree(this.vtbl.get_AllowRedirect)
        CallbackFree(this.vtbl.put_AllowRedirect)
        CallbackFree(this.vtbl.get_AllowInboundEchoRequest)
        CallbackFree(this.vtbl.put_AllowInboundEchoRequest)
        CallbackFree(this.vtbl.get_AllowOutboundTimeExceeded)
        CallbackFree(this.vtbl.put_AllowOutboundTimeExceeded)
        CallbackFree(this.vtbl.get_AllowOutboundParameterProblem)
        CallbackFree(this.vtbl.put_AllowOutboundParameterProblem)
        CallbackFree(this.vtbl.get_AllowOutboundSourceQuench)
        CallbackFree(this.vtbl.put_AllowOutboundSourceQuench)
        CallbackFree(this.vtbl.get_AllowInboundRouterRequest)
        CallbackFree(this.vtbl.put_AllowInboundRouterRequest)
        CallbackFree(this.vtbl.get_AllowInboundTimestampRequest)
        CallbackFree(this.vtbl.put_AllowInboundTimestampRequest)
        CallbackFree(this.vtbl.get_AllowInboundMaskRequest)
        CallbackFree(this.vtbl.put_AllowInboundMaskRequest)
        CallbackFree(this.vtbl.get_AllowOutboundPacketTooBig)
        CallbackFree(this.vtbl.put_AllowOutboundPacketTooBig)
    }
}
