#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the attributes of a disk device.
 * @see https://docs.microsoft.com/windows/win32/api//winioctl/ns-winioctl-get_disk_attributes
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class GET_DISK_ATTRIBUTES extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Set to <c>sizeof(GET_DISK_ATTRIBUTES)</c>.
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Reserved.
     * @type {Integer}
     */
    Reserved1 {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

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
     * @type {Integer}
     */
    Attributes {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
