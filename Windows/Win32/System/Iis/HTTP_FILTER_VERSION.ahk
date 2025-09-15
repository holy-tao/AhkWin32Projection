#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Iis
 * @version v4.0.30319
 */
class HTTP_FILTER_VERSION extends Win32Struct
{
    static sizeof => 528

    static packingSize => 4

    /**
     * @type {Integer}
     */
    dwServerFilterVersion {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    dwFilterVersion {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {String}
     */
    lpszFilterDesc {
        get => StrGet(this.ptr + 8, 256, "UTF-16")
        set => StrPut(value, this.ptr + 8, 256, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 524, "uint")
        set => NumPut("uint", value, this, 524)
    }
}
