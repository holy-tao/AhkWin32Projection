#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import ".\NMHDR.ahk" { NMHDR }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\RECT.ahk" { RECT }

/**
 * Contains information used in handling the RBN_CHEVRONPUSHED notification code.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-nmrebarchevron
 * @namespace Windows.Win32.UI.Controls
 */
export default struct NMREBARCHEVRON {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a> structure that contains additional information about the notification.
     */
    hdr : NMHDR

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Index of the band sending the notification.
     */
    uBand : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Application-defined identifier for the band.
     */
    wID : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPARAM</a></b>
     * 
     * Application-defined value associated with the band.
     */
    lParam : LPARAM

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that defines the area covered by the chevron.
     */
    rc : RECT

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPARAM</a></b>
     * 
     * An application-defined value. If the <a href="https://docs.microsoft.com/windows/desktop/Controls/rbn-chevronpushed">RBN_CHEVRONPUSHED</a> notification was sent as a result of an <a href="https://docs.microsoft.com/windows/desktop/Controls/rb-pushchevron">RB_PUSHCHEVRON</a> message, this member contains the message's 
     * 					<i>lAppValue</i> value. Otherwise, it is set to zero.
     */
    lParamNM : LPARAM

}
