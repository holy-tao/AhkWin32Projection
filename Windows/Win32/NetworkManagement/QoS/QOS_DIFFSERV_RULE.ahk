#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The QOS_DIFFSERV_RULE structure is used in conjunction with the traffic control object QOS_DIFFSERV to provide Diffserv rules for a given flow.
 * @see https://learn.microsoft.com/windows/win32/api/qosobjs/ns-qosobjs-qos_diffserv_rule
 * @namespace Windows.Win32.NetworkManagement.QoS
 * @version v4.0.30319
 */
class QOS_DIFFSERV_RULE extends Win32Struct
{
    static sizeof => 5

    static packingSize => 1

    /**
     * Diffserv code point (DSCP) on the inbound packet. <b>InboundDSField</b> must be unique for the interface, otherwise the flow addition will fail. 
     * 
     * 
     * 
     * 
     * Valid range is 0x00 - 0x3F.
     * @type {Integer}
     */
    InboundDSField {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * Diffserv code point (DSCP) marked on all conforming packets on the flow. This member can be used to remark the packet before it is forwarded. 
     * 
     * 
     * 
     * 
     * Valid range is 0x00 - 0x3F.
     * @type {Integer}
     */
    ConformingOutboundDSField {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * Diffserv code point (DSCP) marked on all nonconforming packets on the flow. This member can be used to remark the packet before it is forwarded. 
     * 
     * 
     * 
     * 
     * Valid range is 0x00 - 0x3F.
     * @type {Integer}
     */
    NonConformingOutboundDSField {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }

    /**
     * UserPriority value marked on all conforming packets on the flow. This member can be used to remark the packet before it is forwarded. 
     * 
     * 
     * 
     * 
     * Valid range is 0-7
     * @type {Integer}
     */
    ConformingUserPriority {
        get => NumGet(this, 3, "char")
        set => NumPut("char", value, this, 3)
    }

    /**
     * UserPriority value marked on all nonconforming packets on the flow. This member can be used to remark the packet before it is forwarded. 
     * 
     * 
     * 
     * 
     * Valid range is 0-7
     * @type {Integer}
     */
    NonConformingUserPriority {
        get => NumGet(this, 4, "char")
        set => NumPut("char", value, this, 4)
    }
}
