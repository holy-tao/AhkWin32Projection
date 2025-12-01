#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The TF_SELECTIONSTYLE structure represents the style of a selection.
 * @remarks
 * An interim character selection spans exactly one character and is visually represented as a solid rectangle that is usually flashing. This is a standard UI element of Korean and some Chinese character compositions. <b>fInterimChar</b> is an indication that a specific character is composed. <b>fInterimChar</b> can only be nonzero for a single selection. In this case, there will be no caret because the highlight replaces it.
 * @see https://learn.microsoft.com/windows/win32/api/msctf/ns-msctf-tf_selectionstyle
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class TF_SELECTIONSTYLE extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Specifies the active end of the selection. For more information, see <a href="https://docs.microsoft.com/windows/win32/api/msctf/ne-msctf-tfactiveselend">TfActiveSelEnd</a>.
     * @type {Integer}
     */
    ase {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Indicates if the selection is an interim character. If this value is nonzero, then the selection is an interim character and <b>ase</b> will be TF_AE_NONE. If this value is zero, the selection is not an interim character.
     * @type {BOOL}
     */
    fInterimChar {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}
