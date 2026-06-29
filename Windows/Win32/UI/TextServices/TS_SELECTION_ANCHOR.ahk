#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\TS_SELECTIONSTYLE.ahk" { TS_SELECTIONSTYLE }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\IAnchor.ahk" { IAnchor }
#Import ".\TsActiveSelEnd.ahk" { TsActiveSelEnd }

/**
 * The TS_SELECTION_ANCHOR structure contains anchor-based text selection data.
 * @see https://learn.microsoft.com/windows/win32/api/textstor/ns-textstor-ts_selection_anchor
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct TS_SELECTION_ANCHOR {
    #StructPack 8

    /**
     * Contains the start anchor of the selection.
     */
    paStart : IAnchor

    /**
     * Contains the end anchor of the selection.
     */
    paEnd : IAnchor

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/textstor/ns-textstor-ts_selectionstyle">TS_SELECTIONSTYLE</a> structure that contains additional selection data.
     */
    style : TS_SELECTIONSTYLE

}
