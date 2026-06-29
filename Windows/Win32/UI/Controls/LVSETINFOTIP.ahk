#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Provides information about tooltip text that is to be set.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-lvsetinfotip
 * @namespace Windows.Win32.UI.Controls
 */
export default struct LVSETINFOTIP {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Size of the <b>LVSETINFOTIP</b> structure.
     */
    cbSize : UInt32 := this.Size

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Flag that specifies how the text should be set. Set to zero.
     */
    dwFlags : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPWSTR</a></b>
     * 
     * Pointer to a Unicode string that contains the tooltip text.
     */
    pszText : PWSTR

    /**
     * Type: <b>int</b>
     * 
     * Value of type <b>int</b> that contains the 
     * zero-based index of the item to which this structure refers.
     */
    iItem : Int32

    /**
     * Type: <b>int</b>
     * 
     * Value of type <b>int</b> that contains the one-based index of the subitem to which this structure refers.
     */
    iSubItem : Int32

}
