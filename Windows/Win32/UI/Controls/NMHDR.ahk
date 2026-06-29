#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HWND.ahk" { HWND }

/**
 * Contains information about a notification message. (NMHDR)
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-nmhdr
 * @namespace Windows.Win32.UI.Controls
 */
export default struct NMHDR {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
     * 
     * A window handle to the control sending the message.
     */
    hwndFrom : HWND

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT_PTR</a></b>
     * 
     * An identifier of the control sending the message.
     */
    idFrom : IntPtr

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * A notification code. This member can be one of the common notification codes (see Notifications under <a href="https://docs.microsoft.com/windows/desktop/Controls/common-control-reference">General Control Reference</a>), or it can be a control-specific notification code.
     */
    code : UInt32

}
