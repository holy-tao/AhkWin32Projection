#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Contains line information.
 * @see https://docs.microsoft.com/windows/win32/api//dbghelp/ns-dbghelp-srccodeinfo
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 * @charset ANSI
 */
class SRCCODEINFO extends Win32Struct
{
    static sizeof => 560

    static packingSize => 8

    /**
     * The size of the structure, in bytes.
     * @type {Integer}
     */
    SizeOfStruct {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * This member is not used.
     * @type {Pointer<Void>}
     */
    Key {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The base address of the module that contains the line.
     * @type {Integer}
     */
    ModBase {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The name of the object file within the module that contains the line.
     * @type {String}
     */
    Obj {
        get => StrGet(this.ptr + 24, 260, "UTF-8")
        set => StrPut(value, this.ptr + 24, 260, "UTF-8")
    }

    /**
     * The fully qualified source file name.
     * @type {String}
     */
    FileName {
        get => StrGet(this.ptr + 285, 260, "UTF-8")
        set => StrPut(value, this.ptr + 285, 260, "UTF-8")
    }

    /**
     * The line number within the source file.
     * @type {Integer}
     */
    LineNumber {
        get => NumGet(this, 548, "uint")
        set => NumPut("uint", value, this, 548)
    }

    /**
     * The virtual address of the first instruction of the line.
     * @type {Integer}
     */
    Address {
        get => NumGet(this, 552, "uint")
        set => NumPut("uint", value, this, 552)
    }
}
