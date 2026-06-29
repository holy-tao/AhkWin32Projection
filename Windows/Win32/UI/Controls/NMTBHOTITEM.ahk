#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NMHDR.ahk" { NMHDR }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import ".\NMTBHOTITEM_FLAGS.ahk" { NMTBHOTITEM_FLAGS }

/**
 * Contains information used with the TBN_HOTITEMCHANGE notification code.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-nmtbhotitem
 * @namespace Windows.Win32.UI.Controls
 */
export default struct NMTBHOTITEM {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a> structure that contains additional information about the notification.
     */
    hdr : NMHDR

    /**
     * Type: <b>int</b>
     * 
     * Command identifier of the previously highlighted item.
     */
    idOld : Int32

    /**
     * Type: <b>int</b>
     * 
     * Command identifier of the item about to be highlighted.
     */
    idNew : Int32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     */
    dwFlags : NMTBHOTITEM_FLAGS

}
