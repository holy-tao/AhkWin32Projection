#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import ".\NMHDR.ahk" { NMHDR }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import ".\NMREBAR_MASK_FLAGS.ahk" { NMREBAR_MASK_FLAGS }

/**
 * Contains information used in handling various rebar notifications.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-nmrebar
 * @namespace Windows.Win32.UI.Controls
 */
export default struct NMREBAR {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a> structure that contains additional information about the notification.
     */
    hdr : NMHDR

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     */
    dwMask : NMREBAR_MASK_FLAGS

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Zero-based index of the band affected by the notification. This will be -1 if no band is affected.
     */
    uBand : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The style of the band. This is one or more of the RBBS_ styles detailed in the 
     * 					<b>fStyle</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/commctrl/ns-commctrl-rebarbandinfoa">REBARBANDINFO</a> structure. This member is only valid if 
     * 					<b>dwMask</b> contains RBNM_STYLE.
     */
    fStyle : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Application-defined identifier of the band. This member is only valid if 
     * 					<b>dwMask</b> contains RBNM_ID.
     */
    wID : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPARAM</a></b>
     * 
     * Application-defined value associated with the band. This member is only valid if 
     * 					<b>dwMask</b> contains RBNM_LPARAM.
     */
    lParam : LPARAM

}
