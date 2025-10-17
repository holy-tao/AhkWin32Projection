#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DEVICE_POWER_DESCRIPTOR structure describes the power capabilities of a storage device.
 * @see https://docs.microsoft.com/windows/win32/api//winioctl/ns-winioctl-device_power_descriptor
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class DEVICE_POWER_DESCRIPTOR extends Win32Struct
{
    static sizeof => 20

    static packingSize => 4

    /**
     * Contains the size of this structure, in bytes. The value of this member will change as members are added to 
     *       the structure.
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies the total size of the data returned, in bytes. This may include data that follows this 
     *       structure.
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * True if device attention is supported. Otherwise, false.
     * @type {BOOLEAN}
     */
    DeviceAttentionSupported {
        get => NumGet(this, 8, "char")
        set => NumPut("char", value, this, 8)
    }

    /**
     * True if the device supports asynchronous notifications, delivered via 
     *       <b>IOCTL_STORAGE_EVENT_NOTIFICATION</b>. Otherwise, false.
     * @type {BOOLEAN}
     */
    AsynchronousNotificationSupported {
        get => NumGet(this, 9, "char")
        set => NumPut("char", value, this, 9)
    }

    /**
     * True if the device has been registered for runtime idle power management. Otherwise, false.
     * @type {BOOLEAN}
     */
    IdlePowerManagementEnabled {
        get => NumGet(this, 10, "char")
        set => NumPut("char", value, this, 10)
    }

    /**
     * True if the device will be powered off when put into D3 power state. Otherwise, false.
     * @type {BOOLEAN}
     */
    D3ColdEnabled {
        get => NumGet(this, 11, "char")
        set => NumPut("char", value, this, 11)
    }

    /**
     * True if the platform supports <b>D3ColdEnabled</b> for this device. Otherwise, 
     *       false.
     * @type {BOOLEAN}
     */
    D3ColdSupported {
        get => NumGet(this, 12, "char")
        set => NumPut("char", value, this, 12)
    }

    /**
     * 
     * @type {BOOLEAN}
     */
    NoVerifyDuringIdlePower {
        get => NumGet(this, 13, "char")
        set => NumPut("char", value, this, 13)
    }

    /**
     * Reserved.
     * @type {Array<Byte>}
     */
    Reserved{
        get {
            if(!this.HasProp("__ReservedProxyArray"))
                this.__ReservedProxyArray := Win32FixedArray(this.ptr + 14, 2, Primitive, "char")
            return this.__ReservedProxyArray
        }
    }

    /**
     * The idle timeout value in milliseconds. This member is ignored unless 
     *       <b>IdlePowerManagementEnabled</b> is true.
     * @type {Integer}
     */
    IdleTimeoutInMS {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
