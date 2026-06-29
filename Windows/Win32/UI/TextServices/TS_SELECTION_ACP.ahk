#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\TS_SELECTIONSTYLE.ahk" { TS_SELECTIONSTYLE }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\TsActiveSelEnd.ahk" { TsActiveSelEnd }

/**
 * The TS_SELECTION_ACP structure contains ACP-based text selection data.
 * @see https://learn.microsoft.com/windows/win32/api/textstor/ns-textstor-ts_selection_acp
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct TS_SELECTION_ACP {
    #StructPack 4

    /**
     * Contains the start position of the selection.
     */
    acpStart : Int32

    /**
     * Contains the end position of the selection.
     */
    acpEnd : Int32

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/textstor/ns-textstor-ts_selectionstyle">TS_SELECTIONSTYLE</a> structure that contains additional selection data.
     */
    style : TS_SELECTIONSTYLE

}
