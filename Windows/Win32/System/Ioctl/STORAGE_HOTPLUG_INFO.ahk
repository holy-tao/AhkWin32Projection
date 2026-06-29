#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * Provides information about the hotplug information of a device.
 * @remarks
 * The value of the <b>Size</b> member also identifies the version of this structure, as 
 *     members will be added to this structure in the future. If the value of the <b>Size</b> member 
 *     is <c>sizeof(STORAGE_HOTPLUG_INFO)</c>, the current version of the 
 *     structure is the same as the version you compiled with. If the value is not 
 *     <c>sizeof(STORAGE_HOTPLUG_INFO)</c>, then the current version contains 
 *     additional members.
 * 
 * A hotplug device refers to a device whose <b>RemovalPolicy</b> value displayed in 
 *     the Device Manager is <b>ExpectSurpriseRemoval</b>. To query whether a particular device is a 
 *     hotplug device, use the 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ni-winioctl-ioctl_storage_get_hotplug_info">IOCTL_STORAGE_GET_HOTPLUG_INFO</a> operation. 
 *     To set the hotplug properties of a device, use the 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ni-winioctl-ioctl_storage_set_hotplug_info">IOCTL_STORAGE_SET_HOTPLUG_INFO</a> 
 *     operation.
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ni-winioctl-ioctl_storage_set_hotplug_info">IOCTL_STORAGE_SET_HOTPLUG_INFO</a> 
 *     operation only sets the value of the <b>DeviceHotplug</b> member of this structure. If the 
 *     value of that member is set, the removal policy of the specified device is set to 
 *     <b>ExpectSurpriseRemoval</b> and all levels of caching are disabled. If the value of that 
 *     member is not set, the removal policy of the specified device is set 
 *     to <b>ExpectOrderlyRemoval</b>, and caching may be selectively enabled.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-storage_hotplug_info
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct STORAGE_HOTPLUG_INFO {
    #StructPack 4

    /**
     * The size of this structure, in bytes. The caller must set this member to 
     *       <c>sizeof(STORAGE_HOTPLUG_INFO)</c>.
     */
    Size : UInt32

    /**
     * If this member is set to a nonzero value, the device media is removable. Otherwise, the device media is not 
     *       removable.
     */
    MediaRemovable : BOOLEAN

    /**
     * If this member is set to a nonzero value, the media is not lockable. Otherwise, the device media is 
     *       lockable.
     */
    MediaHotplug : BOOLEAN

    /**
     * If this member is set to a nonzero value, the device is a hotplug device. Otherwise, the device is not a 
     *       hotplug device.
     */
    DeviceHotplug : BOOLEAN

    /**
     * Reserved; set the value to <b>NULL</b>.
     */
    WriteCacheEnableOverride : BOOLEAN

}
