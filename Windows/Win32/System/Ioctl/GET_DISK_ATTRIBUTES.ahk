#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains the attributes of a disk device.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-get_disk_attributes
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct GET_DISK_ATTRIBUTES {
    #StructPack 8

    /**
     * Set to <c>sizeof(GET_DISK_ATTRIBUTES)</c>.
     */
    Version : UInt32

    /**
     * Reserved.
     */
    Reserved1 : UInt32

    /**
     * Contains attributes.
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

}
