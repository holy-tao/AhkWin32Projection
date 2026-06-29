#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DATABLOCK_HEADER.ahk" { DATABLOCK_HEADER }
#Import "..\..\Foundation\COLORREF.ahk" { COLORREF }
#Import "..\..\System\Console\COORD.ahk" { COORD }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Holds an extra data block used by IShellLinkDataList. It holds console properties.
 * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/ns-shlobj_core-nt_console_props
 * @namespace Windows.Win32.UI.Shell
 */
export default struct NT_CONSOLE_PROPS {
    #StructPack 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/shlobj_core/ns-shlobj_core-datablock_header">DATABLOCK_HEADER</a></b>
     * 
     * The <a href="https://docs.microsoft.com/windows/win32/api/shlobj_core/ns-shlobj_core-datablock_header">DATABLOCK_HEADER</a> structure with the <b>NT_CONSOLE_PROPS</b> structure's size and signature. The signature for an <b>NT_CONSOLE_PROPS</b> structure is NT_CONSOLE_PROPS_SIG.
     */
    dbh : DATABLOCK_HEADER

    /**
     * Type: <b>WORD</b>
     * 
     * Fill attribute for the console.
     */
    wFillAttribute : UInt16

    /**
     * Type: <b>WORD</b>
     * 
     * Fill attribute for console pop-ups.
     */
    wPopupFillAttribute : UInt16

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/console/coord-str">COORD</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/console/coord-str">COORD</a> structure with the console's screen buffer size.
     */
    dwScreenBufferSize : COORD

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/console/coord-str">COORD</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/console/coord-str">COORD</a> structure with the console's window size.
     */
    dwWindowSize : COORD

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/console/coord-str">COORD</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/console/coord-str">COORD</a> structure with the console's window origin.
     */
    dwWindowOrigin : COORD

    /**
     * Type: <b>DWORD</b>
     * 
     * The font.
     */
    nFont : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The input buffer size.
     */
    nInputBufferSize : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/console/coord-str">COORD</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/console/coord-str">COORD</a> structure with the font size.
     */
    dwFontSize : COORD

    /**
     * Type: <b>UINT</b>
     * 
     * The font family.
     */
    uFontFamily : UInt32

    /**
     * Type: <b>UINT</b>
     * 
     * The font weight.
     */
    uFontWeight : UInt32

    /**
     * Type: <b>WCHAR[LF_FACESIZE]</b>
     * 
     * A character array that contains the font's face name.
     */
    FaceName : WCHAR[32]

    /**
     * Type: <b>UINT</b>
     * 
     * The cursor size.
     */
    uCursorSize : UInt32

    /**
     * Type: <b>BOOL</b>
     * 
     * A boolean value that is set to <b>TRUE</b> if the console is in full-screen mode, or <b>FALSE</b> otherwise.
     */
    bFullScreen : BOOL

    /**
     * Type: <b>BOOL</b>
     * 
     * A boolean value that is set to <b>TRUE</b> if the console is in quick-edit mode, or <b>FALSE</b> otherwise.
     */
    bQuickEdit : BOOL

    /**
     * Type: <b>BOOL</b>
     * 
     * A boolean value that is set to <b>TRUE</b> if the console is in insert mode, or <b>FALSE</b> otherwise.
     */
    bInsertMode : BOOL

    /**
     * Type: <b>BOOL</b>
     * 
     * A boolean value that is set to <b>TRUE</b> if the console is in auto-position mode, or <b>FALSE</b> otherwise.
     */
    bAutoPosition : BOOL

    /**
     * Type: <b>UINT</b>
     * 
     * The size of the history buffer.
     */
    uHistoryBufferSize : UInt32

    /**
     * Type: <b>UINT</b>
     * 
     * The number of history buffers.
     */
    uNumberOfHistoryBuffers : UInt32

    /**
     * Type: <b>BOOL</b>
     * 
     * A boolean value that is set to <b>TRUE</b> if old duplicate history lists should be discarded, or <b>FALSE</b> otherwise.
     */
    bHistoryNoDup : BOOL

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/gdi/colorref">COLORREF</a>[16]</b>
     * 
     * An array of <a href="https://docs.microsoft.com/windows/desktop/gdi/colorref">COLORREF</a> values with the console's color settings.
     */
    ColorTable : COLORREF[16]

}
