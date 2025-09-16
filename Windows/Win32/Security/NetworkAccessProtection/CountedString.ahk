#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines a null-terminated string with a defined length.
 * @see https://learn.microsoft.com/windows/win32/api/naptypes/ns-naptypes-countedstring
 * @namespace Windows.Win32.Security.NetworkAccessProtection
 * @version v4.0.30319
 */
class CountedString extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The size, in characters, of the string within the range 0 to <a href="https://docs.microsoft.com/windows/desktop/NAP/nap-type-constants">maxStringLength</a>.
     * 
     * <div class="alert"><b>Note</b>  <b>length</b> does not include the null terminator.</div>
     * <div> </div>
     * @type {Integer}
     */
    length {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * A pointer to a null-terminated wide character string of size <b>length</b> + 1.
     * @type {Pointer<PWSTR>}
     */
    string {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
