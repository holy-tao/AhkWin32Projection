#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies the attributes to be set on a disk device.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-set_disk_attributes
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class SET_DISK_ATTRIBUTES extends Win32Struct
{
    static sizeof => 40

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
     * If <b>TRUE</b>, these settings are persisted across reboots.
     * @type {BOOLEAN}
     */
    Persist {
        get => NumGet(this, 4, "char")
        set => NumPut("char", value, this, 4)
    }

    /**
     * Reserved. Must be set to <b>FALSE</b> (0).
     * @type {Array<Byte>}
     */
    Reserved1{
        get {
            if(!this.HasProp("__Reserved1ProxyArray"))
                this.__Reserved1ProxyArray := Win32FixedArray(this.ptr + 5, 3, Primitive, "char")
            return this.__Reserved1ProxyArray
        }
    }

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
     * @type {Integer}
     */
    Attributes {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

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
     * @type {Integer}
     */
    AttributesMask {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Reserved. Must be set to 0.
     * @type {Array<UInt32>}
     */
    Reserved2{
        get {
            if(!this.HasProp("__Reserved2ProxyArray"))
                this.__Reserved2ProxyArray := Win32FixedArray(this.ptr + 24, 4, Primitive, "uint")
            return this.__Reserved2ProxyArray
        }
    }
}
