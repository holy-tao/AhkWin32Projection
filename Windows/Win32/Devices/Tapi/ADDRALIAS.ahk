#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.Tapi
 */
class ADDRALIAS extends Win32Struct {
    static sizeof => 76

    static packingSize => 4

    /**
     * @type {String}
     */
    rgchName {
        get => StrGet(this.ptr + 0, 40, "UTF-8")
        set => StrPut(value, this.ptr + 0, 40, "UTF-8")
    }

    /**
     * @type {String}
     */
    rgchEName {
        get => StrGet(this.ptr + 42, 10, "UTF-8")
        set => StrPut(value, this.ptr + 42, 10, "UTF-8")
    }

    /**
     * @type {String}
     */
    rgchSrvr {
        get => StrGet(this.ptr + 54, 11, "UTF-8")
        set => StrPut(value, this.ptr + 54, 11, "UTF-8")
    }

    /**
     * @type {Integer}
     */
    dibDetail {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }

    /**
     * @type {Integer}
     */
    type {
        get => NumGet(this, 72, "ushort")
        set => NumPut("ushort", value, this, 72)
    }
}
