#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class SPRECOCONTEXTSTATUS extends Win32Struct
{
    static sizeof => 524

    static packingSize => 4

    /**
     * @type {Integer}
     */
    eInterference {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {String}
     */
    szRequestTypeOfUI {
        get => StrGet(this.ptr + 4, 254, "UTF-16")
        set => StrPut(value, this.ptr + 4, 254, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    dwReserved1 {
        get => NumGet(this, 516, "uint")
        set => NumPut("uint", value, this, 516)
    }

    /**
     * @type {Integer}
     */
    dwReserved2 {
        get => NumGet(this, 520, "uint")
        set => NumPut("uint", value, this, 520)
    }
}
