#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies a keyword to search for and the keyword table to be searched by Windows Help. (ANSI)
 * @remarks
 * > [!NOTE]
  * > The winuser.h header defines MULTIKEYHELP as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-multikeyhelpa
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 * @charset ANSI
 */
class MULTIKEYHELPA extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Type: <b>DWORD</b>
     * 
     * The structure size, in bytes.
     * @type {Integer}
     */
    mkSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>TCHAR</b>
     * 
     * A single character that identifies the keyword table to search.
     * @type {Integer}
     */
    mkKeylist {
        get => NumGet(this, 4, "char")
        set => NumPut("char", value, this, 4)
    }

    /**
     * Type: <b>TCHAR[1]</b>
     * 
     * A null-terminated text string that specifies the keyword to locate in the keyword table.
     * @type {String}
     */
    szKeyphrase {
        get => StrGet(this.ptr + 5, 0, "UTF-8")
        set => StrPut(value, this.ptr + 5, 0, "UTF-8")
    }
}
