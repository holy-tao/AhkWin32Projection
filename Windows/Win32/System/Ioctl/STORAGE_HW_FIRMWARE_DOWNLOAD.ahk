#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * This structure contains a firmware image payload to be downloaded to the target.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-storage_hw_firmware_download
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class STORAGE_HW_FIRMWARE_DOWNLOAD extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * The version of this structure. This should be set to sizeof(STORAGE_HW_FIRMWARE_DOWNLOAD).
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The size of this structure and the download image buffer.
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Flags associated with this download. The following are valid flags that this member can hold.
     * 
     * <table>
     * <tr>
     * <th>Flag</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>STORAGE_HW_FIRMWARE_REQUEST_FLAG_CONTROLLER</td>
     * <td>Indicates that the target of the request is a controller or adapter, different than the device handler or object itself (e.g. NVMe SSD or HBA).</td>
     * </tr>
     * <tr>
     * <td>STORAGE_HW_FIRMWARE_REQUEST_FLAG_LAST_SEGMENT</td>
     * <td>Indicates that the current firmware image segment is the last one.</td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The slot number that the firmware image will be downloaded to.
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
    Reserved{
        get {
            if(!this.HasProp("__ReservedProxyArray"))
                this.__ReservedProxyArray := Win32FixedArray(this.ptr + 13, 1, Primitive, "char")
            return this.__ReservedProxyArray
        }
    }

    /**
     * The offset in this buffer of where the Image file begins. This should be aligned to <b>ImagePayloadAlignment</b> from <a href="https://docs.microsoft.com/windows/desktop/FileIO/storage-hw-firmware-info">STORAGE_HW_FIRMWARE_INFO</a>.
     * @type {Integer}
     */
    Offset {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The buffer size of the ImageBuffer. This should be a multiple of <b>ImagePayloadAlignment</b> from <a href="https://docs.microsoft.com/windows/desktop/FileIO/storage-hw-firmware-info">STORAGE_HW_FIRMWARE_INFO</a>.
     * @type {Integer}
     */
    BufferSize {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * The firmware image file.
     * @type {Array<Byte>}
     */
    ImageBuffer{
        get {
            if(!this.HasProp("__ImageBufferProxyArray"))
                this.__ImageBufferProxyArray := Win32FixedArray(this.ptr + 32, 1, Primitive, "char")
            return this.__ImageBufferProxyArray
        }
    }
}
