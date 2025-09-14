#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Iis
 * @version v4.0.30319
 */
class HSE_URL_MAPEX_INFO extends Win32Struct
{
    static sizeof => 280

    static packingSize => 4

    /**
     * @type {Array<SByte>}
     */
    lpszPath{
        get {
            if(!this.HasProp("__lpszPathProxyArray"))
                this.__lpszPathProxyArray := Win32FixedArray(this.ptr + 0, 260, Primitive, "char")
            return this.__lpszPathProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 260, "uint")
        set => NumPut("uint", value, this, 260)
    }

    /**
     * @type {Integer}
     */
    cchMatchingPath {
        get => NumGet(this, 264, "uint")
        set => NumPut("uint", value, this, 264)
    }

    /**
     * @type {Integer}
     */
    cchMatchingURL {
        get => NumGet(this, 268, "uint")
        set => NumPut("uint", value, this, 268)
    }

    /**
     * @type {Integer}
     */
    dwReserved1 {
        get => NumGet(this, 272, "uint")
        set => NumPut("uint", value, this, 272)
    }

    /**
     * @type {Integer}
     */
    dwReserved2 {
        get => NumGet(this, 276, "uint")
        set => NumPut("uint", value, this, 276)
    }
}
