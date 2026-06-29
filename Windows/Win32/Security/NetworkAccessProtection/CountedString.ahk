#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Defines a null-terminated string with a defined length.
 * @see https://learn.microsoft.com/windows/win32/api/naptypes/ns-naptypes-countedstring
 * @namespace Windows.Win32.Security.NetworkAccessProtection
 */
export default struct CountedString {
    #StructPack 8

    /**
     * The size, in characters, of the string within the range 0 to <a href="https://docs.microsoft.com/windows/desktop/NAP/nap-type-constants">maxStringLength</a>.
     * 
     * <div class="alert"><b>Note</b>  <b>length</b> does not include the null terminator.</div>
     * <div> </div>
     */
    length : UInt16

    /**
     * A pointer to a null-terminated wide character string of size <b>length</b> + 1.
     */
    string : PWSTR

}
