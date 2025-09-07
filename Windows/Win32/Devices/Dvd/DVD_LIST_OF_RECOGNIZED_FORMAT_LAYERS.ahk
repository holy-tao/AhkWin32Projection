#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.Dvd
 * @version v4.0.30319
 */
class DVD_LIST_OF_RECOGNIZED_FORMAT_LAYERS extends Win32Struct
{
    static sizeof => 2

    static packingSize => 1

    /**
     * @type {Array<Byte>}
     */
    TypeCodeOfFormatLayer{
        get {
            if(!this.HasProp("__TypeCodeOfFormatLayerProxyArray"))
                this.__TypeCodeOfFormatLayerProxyArray := Win32FixedArray(this.ptr + 0, 1, Primitive, "char")
            return this.__TypeCodeOfFormatLayerProxyArray
        }
    }
}
