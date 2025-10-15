#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\PWSTR.ahk
#Include .\STRRET.ahk

/**
 * Reports detailed information on an item in a Shell folder.
 * @see https://docs.microsoft.com/windows/win32/api//shtypes/ns-shtypes-shelldetails
 * @namespace Windows.Win32.UI.Shell.Common
 * @version v4.0.30319
 */
class SHELLDETAILS extends Win32Struct
{
    static sizeof => 280

    static packingSize => 8

    /**
     * Type: <b>int</b>
     * @type {Integer}
     */
    fmt {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Type: <b>int</b>
     * 
     * The number of average-sized characters in the header.
     * @type {Integer}
     */
    cxChar {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shtypes/ns-shtypes-strret">STRRET</a></b>
     * 
     * An <a href="https://docs.microsoft.com/windows/desktop/api/shtypes/ns-shtypes-strret">STRRET</a> structure that includes a string with the requested information. To convert this structure to a string, use <a href="https://docs.microsoft.com/windows/desktop/api/shlwapi/nf-shlwapi-strrettobufa">StrRetToBuf</a> or <a href="https://docs.microsoft.com/windows/desktop/api/shlwapi/nf-shlwapi-strrettostra">StrRetToStr</a>.
     * @type {STRRET}
     */
    str{
        get {
            if(!this.HasProp("__str"))
                this.__str := STRRET(this.ptr + 8)
            return this.__str
        }
    }
}
