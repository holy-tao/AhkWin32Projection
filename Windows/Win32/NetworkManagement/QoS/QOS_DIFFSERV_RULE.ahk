#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The QOS_DIFFSERV_RULE structure is used in conjunction with the traffic control object QOS_DIFFSERV to provide Diffserv rules for a given flow.
 * @see https://learn.microsoft.com/windows/win32/api/qosobjs/ns-qosobjs-qos_diffserv_rule
 * @namespace Windows.Win32.NetworkManagement.QoS
 */
export default struct QOS_DIFFSERV_RULE {
    #StructPack 1

    /**
     * Diffserv code point (DSCP) on the inbound packet. <b>InboundDSField</b> must be unique for the interface, otherwise the flow addition will fail. 
     * 
     * 
     * 
     * 
     * Valid range is 0x00 - 0x3F.
     */
    InboundDSField : Int8

    /**
     * Diffserv code point (DSCP) marked on all conforming packets on the flow. This member can be used to remark the packet before it is forwarded. 
     * 
     * 
     * 
     * 
     * Valid range is 0x00 - 0x3F.
     */
    ConformingOutboundDSField : Int8

    /**
     * Diffserv code point (DSCP) marked on all nonconforming packets on the flow. This member can be used to remark the packet before it is forwarded. 
     * 
     * 
     * 
     * 
     * Valid range is 0x00 - 0x3F.
     */
    NonConformingOutboundDSField : Int8

    /**
     * UserPriority value marked on all conforming packets on the flow. This member can be used to remark the packet before it is forwarded. 
     * 
     * 
     * 
     * 
     * Valid range is 0-7
     */
    ConformingUserPriority : Int8

    /**
     * UserPriority value marked on all nonconforming packets on the flow. This member can be used to remark the packet before it is forwarded. 
     * 
     * 
     * 
     * 
     * Valid range is 0-7
     */
    NonConformingUserPriority : Int8

}
