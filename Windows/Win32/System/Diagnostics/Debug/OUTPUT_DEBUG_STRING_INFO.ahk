#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Contains the address, format, and length, in bytes, of a debugging string.
 * @see https://learn.microsoft.com/windows/win32/api/minwinbase/ns-minwinbase-output_debug_string_info
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class OUTPUT_DEBUG_STRING_INFO extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The debugging string in the calling process's address space. The debugger can use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-readprocessmemory">ReadProcessMemory</a> function to retrieve the value of the string.
     * @type {Pointer<Ptr>}
     */
    lpDebugStringData {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The format of the debugging string. If this member is zero, the debugging string is ANSI; if it is nonzero, the string is Unicode.
     * @type {Integer}
     */
    fUnicode {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }

    /**
     * The lower 16 bits of the length of the string in bytes. As nDebugStringLength is of type WORD, this does not always contain the full length of the string in bytes.
     * 
     * For example, if the original output string is longer than 65536 bytes, this field will contain a value that is less than the actual string length in bytes.
     * @type {Integer}
     */
    nDebugStringLength {
        get => NumGet(this, 10, "ushort")
        set => NumPut("ushort", value, this, 10)
    }
}
