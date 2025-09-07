#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 */
class PROTECTED_FILE_DATA extends Win32Struct
{
    static sizeof => 524

    static packingSize => 4

    /**
     * @type {String}
     */
    FileName {
        get => StrGet(this.ptr + 0, 259, "UTF-16")
        set => StrPut(value, this.ptr + 0, 259, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    FileNumber {
        get => NumGet(this, 520, "uint")
        set => NumPut("uint", value, this, 520)
    }
}
