#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\IN_ADDR_IPV6.ahk

/**
 * The RSVP_FILTERSPEC_V6_FLOW structure provides flow label information for an IPv6 FILTERSPEC.
 * @see https://docs.microsoft.com/windows/win32/api//qossp/ns-qossp-rsvp_filterspec_v6_flow
 * @namespace Windows.Win32.NetworkManagement.QoS
 * @version v4.0.30319
 */
class RSVP_FILTERSPEC_V6_FLOW extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * IPv4 address for which the FILTERSPEC flow label applies, expressed as an <a href="https://docs.microsoft.com/windows/desktop/api/qossp/ns-qossp-in_addr_ipv6">IN_ADDR_IPV6</a> structure.
     * @type {IN_ADDR_IPV6}
     */
    Address{
        get {
            if(!this.HasProp("__Address"))
                this.__Address := IN_ADDR_IPV6(this.ptr + 0)
            return this.__Address
        }
    }

    /**
     * 
     * @type {Integer}
     */
    UnUsed {
        get => NumGet(this, 16, "char")
        set => NumPut("char", value, this, 16)
    }

    /**
     * Label for the flow.
     * @type {Array<Byte>}
     */
    FlowLabel{
        get {
            if(!this.HasProp("__FlowLabelProxyArray"))
                this.__FlowLabelProxyArray := Win32FixedArray(this.ptr + 17, 3, Primitive, "char")
            return this.__FlowLabelProxyArray
        }
    }
}
