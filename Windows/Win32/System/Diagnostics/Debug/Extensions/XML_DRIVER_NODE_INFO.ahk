#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class XML_DRIVER_NODE_INFO extends Win32Struct
{
    static sizeof => 2352

    static packingSize => 8

    /**
     * @type {String}
     */
    FileName {
        get => StrGet(this.ptr + 0, 63, "UTF-16")
        set => StrPut(value, this.ptr + 0, 63, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    FileSize {
        get => NumGet(this, 128, "uint")
        set => NumPut("uint", value, this, 128)
    }

    /**
     * @type {Integer}
     */
    CreationDate {
        get => NumGet(this, 136, "uint")
        set => NumPut("uint", value, this, 136)
    }

    /**
     * @type {String}
     */
    Version {
        get => StrGet(this.ptr + 144, 63, "UTF-16")
        set => StrPut(value, this.ptr + 144, 63, "UTF-16")
    }

    /**
     * @type {String}
     */
    Manufacturer {
        get => StrGet(this.ptr + 272, 259, "UTF-16")
        set => StrPut(value, this.ptr + 272, 259, "UTF-16")
    }

    /**
     * @type {String}
     */
    ProductName {
        get => StrGet(this.ptr + 792, 259, "UTF-16")
        set => StrPut(value, this.ptr + 792, 259, "UTF-16")
    }

    /**
     * @type {String}
     */
    Group {
        get => StrGet(this.ptr + 1312, 259, "UTF-16")
        set => StrPut(value, this.ptr + 1312, 259, "UTF-16")
    }

    /**
     * @type {String}
     */
    Altitude {
        get => StrGet(this.ptr + 1832, 259, "UTF-16")
        set => StrPut(value, this.ptr + 1832, 259, "UTF-16")
    }
}
