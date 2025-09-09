#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.Usb
 * @version v4.0.30319
 */
class USB_DEVICE_CAPABILITY_CONTAINER_ID_DESCRIPTOR extends Win32Struct
{
    static sizeof => 20

    static packingSize => 1

    /**
     * @type {Integer}
     */
    bLength {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    bDescriptorType {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * @type {Integer}
     */
    bDevCapabilityType {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }

    /**
     * @type {Integer}
     */
    bReserved {
        get => NumGet(this, 3, "char")
        set => NumPut("char", value, this, 3)
    }

    /**
     * @type {Array<Byte>}
     */
    ContainerID{
        get {
            if(!this.HasProp("__ContainerIDProxyArray"))
                this.__ContainerIDProxyArray := Win32FixedArray(this.ptr + 4, 16, Primitive, "char")
            return this.__ContainerIDProxyArray
        }
    }
}
