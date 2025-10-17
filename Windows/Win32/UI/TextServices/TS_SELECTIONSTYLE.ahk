#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The TS_SELECTIONSTYLE structure represents the style of a selection.
 * @remarks
 * 
  * An interim character selection is the length of one character and is visually represented as a solid rectangle that is usually flashing. This is a standard UI element of Korean and some Chinese character compositions. <b>fInterimChar</b> is an indication that a specific character is being composed. <b>fInterimChar</b> can only be nonzero for a single selection. In this case, there will be no caret because the highlight takes its place.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//textstor/ns-textstor-ts_selectionstyle
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class TS_SELECTIONSTYLE extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Specifies the active end of the selection. For more information, see <a href="https://docs.microsoft.com/windows/win32/api/textstor/ne-textstor-tsactiveselend">TsActiveSelEnd</a>.
     * @type {Integer}
     */
    ase {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Indicates if the selection is an interim character. If this value is nonzero, then the seleciton is an interim character and <b>ase</b> will be TS_AE_NONE. If this value is zero, the selection is not an interim character.
     * @type {BOOL}
     */
    fInterimChar {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}
