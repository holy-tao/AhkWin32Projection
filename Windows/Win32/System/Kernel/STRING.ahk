#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Used with the RtlUnicodeStringToOemString function.
 * @remarks
 * 
 * The data type used in the <b>DestinationString</b> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/winternl/nf-winternl-rtlunicodestringtooemstring">RtlUnicodeStringToOemString</a> function, <c> POEM_STRING</c>, is defined as:
 * 		
 *                 
 * 
 * <c>typedef PSTRING POEM_STRING;</c>
 * 
 * @see https://docs.microsoft.com/windows/win32/api//winternl/ns-winternl-string
 * @namespace Windows.Win32.System.Kernel
 * @version v4.0.30319
 */
class Win32STRING extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The length of the buffer.
     * @type {Integer}
     */
    Length {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * The maximum length of the buffer.
     * @type {Integer}
     */
    MaximumLength {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * The address of the buffer.
     * @type {PSTR}
     */
    Buffer {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
