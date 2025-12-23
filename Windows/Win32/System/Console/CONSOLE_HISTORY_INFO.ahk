#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * See reference information about the CONSOLE_HISTORY_INFO structure, which contains information about the console history.
 * @see https://learn.microsoft.com/windows/console/console-history-info
 * @namespace Windows.Win32.System.Console
 * @version v4.0.30319
 */
class CONSOLE_HISTORY_INFO extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * The size of the structure, in bytes. Set this member to `sizeof(CONSOLE_HISTORY_INFO)`.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The number of commands kept in each history buffer.
     * @type {Integer}
     */
    HistoryBufferSize {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The number of history buffers kept for this console process.
     * @type {Integer}
     */
    NumberOfHistoryBuffers {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * This parameter can be zero or the following value.
     * 
     * | Value | Meaning |
     * |-|-|
     * | **HISTORY_NO_DUP_FLAG** 0x1 | Duplicate entries will not be stored in the history buffer.
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 16
    }
}
