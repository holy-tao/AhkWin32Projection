#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

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
 */
export default struct Win32STRING {
    #StructPack 8

    /**
     * The length in bytes of the string stored in the buffer pointed to by <b>Buffer</b>.
     */
    Length : UInt16

    /**
     * The length in bytes of the buffer pointed to by <b>Buffer</b>.
     */
    MaximumLength : UInt16

    /**
     * Pointer to a buffer used to contain a string of characters.
     */
    Buffer : PSTR

}
