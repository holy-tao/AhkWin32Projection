#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DVD_LAYER_DESCRIPTOR.ahk

/**
 * @namespace Windows.Win32.Devices.Dvd
 * @version v4.0.30319
 */
class DVD_FULL_LAYER_DESCRIPTOR extends Win32Struct
{
    static sizeof => 2048

    static packingSize => 8

    /**
     * @type {DVD_LAYER_DESCRIPTOR}
     */
    commonHeader{
        get {
            if(!this.HasProp("__commonHeader"))
                this.__commonHeader := DVD_LAYER_DESCRIPTOR(this.ptr + 0)
            return this.__commonHeader
        }
    }

    /**
     * @type {Array<Byte>}
     */
    MediaSpecific{
        get {
            if(!this.HasProp("__MediaSpecificProxyArray"))
                this.__MediaSpecificProxyArray := Win32FixedArray(this.ptr + 17, 1, Primitive, "char")
            return this.__MediaSpecificProxyArray
        }
    }
}
