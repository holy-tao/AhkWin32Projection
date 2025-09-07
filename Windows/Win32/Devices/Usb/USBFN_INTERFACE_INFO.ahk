#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.Usb
 * @version v4.0.30319
 */
class USBFN_INTERFACE_INFO extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * @type {Integer}
     */
    InterfaceNumber {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Speed {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }

    /**
     * @type {Array<Byte>}
     */
    InterfaceDescriptorSet{
        get {
            if(!this.HasProp("__InterfaceDescriptorSetProxyArray"))
                this.__InterfaceDescriptorSetProxyArray := Win32FixedArray(this.ptr + 10, 1, Primitive, "char")
            return this.__InterfaceDescriptorSetProxyArray
        }
    }
}
