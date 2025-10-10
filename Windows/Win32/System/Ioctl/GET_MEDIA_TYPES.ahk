#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DEVICE_MEDIA_INFO.ahk

/**
 * Contains information about the media types supported by a device.
 * @see https://docs.microsoft.com/windows/win32/api//winioctl/ns-winioctl-get_media_types
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class GET_MEDIA_TYPES extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The type of device. Values from 0 through 32,767 are reserved for use by Microsoft Corporation. Values from 32,768 through 65,535 are reserved for use by other vendors. The following values are defined by Microsoft:
     * 
     * <a id="FILE_DEVICE_8042_PORT"></a>
     * <a id="file_device_8042_port"></a>
     * @type {Integer}
     */
    DeviceType {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The number of elements in the <b>MediaInfo</b> array.
     * @type {Integer}
     */
    MediaInfoCount {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * A pointer to the first 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ns-winioctl-device_media_info">DEVICE_MEDIA_INFO</a> structure in the array. There is one structure for each media type supported by the device.
     * @type {Array<DEVICE_MEDIA_INFO>}
     */
    MediaInfo{
        get {
            if(!this.HasProp("__MediaInfoProxyArray"))
                this.__MediaInfoProxyArray := Win32FixedArray(this.ptr + 8, 1, DEVICE_MEDIA_INFO, "")
            return this.__MediaInfoProxyArray
        }
    }
}
