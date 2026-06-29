#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\TsActiveSelEnd.ahk" { TsActiveSelEnd }

/**
 * The TS_SELECTIONSTYLE structure represents the style of a selection.
 * @remarks
 * An interim character selection is the length of one character and is visually represented as a solid rectangle that is usually flashing. This is a standard UI element of Korean and some Chinese character compositions. <b>fInterimChar</b> is an indication that a specific character is being composed. <b>fInterimChar</b> can only be nonzero for a single selection. In this case, there will be no caret because the highlight takes its place.
 * @see https://learn.microsoft.com/windows/win32/api/textstor/ns-textstor-ts_selectionstyle
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct TS_SELECTIONSTYLE {
    #StructPack 4

    /**
     * Specifies the active end of the selection. For more information, see <a href="https://docs.microsoft.com/windows/win32/api/textstor/ne-textstor-tsactiveselend">TsActiveSelEnd</a>.
     */
    ase : TsActiveSelEnd

    /**
     * Indicates if the selection is an interim character. If this value is nonzero, then the selection is an interim character and <b>ase</b> will be TS_AE_NONE. If this value is zero, the selection is not an interim character.
     */
    fInterimChar : BOOL

}
