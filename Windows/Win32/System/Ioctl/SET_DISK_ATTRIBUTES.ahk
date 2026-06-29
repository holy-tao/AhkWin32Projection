#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * Specifies the attributes to be set on a disk device.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-set_disk_attributes
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct SET_DISK_ATTRIBUTES {
    #StructPack 8

    /**
     * Set to <c>sizeof(GET_DISK_ATTRIBUTES)</c>.
     */
    Version : UInt32

    /**
     * If <b>TRUE</b>, these settings are persisted across reboots.
     */
    Persist : BOOLEAN

    /**
     * Reserved. Must be set to <b>FALSE</b> (0).
     */
    Reserved1 : Int8[3]

    /**
     * Specifies attributes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DISK_ATTRIBUTE_OFFLINE"></a><a id="disk_attribute_offline"></a><dl>
     * <dt><b>DISK_ATTRIBUTE_OFFLINE</b></dt>
     * <dt>0x0000000000000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The disk is offline.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DISK_ATTRIBUTE_READ_ONLY"></a><a id="disk_attribute_read_only"></a><dl>
     * <dt><b>DISK_ATTRIBUTE_READ_ONLY</b></dt>
     * <dt>0x0000000000000002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The disk is read-only.
     * 
     * </td>
     * </tr>
     * </table>
     */
    Attributes : Int64

    /**
     * Indicates which attributes are being changed.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DISK_ATTRIBUTE_OFFLINE"></a><a id="disk_attribute_offline"></a><dl>
     * <dt><b>DISK_ATTRIBUTE_OFFLINE</b></dt>
     * <dt>0x0000000000000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The offline attribute is being changed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DISK_ATTRIBUTE_READ_ONLY"></a><a id="disk_attribute_read_only"></a><dl>
     * <dt><b>DISK_ATTRIBUTE_READ_ONLY</b></dt>
     * <dt>0x0000000000000002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The read-only attribute is being changed.
     * 
     * </td>
     * </tr>
     * </table>
     */
    AttributesMask : Int64

    /**
     * Reserved. Must be set to 0.
     */
    Reserved2 : UInt32[4]

}
