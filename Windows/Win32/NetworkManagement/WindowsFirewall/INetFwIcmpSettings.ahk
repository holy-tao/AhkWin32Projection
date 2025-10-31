#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The INetFwIcmpSettings interface provides access to the settings controlling ICMP packets.
 * @remarks
 * 
  * Instances of this interface
  * are retrieved through the <a href="https://docs.microsoft.com/windows/desktop/api/netfw/nf-netfw-inetfwprofile-get_icmpsettings">IcmpSettings</a> property of the INetFwProfile interface.
  * 
  * Because the methods and properties of this interface enable all rules belonging to a given ICMP type, enabling a rule may enable rules from other groups as well.
  * 
  * All configuration changes take
  * effect immediately.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//netfw/nn-netfw-inetfwicmpsettings
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 * @version v4.0.30319
 */
class INetFwIcmpSettings extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INetFwIcmpSettings
     * @type {Guid}
     */
    static IID => Guid("{a6207b2e-7cdd-426a-951e-5e1cbc5afead}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AllowOutboundDestinationUnreachable", "put_AllowOutboundDestinationUnreachable", "get_AllowRedirect", "put_AllowRedirect", "get_AllowInboundEchoRequest", "put_AllowInboundEchoRequest", "get_AllowOutboundTimeExceeded", "put_AllowOutboundTimeExceeded", "get_AllowOutboundParameterProblem", "put_AllowOutboundParameterProblem", "get_AllowOutboundSourceQuench", "put_AllowOutboundSourceQuench", "get_AllowInboundRouterRequest", "put_AllowInboundRouterRequest", "get_AllowInboundTimestampRequest", "put_AllowInboundTimestampRequest", "get_AllowInboundMaskRequest", "put_AllowInboundMaskRequest", "get_AllowOutboundPacketTooBig", "put_AllowOutboundPacketTooBig"]

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} allow 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwicmpsettings-get_allowoutbounddestinationunreachable
     */
    get_AllowOutboundDestinationUnreachable(allow) {
        result := ComCall(7, this, "ptr", allow, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} allow 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwicmpsettings-put_allowoutbounddestinationunreachable
     */
    put_AllowOutboundDestinationUnreachable(allow) {
        result := ComCall(8, this, "short", allow, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} allow 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwicmpsettings-get_allowredirect
     */
    get_AllowRedirect(allow) {
        result := ComCall(9, this, "ptr", allow, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} allow 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwicmpsettings-put_allowredirect
     */
    put_AllowRedirect(allow) {
        result := ComCall(10, this, "short", allow, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} allow 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwicmpsettings-get_allowinboundechorequest
     */
    get_AllowInboundEchoRequest(allow) {
        result := ComCall(11, this, "ptr", allow, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} allow 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwicmpsettings-put_allowinboundechorequest
     */
    put_AllowInboundEchoRequest(allow) {
        result := ComCall(12, this, "short", allow, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} allow 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwicmpsettings-get_allowoutboundtimeexceeded
     */
    get_AllowOutboundTimeExceeded(allow) {
        result := ComCall(13, this, "ptr", allow, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} allow 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwicmpsettings-put_allowoutboundtimeexceeded
     */
    put_AllowOutboundTimeExceeded(allow) {
        result := ComCall(14, this, "short", allow, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} allow 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwicmpsettings-get_allowoutboundparameterproblem
     */
    get_AllowOutboundParameterProblem(allow) {
        result := ComCall(15, this, "ptr", allow, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} allow 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwicmpsettings-put_allowoutboundparameterproblem
     */
    put_AllowOutboundParameterProblem(allow) {
        result := ComCall(16, this, "short", allow, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} allow 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwicmpsettings-get_allowoutboundsourcequench
     */
    get_AllowOutboundSourceQuench(allow) {
        result := ComCall(17, this, "ptr", allow, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} allow 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwicmpsettings-put_allowoutboundsourcequench
     */
    put_AllowOutboundSourceQuench(allow) {
        result := ComCall(18, this, "short", allow, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} allow 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwicmpsettings-get_allowinboundrouterrequest
     */
    get_AllowInboundRouterRequest(allow) {
        result := ComCall(19, this, "ptr", allow, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} allow 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwicmpsettings-put_allowinboundrouterrequest
     */
    put_AllowInboundRouterRequest(allow) {
        result := ComCall(20, this, "short", allow, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} allow 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwicmpsettings-get_allowinboundtimestamprequest
     */
    get_AllowInboundTimestampRequest(allow) {
        result := ComCall(21, this, "ptr", allow, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} allow 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwicmpsettings-put_allowinboundtimestamprequest
     */
    put_AllowInboundTimestampRequest(allow) {
        result := ComCall(22, this, "short", allow, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} allow 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwicmpsettings-get_allowinboundmaskrequest
     */
    get_AllowInboundMaskRequest(allow) {
        result := ComCall(23, this, "ptr", allow, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} allow 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwicmpsettings-put_allowinboundmaskrequest
     */
    put_AllowInboundMaskRequest(allow) {
        result := ComCall(24, this, "short", allow, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} allow 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwicmpsettings-get_allowoutboundpackettoobig
     */
    get_AllowOutboundPacketTooBig(allow) {
        result := ComCall(25, this, "ptr", allow, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} allow 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwicmpsettings-put_allowoutboundpackettoobig
     */
    put_AllowOutboundPacketTooBig(allow) {
        result := ComCall(26, this, "short", allow, "HRESULT")
        return result
    }
}
