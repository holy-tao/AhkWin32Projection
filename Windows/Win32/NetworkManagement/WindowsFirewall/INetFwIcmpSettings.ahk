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
     * 
     * @param {Pointer<VARIANT_BOOL>} allow 
     * @returns {HRESULT} 
     */
    get_AllowOutboundDestinationUnreachable(allow) {
        result := ComCall(7, this, "ptr", allow, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} allow 
     * @returns {HRESULT} 
     */
    put_AllowOutboundDestinationUnreachable(allow) {
        result := ComCall(8, this, "short", allow, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} allow 
     * @returns {HRESULT} 
     */
    get_AllowRedirect(allow) {
        result := ComCall(9, this, "ptr", allow, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} allow 
     * @returns {HRESULT} 
     */
    put_AllowRedirect(allow) {
        result := ComCall(10, this, "short", allow, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} allow 
     * @returns {HRESULT} 
     */
    get_AllowInboundEchoRequest(allow) {
        result := ComCall(11, this, "ptr", allow, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} allow 
     * @returns {HRESULT} 
     */
    put_AllowInboundEchoRequest(allow) {
        result := ComCall(12, this, "short", allow, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} allow 
     * @returns {HRESULT} 
     */
    get_AllowOutboundTimeExceeded(allow) {
        result := ComCall(13, this, "ptr", allow, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} allow 
     * @returns {HRESULT} 
     */
    put_AllowOutboundTimeExceeded(allow) {
        result := ComCall(14, this, "short", allow, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} allow 
     * @returns {HRESULT} 
     */
    get_AllowOutboundParameterProblem(allow) {
        result := ComCall(15, this, "ptr", allow, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} allow 
     * @returns {HRESULT} 
     */
    put_AllowOutboundParameterProblem(allow) {
        result := ComCall(16, this, "short", allow, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} allow 
     * @returns {HRESULT} 
     */
    get_AllowOutboundSourceQuench(allow) {
        result := ComCall(17, this, "ptr", allow, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} allow 
     * @returns {HRESULT} 
     */
    put_AllowOutboundSourceQuench(allow) {
        result := ComCall(18, this, "short", allow, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} allow 
     * @returns {HRESULT} 
     */
    get_AllowInboundRouterRequest(allow) {
        result := ComCall(19, this, "ptr", allow, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} allow 
     * @returns {HRESULT} 
     */
    put_AllowInboundRouterRequest(allow) {
        result := ComCall(20, this, "short", allow, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} allow 
     * @returns {HRESULT} 
     */
    get_AllowInboundTimestampRequest(allow) {
        result := ComCall(21, this, "ptr", allow, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} allow 
     * @returns {HRESULT} 
     */
    put_AllowInboundTimestampRequest(allow) {
        result := ComCall(22, this, "short", allow, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} allow 
     * @returns {HRESULT} 
     */
    get_AllowInboundMaskRequest(allow) {
        result := ComCall(23, this, "ptr", allow, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} allow 
     * @returns {HRESULT} 
     */
    put_AllowInboundMaskRequest(allow) {
        result := ComCall(24, this, "short", allow, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} allow 
     * @returns {HRESULT} 
     */
    get_AllowOutboundPacketTooBig(allow) {
        result := ComCall(25, this, "ptr", allow, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} allow 
     * @returns {HRESULT} 
     */
    put_AllowOutboundPacketTooBig(allow) {
        result := ComCall(26, this, "short", allow, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
