#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\IN_ADDR_IPV4.ahk

/**
 * The RSVP_FILTERSPEC_V4_GPI structure provides general port identifier information for a given FILTERSPEC.
 * @remarks
 * When working with IPv6 addresses, use <a href="https://docs.microsoft.com/windows/desktop/api/qossp/ns-qossp-rsvp_filterspec_v6_gpi">RSVP_FILTERSPEC_V6_GPI</a>.
 * @see https://learn.microsoft.com/windows/win32/api/qossp/ns-qossp-rsvp_filterspec_v4_gpi
 * @namespace Windows.Win32.NetworkManagement.QoS
 * @version v4.0.30319
 */
class RSVP_FILTERSPEC_V4_GPI extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * IPv4 address for which the FILTERSPEC general port identifier applies, expressed as an <a href="https://docs.microsoft.com/windows/desktop/api/qossp/ns-qossp-in_addr_ipv4">IN_ADDR_IPV4</a> union.
     * @type {IN_ADDR_IPV4}
     */
    Address{
        get {
            if(!this.HasProp("__Address"))
                this.__Address := IN_ADDR_IPV4(0, this)
            return this.__Address
        }
    }

    /**
     * General Port Identifier for the FILTERSPEC.
     * @type {Integer}
     */
    GeneralPortId {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
