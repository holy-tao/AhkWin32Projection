#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PSTR.ahk

/**
 * The ANSI_STRING structure defines a counted string used for ANSI strings.
 * @remarks
 * The <b>ANSI_STRING</b> structure is used to pass ANSI strings. Use the <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/wdm/nf-wdm-rtlinitansistring">RtlInitAnsiString</a> routine to initialize an <b>ANSI_STRING</b>.
  * 
  * If the string is null-terminated, <b>Length</b> does not include the terminating <b>NULL</b>.
  * 
  * The <b>MaximumLength</b> is used to indicate the length of <b>Buffer</b> so that if the string is passed to a conversion routine such as <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/wdm/nf-wdm-rtlunicodestringtoansistring">RtlUnicodeStringToAnsiString</a> the returned string does not exceed the buffer size.
 * @see https://learn.microsoft.com/windows/win32/api/ntdef/ns-ntdef-string
 * @namespace Windows.Win32.System.Kernel
 * @version v4.0.30319
 */
class STRING extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The length in bytes of the string stored in the buffer pointed to by <b>Buffer</b>.
     * @type {Integer}
     */
    Length {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * The length in bytes of the buffer pointed to by <b>Buffer</b>.
     * @type {Integer}
     */
    MaximumLength {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * Pointer to a buffer used to contain a string of characters.
     * @type {PSTR}
     */
    Buffer{
        get {
            if(!this.HasProp("__Buffer"))
                this.__Buffer := PSTR(this.ptr + 8)
            return this.__Buffer
        }
    }
}
