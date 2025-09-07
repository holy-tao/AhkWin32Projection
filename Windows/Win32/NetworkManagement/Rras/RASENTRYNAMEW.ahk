#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 * @charset Unicode
 */
class RASENTRYNAMEW extends Win32Struct
{
    static sizeof => 1048

    static packingSize => 4

    /**
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {String}
     */
    szEntryName {
        get => StrGet(this.ptr + 4, 256, "UTF-16")
        set => StrPut(value, this.ptr + 4, 256, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 520, "uint")
        set => NumPut("uint", value, this, 520)
    }

    /**
     * @type {String}
     */
    szPhonebookPath {
        get => StrGet(this.ptr + 524, 260, "UTF-16")
        set => StrPut(value, this.ptr + 524, 260, "UTF-16")
    }
}
