#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies a range of characters in a rich edit control.If the cpMin and cpMax members are equal, the range is empty. The range includes everything if cpMin is 0 and cpMax is �1.
 * @see https://learn.microsoft.com/windows/win32/api/richedit/ns-richedit-charrange
 * @namespace Windows.Win32.UI.Controls.RichEdit
 */
export default struct CHARRANGE {
    #StructPack 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LONG</a></b>
     * 
     * Character position index immediately preceding the first character in the range.
     */
    cpMin : Int32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LONG</a></b>
     * 
     * Character position immediately following the last character in the range.
     */
    cpMax : Int32

}
