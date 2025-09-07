#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.Usb
 * @version v4.0.30319
 */
class USB_HUB_DEVICE_UXD_SETTINGS extends Win32Struct
{
    static sizeof => 52

    static packingSize => 1

    /**
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Pointer<Guid>}
     */
    PnpGuid {
        get => NumGet(this, 4, "ptr")
        set => NumPut("ptr", value, this, 4)
    }

    /**
     * @type {Pointer<Guid>}
     */
    OwnerGuid {
        get => NumGet(this, 12, "ptr")
        set => NumPut("ptr", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    DeleteOnShutdown {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    DeleteOnReload {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    DeleteOnDisconnect {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * @type {Array<UInt32>}
     */
    Reserved{
        get {
            if(!this.HasProp("__ReservedProxyArray"))
                this.__ReservedProxyArray := Win32FixedArray(this.ptr + 32, 4, Primitive, "uint")
            return this.__ReservedProxyArray
        }
    }
}
