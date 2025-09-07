#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * An array of Unicode characters and a length.
 * @remarks
 * The string is not required to be zero terminated.  If it is
  *                 zero terminated, then the terminating character is not included
  *                 in the length.
  *             
  * 
  * The macro <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-ws_string_value">WS_STRING_VALUE</a> can be used to initialize
  *                 this structure if the string is a constant string.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_string
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_STRING extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The number of characters in the string.
     * @type {Integer}
     */
    length {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The array of characters that make up the string.
     * @type {PWSTR}
     */
    chars{
        get {
            if(!this.HasProp("__chars"))
                this.__chars := PWSTR(this.ptr + 8)
            return this.__chars
        }
    }
}
