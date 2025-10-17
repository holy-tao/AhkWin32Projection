#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\CHARRANGE.ahk

/**
 * Contains information about a search operation in a rich edit control. This structure is used with the EM_FINDTEXT message.
 * @remarks
 * 
  * > [!NOTE]
  * > The richedit.h header defines FINDTEXT as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
  * 
 * @see https://docs.microsoft.com/windows/win32/api//richedit/ns-richedit-findtexta
 * @namespace Windows.Win32.UI.Controls.RichEdit
 * @version v4.0.30319
 * @charset ANSI
 */
class FINDTEXTA extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/richedit/ns-richedit-charrange">CHARRANGE</a></b>
     * 
     * The range of characters to search.
     * @type {CHARRANGE}
     */
    chrg{
        get {
            if(!this.HasProp("__chrg"))
                this.__chrg := CHARRANGE(0, this)
            return this.__chrg
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCTSTR</a></b>
     * 
     * The null-terminated string used in the find operation.
     * @type {PSTR}
     */
    lpstrText {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
