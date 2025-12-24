#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DVD_LAYER_DESCRIPTOR.ahk

/**
 * @namespace Windows.Win32.Devices.Dvd
 * @version v4.0.30319
 */
class DVD_FULL_LAYER_DESCRIPTOR extends Win32Struct
{
    static sizeof => 2052

    static packingSize => 4

    /**
     * @type {DVD_LAYER_DESCRIPTOR}
     */
    commonHeader{
        get {
            if(!this.HasProp("__commonHeader"))
                this.__commonHeader := DVD_LAYER_DESCRIPTOR(0, this)
            return this.__commonHeader
        }
    }

    /**
     * @type {Array<Byte>}
     */
    MediaSpecific{
        get {
            if(!this.HasProp("__MediaSpecificProxyArray"))
                this.__MediaSpecificProxyArray := Win32FixedArray(this.ptr + 20, 2031, Primitive, "char")
            return this.__MediaSpecificProxyArray
        }
    }
}
