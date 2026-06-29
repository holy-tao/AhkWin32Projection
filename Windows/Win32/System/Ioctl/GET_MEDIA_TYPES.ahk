#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\STORAGE_MEDIA_TYPE.ahk" { STORAGE_MEDIA_TYPE }
#Import "..\..\Storage\FileSystem\STORAGE_BUS_TYPE.ahk" { STORAGE_BUS_TYPE }
#Import ".\DEVICE_MEDIA_INFO.ahk" { DEVICE_MEDIA_INFO }

/**
 * Contains information about the media types supported by a device.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-get_media_types
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct GET_MEDIA_TYPES {
    #StructPack 8

    /**
     * The type of device. Values from 0 through 32,767 are reserved for use by Microsoft Corporation. Values from 32,768 through 65,535 are reserved for use by other vendors. The following values are defined by Microsoft:
     * 
     * <a id="FILE_DEVICE_8042_PORT"></a>
     * <a id="file_device_8042_port"></a>
     */
    DeviceType : UInt32

    /**
     * The number of elements in the <b>MediaInfo</b> array.
     */
    MediaInfoCount : UInt32

    /**
     * A pointer to the first 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ns-winioctl-device_media_info">DEVICE_MEDIA_INFO</a> structure in the array. There is one structure for each media type supported by the device.
     */
    MediaInfo : DEVICE_MEDIA_INFO[1]

}
