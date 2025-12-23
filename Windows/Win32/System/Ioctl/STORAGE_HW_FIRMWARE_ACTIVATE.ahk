#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * This structure contains information about the downloaded firmware to activate.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-storage_hw_firmware_activate
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class STORAGE_HW_FIRMWARE_ACTIVATE extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * The version of this structure. This should be set to sizeof(STORAGE_HW_FIRMWARE_ACTIVATE).
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The size of this structure. This should be set to sizeof(STORAGE_HW_FIRMWARE_ACTIVATE).
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The flags associated with the activation request. The following are valid flags that can be set in this member.
     * 
     * <table>
     * <tr>
     * <th>Flag</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>STORAGE_HW_FIRMWARE_REQUEST_FLAG_CONTROLLER</td>
     * <td>Indicates that the target of the request is a controller or adapter, different than the device handle or object itself (e.g. NVMe SSD or HBA).</td>
     * </tr>
     * <tr>
     * <td>STORAGE_HW_FIRMWARE_REQUEST_FLAG_SWITCH_TO_EXISTING_FIRMWARE</td>
     * <td>Indicates that the existing firmware image in the specified slot should be activated.</td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The slot with the firmware image that is to be activated.
     * @type {Integer}
     */
    Slot {
        get => NumGet(this, 12, "char")
        set => NumPut("char", value, this, 12)
    }

    /**
     * Reserved for future use.
     * @type {Array<Byte>}
     */
    Reserved0{
        get {
            if(!this.HasProp("__Reserved0ProxyArray"))
                this.__Reserved0ProxyArray := Win32FixedArray(this.ptr + 13, 3, Primitive, "char")
            return this.__Reserved0ProxyArray
        }
    }
}
