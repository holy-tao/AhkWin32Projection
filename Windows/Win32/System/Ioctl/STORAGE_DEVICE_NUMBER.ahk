#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains information about a device. This structure is used by the IOCTL_STORAGE_GET_DEVICE_NUMBER control code.
 * @remarks
 * The values in the <b>STORAGE_DEVICE_NUMBER</b> structure are guaranteed to remain unchanged until the device is removed or the system is restarted. They are not guaranteed to be persistent across device or system restarts.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-storage_device_number
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct STORAGE_DEVICE_NUMBER {
    #StructPack 4

    /**
     * The type of device. Values from 0 through 32,767 are reserved for use by Microsoft. Values from 32,768 through 65,535 are reserved for use by other vendors. The following values are defined by Microsoft: 
     * 
     * <a id="FILE_DEVICE_8042_PORT"></a>
     * <a id="file_device_8042_port"></a>
     */
    DeviceType : UInt32

    /**
     * The number of this device.
     */
    DeviceNumber : UInt32

    /**
     * The partition number of the device, if the device can be partitioned. Otherwise, this member is –1.
     */
    PartitionNumber : UInt32

}
