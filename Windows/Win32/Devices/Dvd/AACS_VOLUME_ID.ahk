#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.Dvd
 * @version v4.0.30319
 */
class AACS_VOLUME_ID extends Win32Struct
{
    static sizeof => 32

    static packingSize => 1

    /**
     * @type {Array<Byte>}
     */
    VolumeID{
        get {
            if(!this.HasProp("__VolumeIDProxyArray"))
                this.__VolumeIDProxyArray := Win32FixedArray(this.ptr + 0, 16, Primitive, "char")
            return this.__VolumeIDProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    MAC{
        get {
            if(!this.HasProp("__MACProxyArray"))
                this.__MACProxyArray := Win32FixedArray(this.ptr + 16, 16, Primitive, "char")
            return this.__MACProxyArray
        }
    }
}
