#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import ".\NMHDR.ahk" { NMHDR }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Contains information used with the RBN_AUTOBREAK notification code.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-nmrebarautobreak
 * @namespace Windows.Win32.UI.Controls
 */
export default struct NMREBARAUTOBREAK {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a> structure that provides additional information about this notification code.
     */
    hdr : NMHDR

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Zero-based index of the band affected by the notification. This is -1 if no band is affected.
     */
    uBand : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Application-defined ID of the band.
     */
    wID : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPARAM</a></b>
     * 
     * Application-defined value from the <b>lParam</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/commctrl/ns-commctrl-rebarbandinfoa">REBARBANDINFO</a> structure that defines the rebar band.
     */
    lParam : LPARAM

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * ID of the message.
     */
    uMsg : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Style of the specified band.
     */
    fStyleCurrent : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * <b>BOOL</b> that indicates whether a break should occur.
     */
    fAutoBreak : BOOL

}
