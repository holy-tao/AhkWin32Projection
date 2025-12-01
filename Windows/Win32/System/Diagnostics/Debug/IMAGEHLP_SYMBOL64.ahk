#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Contains symbol information. (IMAGEHLP_SYMBOL64)
 * @remarks
 * This structure supersedes the <b>IMAGEHLP_SYMBOL</b> structure. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/Debug/updated-platform-support">Updated Platform Support</a>. <b>IMAGEHLP_SYMBOL</b> is defined as follows in DbgHelp.h. 
 * 
 * 
 * ```cpp
 * @see https://learn.microsoft.com/windows/win32/api/dbghelp/ns-dbghelp-imagehlp_symbol64
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class IMAGEHLP_SYMBOL64 extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The size of the structure, in bytes. The caller must set this member to <c>sizeof(IMAGEHLP_SYMBOL64)</c>.
     * @type {Integer}
     */
    SizeOfStruct {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The virtual address for the symbol.
     * @type {Integer}
     */
    Address {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The size of the symbol, in bytes. This value is a best guess and can be zero.
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * This member is reserved for use by the operating system.
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * The maximum length of the string that the <b>Name</b> member can contain, in characters, not including the null-terminating character. Because symbol names can vary in length, this data structure is allocated by the caller. This member is used so the library knows how much memory is available for use by the symbol name.
     * @type {Integer}
     */
    MaxNameLength {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * The decorated or undecorated symbol name. If the buffer is not large enough for the complete name, it is truncated to <b>MaxNameLength</b> characters, including the null-terminating character.
     * @type {String}
     */
    Name {
        get => StrGet(this.ptr + 28, 0, "UTF-16")
        set => StrPut(value, this.ptr + 28, 0, "UTF-16")
    }
}
