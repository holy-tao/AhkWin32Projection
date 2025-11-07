#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\QOS_OBJECT_HDR.ahk

/**
 * The QOS_DIFFSERV traffic control object is used to specify filters for the packet scheduler when it operates in Differentiated Services Mode.
 * @remarks
 * 
 * The 
 * <b>QOS_DIFFSERV</b> object is used to specify the set of Diffserv rules that apply to the specified flow, all of which are specified in the <b>DiffservRule</b> member. Each Diffserv rule has an InboundDSField value, which signifies the DSCP on the Inbound packet. The Diffserv Rules also have OutboundDSCP and UserPriority values for conforming and nonconforming packets. These indicate the DSCP and 802.1p values that go out on the forwarded packet. Note that the DSCP or UserPriority mapping based on ServiceType or 
 * <b>QOS_DS_CLASS</b> or 
 * <b>QOS_TRAFFIC_CLASS</b> is not used in this mode.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//qosobjs/ns-qosobjs-qos_diffserv
 * @namespace Windows.Win32.NetworkManagement.QoS
 * @version v4.0.30319
 */
class QOS_DIFFSERV extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The QOS object 
     * <b>QOS_OBJECT_HDR</b>. The object type for this traffic control object should be 
     * QOS_OBJECT_DIFFSERV.
     * @type {QOS_OBJECT_HDR}
     */
    ObjectHdr{
        get {
            if(!this.HasProp("__ObjectHdr"))
                this.__ObjectHdr := QOS_OBJECT_HDR(0, this)
            return this.__ObjectHdr
        }
    }

    /**
     * Number of Diffserv Rules in this object.
     * @type {Integer}
     */
    DSFieldCount {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/qosobjs/ns-qosobjs-qos_diffserv_rule">QOS_DIFFSERV_RULE</a> structures.
     * @type {Array<Byte>}
     */
    DiffservRule{
        get {
            if(!this.HasProp("__DiffservRuleProxyArray"))
                this.__DiffservRuleProxyArray := Win32FixedArray(this.ptr + 12, 1, Primitive, "char")
            return this.__DiffservRuleProxyArray
        }
    }
}
