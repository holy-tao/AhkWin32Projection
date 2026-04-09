#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Iis
 */
class HSE_URL_MAPEX_INFO extends Win32Struct {
    static sizeof => 280

    static packingSize => 4

    /**
     * @type {String}
     */
    lpszPath {
        get => StrGet(this.ptr + 0, 259, "UTF-8")
        set => StrPut(value, this.ptr + 0, 259, "UTF-8")
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
