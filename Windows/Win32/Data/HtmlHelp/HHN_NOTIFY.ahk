#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\UI\Controls\NMHDR.ahk" { NMHDR }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Use this structure to return the file name of the topic that has been navigated to, or to return the window type name of the help window that has been created.
 * @see https://learn.microsoft.com/windows/win32/api/htmlhelp/ns-htmlhelp-hhn_notify
 * @namespace Windows.Win32.Data.HtmlHelp
 */
export default struct HHN_NOTIFY {
    #StructPack 8

    /**
     * Standard <b>WM_NOTIFY</b> header.
     */
    hdr : NMHDR

    /**
     * A multi-byte, zero-terminated string that specifies the topic navigated to, or the name of the help window being created.
     */
    pszUrl : PSTR

}
