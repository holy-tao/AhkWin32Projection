#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SCROLLINFO_MASK.ahk" { SCROLLINFO_MASK }

/**
 * The SCROLLINFO structure contains scroll bar parameters to be set by the SetScrollInfo function (or SBM_SETSCROLLINFO message), or retrieved by the GetScrollInfo function (or SBM_GETSCROLLINFO message).
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-scrollinfo
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
export default struct SCROLLINFO {
    #StructPack 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Specifies the size, in bytes, of this structure. The caller must set this to sizeof(<b>SCROLLINFO</b>).
     */
    cbSize : UInt32 := this.Size

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     */
    fMask : SCROLLINFO_MASK

    /**
     * Type: <b>int</b>
     * 
     * Specifies the minimum scrolling position.
     */
    nMin : Int32

    /**
     * Type: <b>int</b>
     * 
     * Specifies the maximum scrolling position.
     */
    nMax : Int32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Specifies the page size, in device units. A scroll bar uses this value to determine the appropriate size of the proportional scroll box.
     */
    nPage : UInt32

    /**
     * Type: <b>int</b>
     * 
     * Specifies the position of the scroll box.
     */
    nPos : Int32

    /**
     * Type: <b>int</b>
     * 
     * Specifies the immediate position of a scroll box that the user is dragging. An application can retrieve this value while processing the SB_THUMBTRACK request code. An application cannot set the immediate scroll position; the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-setscrollinfo">SetScrollInfo</a> function ignores this member.
     */
    nTrackPos : Int32

}
