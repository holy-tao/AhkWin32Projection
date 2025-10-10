#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\QOS_OBJECT_HDR.ahk

/**
 * The QOS object QOS_SD_MODE defines the behavior of the traffic control-packet shaper component.
 * @see https://docs.microsoft.com/windows/win32/api//qos/ns-qos-qos_sd_mode
 * @namespace Windows.Win32.NetworkManagement.QoS
 * @version v4.0.30319
 */
class QOS_SD_MODE extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The QOS object 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/qos/ns-qos-qos_object_hdr">QOS_OBJECT_HDR</a>. The object type for this QOS object should be 
     * <b>QOS_SD_MODE</b>.
     * @type {QOS_OBJECT_HDR}
     */
    ObjectHdr{
        get {
            if(!this.HasProp("__ObjectHdr"))
                this.__ObjectHdr := QOS_OBJECT_HDR(this.ptr + 0)
            return this.__ObjectHdr
        }
    }

    /**
     * Specifies the requested behavior of the packet shaper. Note that there are elements of packet handling within these predefined behaviors that depend on the flow settings specified within 
     * <a href="https://docs.microsoft.com/windows/desktop/api/qos/ns-qos-flowspec">FLOWSPEC</a>. 
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TC_NONCONF_BORROW"></a><a id="tc_nonconf_borrow"></a><dl>
     * <dt><b>TC_NONCONF_BORROW</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This mode is currently only available to the TC API. It is not available to users of the QOS API. 
     * 
     * 
     * 
     * 
     * Instructs the packet shaper to borrow remaining available resources after all higher priority flows have been serviced. If the <b>TokenRate</b> member of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/qos/ns-qos-flowspec">FLOWSPEC</a> is specified for this flow, packets that exceed the value of <b>TokenRate</b> will have their priority demoted to less than SERVICETYPE_BESTEFFORT, as defined in the <b>ServiceType</b> member of the 
     * <b>FLOWSPEC</b> structure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TC_NONCONF_SHAPE"></a><a id="tc_nonconf_shape"></a><dl>
     * <dt><b>TC_NONCONF_SHAPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Instructs the packet shaper to retain packets until network resources are available to the flow in sufficient quantity to make such packets conforming. (For example, a 100K packet will be retained in the packet shaper until 100K worth of credit is accrued for the flow, allowing the packet to be transmitted as conforming). Note that TokenRate must be specified if using TC_NONCONF_SHAPE.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TC_NONCONF_DISCARD"></a><a id="tc_nonconf_discard"></a><dl>
     * <dt><b>TC_NONCONF_DISCARD</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Instructs the packet shaper to discard all nonconforming packets. TC_NONCONF_DISCARD should be used with care.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    ShapeDiscardMode {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
