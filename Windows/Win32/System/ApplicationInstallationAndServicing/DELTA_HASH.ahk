#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 */
class DELTA_HASH extends Win32Struct
{
    static sizeof => 36

    static packingSize => 4

    /**
     * @type {Integer}
     */
    HashSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Array<Byte>}
     */
    HashValue{
        get {
            if(!this.HasProp("__HashValueProxyArray"))
                this.__HashValueProxyArray := Win32FixedArray(this.ptr + 4, 1, Primitive, "char")
            return this.__HashValueProxyArray
        }
    }
}
