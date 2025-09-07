#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\PSTR.ahk

/**
 * Represents a source file line. (IMAGEHLP_LINE)
 * @remarks
 * This structure supersedes the <b>IMAGEHLP_LINE</b> structure. For more information, see 
  * <a href="https://docs.microsoft.com/windows/desktop/Debug/updated-platform-support">Updated Platform Support</a>. <b>IMAGEHLP_LINE</b> is defined as follows in DbgHelp.h. 
  * 
  * 
  * ```cpp
 * @see https://learn.microsoft.com/windows/win32/api/dbghelp/ns-dbghelp-imagehlp_line
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 * @charset ANSI
 */
class IMAGEHLP_LINE extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * The size of the structure, in bytes. The caller must set this member to <c>sizeof(IMAGEHLP_LINE64)</c>.
     * @type {Integer}
     */
    SizeOfStruct {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * This member is reserved for use by the operating system.
     * @type {Pointer<Void>}
     */
    Key {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The line number in the file.
     * @type {Integer}
     */
    LineNumber {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The name of the file, including the full path.
     * @type {PSTR}
     */
    FileName{
        get {
            if(!this.HasProp("__FileName"))
                this.__FileName := PSTR(this.ptr + 24)
            return this.__FileName
        }
    }

    /**
     * The address of the first instruction in the line.
     * @type {Integer}
     */
    Address {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }
}
