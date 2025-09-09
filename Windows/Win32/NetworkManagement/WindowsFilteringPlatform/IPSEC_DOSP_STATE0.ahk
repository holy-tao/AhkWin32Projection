#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Used to store state information for IPsec DoS Protection.
 * @remarks
 * <b>IPSEC_DOSP_STATE0</b> is a specific implementation of IPSEC_DOSP_STATE. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @see https://learn.microsoft.com/windows/win32/api/ipsectypes/ns-ipsectypes-ipsec_dosp_state0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class IPSEC_DOSP_STATE0 extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * The IPv6 address of the public host.
     * @type {Array<Byte>}
     */
    publicHostV6Addr{
        get {
            if(!this.HasProp("__publicHostV6AddrProxyArray"))
                this.__publicHostV6AddrProxyArray := Win32FixedArray(this.ptr + 0, 16, Primitive, "char")
            return this.__publicHostV6AddrProxyArray
        }
    }

    /**
     * The IPv6 address of the internal host.
     * @type {Array<Byte>}
     */
    internalHostV6Addr{
        get {
            if(!this.HasProp("__internalHostV6AddrProxyArray"))
                this.__internalHostV6AddrProxyArray := Win32FixedArray(this.ptr + 16, 16, Primitive, "char")
            return this.__internalHostV6AddrProxyArray
        }
    }

    /**
     * The total number of inbound IPv6 IPsec packets that have been allowed since the state entry was created.
     * @type {Integer}
     */
    totalInboundIPv6IPsecAuthPackets {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * The total number of outbound IPv6 IPsec packets that have been allowed since the state entry was created.
     * @type {Integer}
     */
    totalOutboundIPv6IPsecAuthPackets {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * The duration, in seconds, since the state entry was created.
     * @type {Integer}
     */
    durationSecs {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }
}
