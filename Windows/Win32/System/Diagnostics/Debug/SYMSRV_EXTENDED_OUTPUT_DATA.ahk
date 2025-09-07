#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class SYMSRV_EXTENDED_OUTPUT_DATA extends Win32Struct
{
    static sizeof => 532

    static packingSize => 4

    /**
     * @type {Integer}
     */
    sizeOfStruct {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    version {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {String}
     */
    filePtrMsg {
        get => StrGet(this.ptr + 8, 260, "UTF-16")
        set => StrPut(value, this.ptr + 8, 260, "UTF-16")
    }
}
