#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NMHDR.ahk" { NMHDR }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Contains information used with the TBN_GETOBJECT, TCN_GETOBJECT, and PSN_GETOBJECT notification codes.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-nmobjectnotify
 * @namespace Windows.Win32.UI.Controls
 */
export default struct NMOBJECTNOTIFY {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a></b>
     * 
     * An <a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a> structure that contains additional information about this notification.
     */
    hdr : NMHDR

    /**
     * Type: <b>int</b>
     * 
     * A control-specific item identifier. This value will comply to item identification standards for the control sending the notification. However, this member is not used with the <a href="https://docs.microsoft.com/windows/desktop/Controls/psn-getobject">PSN_GETOBJECT</a> notification code.
     */
    iItem : Int32

    /**
     * Type: <b>IID*</b>
     * 
     * A pointer to an interface identifier of the requested object.
     */
    piid : Guid.Ptr

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>*</b>
     * 
     * A pointer to an object provided by the window processing the notification code. The application processing the notification code sets this member.
     */
    pObject : IntPtr

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * COM success or failure flags. The application processing the notification code sets this member.
     */
    hResult : HRESULT

    dwFlags : UInt32

}
