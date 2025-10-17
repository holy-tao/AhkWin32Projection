#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\IN_ADDR_IPV4.ahk

/**
 * The RSVP_FILTERSPEC_V4 structure stores information for a FILTERSPEC on an IPv4 address.
 * @remarks
 * 
  * When working with IPv6 addresses, use <a href="https://docs.microsoft.com/windows/desktop/api/qossp/ns-qossp-rsvp_filterspec_v6">RSVP_FILTERSPEC_V6</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//qossp/ns-qossp-rsvp_filterspec_v4
 * @namespace Windows.Win32.NetworkManagement.QoS
 * @version v4.0.30319
 */
class RSVP_FILTERSPEC_V4 extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * IPv4 address for which the FILTERSPEC applies, expressed as an <a href="https://docs.microsoft.com/windows/desktop/api/qossp/ns-qossp-in_addr_ipv4">IN_ADDR_IPV4</a> union.
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
     * Reserved. Set to zero.
     * @type {Integer}
     */
    Unused {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }

    /**
     * TCP port of the socket on which the FILTERSPEC applies.
     * @type {Integer}
     */
    Port {
        get => NumGet(this, 10, "ushort")
        set => NumPut("ushort", value, this, 10)
    }
}
