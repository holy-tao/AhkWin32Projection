#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Iis
 * @version v4.0.30319
 */
class HSE_URL_MAPEX_INFO extends Win32Struct
{
    static sizeof => 540

    static packingSize => 4

    /**
     * @type {String}
     */
    lpszPath {
        get => StrGet(this.ptr + 0, 259, "UTF-16")
        set => StrPut(value, this.ptr + 0, 259, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 520, "uint")
        set => NumPut("uint", value, this, 520)
    }

    /**
     * @type {Integer}
     */
    cchMatchingPath {
        get => NumGet(this, 524, "uint")
        set => NumPut("uint", value, this, 524)
    }

    /**
     * @type {Integer}
     */
    cchMatchingURL {
        get => NumGet(this, 528, "uint")
        set => NumPut("uint", value, this, 528)
    }

    /**
     * @type {Integer}
     */
    dwReserved1 {
        get => NumGet(this, 532, "uint")
        set => NumPut("uint", value, this, 532)
    }

    /**
     * @type {Integer}
     */
    dwReserved2 {
        get => NumGet(this, 536, "uint")
        set => NumPut("uint", value, this, 536)
    }
}
