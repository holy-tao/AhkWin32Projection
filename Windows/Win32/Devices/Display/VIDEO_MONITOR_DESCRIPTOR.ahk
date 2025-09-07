#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class VIDEO_MONITOR_DESCRIPTOR extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {Integer}
     */
    DescriptorSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Array<Byte>}
     */
    Descriptor{
        get {
            if(!this.HasProp("__DescriptorProxyArray"))
                this.__DescriptorProxyArray := Win32FixedArray(this.ptr + 4, 1, Primitive, "char")
            return this.__DescriptorProxyArray
        }
    }
}
