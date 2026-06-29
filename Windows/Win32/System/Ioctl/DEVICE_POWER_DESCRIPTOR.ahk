#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * The DEVICE_POWER_DESCRIPTOR structure describes the power capabilities of a storage device.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-device_power_descriptor
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct DEVICE_POWER_DESCRIPTOR {
    #StructPack 4

    /**
     * Contains the size of this structure, in bytes. The value of this member will change as members are added to 
     *       the structure.
     */
    Version : UInt32

    /**
     * Specifies the total size of the data returned, in bytes. This may include data that follows this 
     *       structure.
     */
    Size : UInt32

    /**
     * True if device attention is supported. Otherwise, false.
     */
    DeviceAttentionSupported : BOOLEAN

    /**
     * True if the device supports asynchronous notifications, delivered via 
     *       <b>IOCTL_STORAGE_EVENT_NOTIFICATION</b>. Otherwise, false.
     */
    AsynchronousNotificationSupported : BOOLEAN

    /**
     * True if the device has been registered for runtime idle power management. Otherwise, false.
     */
    IdlePowerManagementEnabled : BOOLEAN

    /**
     * True if the device will be powered off when put into D3 power state. Otherwise, false.
     */
    D3ColdEnabled : BOOLEAN

    /**
     * True if the platform supports <b>D3ColdEnabled</b> for this device. Otherwise, 
     *       false.
     */
    D3ColdSupported : BOOLEAN

    NoVerifyDuringIdlePower : BOOLEAN

    /**
     * Reserved.
     */
    Reserved : Int8[2]

    /**
     * The idle timeout value in milliseconds. This member is ignored unless 
     *       <b>IdlePowerManagementEnabled</b> is true.
     */
    IdleTimeoutInMS : UInt32

}
