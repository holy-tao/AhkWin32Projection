#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.Usb
 * @version v4.0.30319
 */
class USB_HUB_DESCRIPTOR extends Win32Struct
{
    static sizeof => 71

    static packingSize => 1

    /**
     * @type {Integer}
     */
    bDescriptorLength {
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
    bNumberOfPorts {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }

    /**
     * @type {Integer}
     */
    wHubCharacteristics {
        get => NumGet(this, 3, "ushort")
        set => NumPut("ushort", value, this, 3)
    }

    /**
     * @type {Integer}
     */
    bPowerOnToPowerGood {
        get => NumGet(this, 5, "char")
        set => NumPut("char", value, this, 5)
    }

    /**
     * @type {Integer}
     */
    bHubControlCurrent {
        get => NumGet(this, 6, "char")
        set => NumPut("char", value, this, 6)
    }

    /**
     * @type {Array<Byte>}
     */
    bRemoveAndPowerMask{
        get {
            if(!this.HasProp("__bRemoveAndPowerMaskProxyArray"))
                this.__bRemoveAndPowerMaskProxyArray := Win32FixedArray(this.ptr + 7, 64, Primitive, "char")
            return this.__bRemoveAndPowerMaskProxyArray
        }
    }
}
