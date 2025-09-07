#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Contains module data.
 * @see https://learn.microsoft.com/windows/win32/api/dbghelp/ns-dbghelp-modload_data
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class MODLOAD_DATA extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The size of this structure, in bytes.
     * @type {Integer}
     */
    ssize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * 
     * @type {Integer}
     */
    ssig {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The data. The format of this data depends on the value of the <b>ssig</b> member.
     * @type {Pointer<Void>}
     */
    data {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The size of the <b>data</b> buffer, in bytes.
     * @type {Integer}
     */
    size {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * This member is unused.
     * @type {Integer}
     */
    flags {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }
}
