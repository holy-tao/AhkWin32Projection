#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\QOS_OBJECT_HDR.ahk

/**
 * The traffic control object QOS_DS_CLASS enables application developers to override the default Diffserv code point (DSCP) value for the IP packets associated with a given flow. By default, the DSCP value is derived from the flow's ServiceType.
 * @see https://learn.microsoft.com/windows/win32/api/qosobjs/ns-qosobjs-qos_ds_class
 * @namespace Windows.Win32.NetworkManagement.QoS
 * @version v4.0.30319
 */
class QOS_DS_CLASS extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The QOS object 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/qos/ns-qos-qos_object_hdr">QOS_OBJECT_HDR</a>. The object type for this traffic control object should be 
     * <b>QOS_OBJECT_DS_CLASS</b>.
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
     * User priority value for the flow. The valid range is 0x00 through 0x3F. The following settings are chosen (by default) when the 
     * <b>QOS_DS_CLASS</b> traffic control object is not used. 
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * ServiceTypeBestEffort, ServiceTypeQualitative
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0x18</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * ServiceTypeControlledLoad
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0x28</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * ServiceTypeGuaranteed
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0x30</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * ServiceTypeNetworkControl
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0x00</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Non-conformant traffic
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    DSField {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
