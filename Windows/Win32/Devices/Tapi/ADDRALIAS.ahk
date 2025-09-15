#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ADDRALIAS extends Win32Struct
{
    static sizeof => 136

    static packingSize => 4

    /**
     * @type {String}
     */
    rgchName {
        get => StrGet(this.ptr + 0, 40, "UTF-16")
        set => StrPut(value, this.ptr + 0, 40, "UTF-16")
    }

    /**
     * @type {String}
     */
    rgchEName {
        get => StrGet(this.ptr + 82, 10, "UTF-16")
        set => StrPut(value, this.ptr + 82, 10, "UTF-16")
    }

    /**
     * @type {String}
     */
    rgchSrvr {
        get => StrGet(this.ptr + 104, 11, "UTF-16")
        set => StrPut(value, this.ptr + 104, 11, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    dibDetail {
        get => NumGet(this, 128, "uint")
        set => NumPut("uint", value, this, 128)
    }

    /**
     * @type {Integer}
     */
    type {
        get => NumGet(this, 132, "ushort")
        set => NumPut("ushort", value, this, 132)
    }
}
