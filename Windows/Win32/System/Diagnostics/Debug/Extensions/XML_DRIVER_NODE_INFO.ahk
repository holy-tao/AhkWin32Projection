#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
class XML_DRIVER_NODE_INFO extends Win32Struct {
    static sizeof => 1184

    static packingSize => 8

    /**
     * @type {String}
     */
    FileName {
        get => StrGet(this.ptr + 0, 63, "UTF-8")
        set => StrPut(value, this.ptr + 0, 63, "UTF-8")
    }

    /**
     * @type {Integer}
     */
    FileSize {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * @type {Integer}
     */
    CreationDate {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * @type {String}
     */
    Version {
        get => StrGet(this.ptr + 80, 63, "UTF-8")
        set => StrPut(value, this.ptr + 80, 63, "UTF-8")
    }

    /**
     * @type {String}
     */
    Manufacturer {
        get => StrGet(this.ptr + 144, 259, "UTF-8")
        set => StrPut(value, this.ptr + 144, 259, "UTF-8")
    }

    /**
     * @type {String}
     */
    ProductName {
        get => StrGet(this.ptr + 404, 259, "UTF-8")
        set => StrPut(value, this.ptr + 404, 259, "UTF-8")
    }

    /**
     * @type {String}
     */
    Group {
        get => StrGet(this.ptr + 664, 259, "UTF-8")
        set => StrPut(value, this.ptr + 664, 259, "UTF-8")
    }

    /**
     * @type {String}
     */
    Altitude {
        get => StrGet(this.ptr + 924, 259, "UTF-8")
        set => StrPut(value, this.ptr + 924, 259, "UTF-8")
    }
}
