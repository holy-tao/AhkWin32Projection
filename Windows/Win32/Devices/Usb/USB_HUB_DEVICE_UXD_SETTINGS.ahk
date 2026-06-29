#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.Devices.Usb
 */
class USB_HUB_DEVICE_UXD_SETTINGS extends Win32Struct {
    static sizeof => 68

    static packingSize => 4

    /**
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Guid}
     */
    PnpGuid {
        get {
            if(!this.HasProp("__PnpGuid"))
                this.__PnpGuid := Guid(4, this)
            return this.__PnpGuid
        }
    }

    /**
     * @type {Guid}
     */
    OwnerGuid {
        get {
            if(!this.HasProp("__OwnerGuid"))
                this.__OwnerGuid := Guid(20, this)
            return this.__OwnerGuid
        }
    }

    /**
     * @type {Integer}
     */
    DeleteOnShutdown {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * @type {Integer}
     */
    DeleteOnReload {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    DeleteOnDisconnect {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * @type {Array<Integer>}
     */
    Reserved {
        get {
            if(!this.HasProp("__ReservedProxyArray"))
                this.__ReservedProxyArray := Win32FixedArray(this.ptr + 48, 5, Primitive, "uint")
            return this.__ReservedProxyArray
        }
    }
}
