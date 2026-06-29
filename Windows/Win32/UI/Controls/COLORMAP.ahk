#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\COLORREF.ahk" { COLORREF }

/**
 * Contains information used by the CreateMappedBitmap function to map the colors of the bitmap.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-colormap
 * @namespace Windows.Win32.UI.Controls
 */
export default struct COLORMAP {
    #StructPack 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">COLORREF</a></b>
     * 
     * Color to map from.
     */
    from : COLORREF

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">COLORREF</a></b>
     * 
     * Color to map to.
     */
    to : COLORREF

}
