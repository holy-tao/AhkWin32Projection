#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\LVTILEVIEWINFO_FLAGS.ahk" { LVTILEVIEWINFO_FLAGS }
#Import ".\LVTILEVIEWINFO_MASK.ahk" { LVTILEVIEWINFO_MASK }
#Import "..\..\Foundation\RECT.ahk" { RECT }
#Import "..\..\Foundation\SIZE.ahk" { SIZE }

/**
 * Provides information about a list-view control when it is displayed in tile view.
 * @remarks
 * By default, the dimensions of tiles are determined automatically. To apply a fixed size, supply the correct value or values in <b>sizeTile</b> and set the appropriate flag in <b>dwFlags</b>. Allow enough vertical space for all lines of the label to be displayed. If a line does not fit in the allowed horizontal space, it is terminated with an ellipsis.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-lvtileviewinfo
 * @namespace Windows.Win32.UI.Controls
 */
export default struct LVTILEVIEWINFO {
    #StructPack 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Size of the <b>LVTILEVIEWINFO</b> structure.
     */
    cbSize : UInt32 := this.Size

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     */
    dwMask : LVTILEVIEWINFO_MASK

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     */
    dwFlags : LVTILEVIEWINFO_FLAGS

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-size">SIZE</a></b>
     * 
     * Size of an individual tile. Values for dimensions not specified as fixed in <b>dwFlags</b> are ignored.
     */
    sizeTile : SIZE

    /**
     * Type: <b>int</b>
     * 
     * Maximum number of text lines in each item label, not counting the title.
     */
    cLines : Int32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> that contains coordinates of the label margin.
     */
    rcLabelMargin : RECT

}
