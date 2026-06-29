#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NMHDR.ahk" { NMHDR }
#Import "..\..\Foundation\HWND.ahk" { HWND }

/**
 * Contains information for the IPN_FIELDCHANGED notification code.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-nmipaddress
 * @namespace Windows.Win32.UI.Controls
 */
export default struct NMIPADDRESS {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a></b>
     * 
     * An <a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a> structure that contains additional information about the notification.
     */
    hdr : NMHDR

    /**
     * Type: <b>int</b>
     * 
     * The zero-based number of the field that was changed.
     */
    iField : Int32

    /**
     * Type: <b>int</b>
     * 
     * The new value of the field specified in the 
     * 					<b>iField</b> member. While processing the <a href="https://docs.microsoft.com/windows/desktop/Controls/ipn-fieldchanged">IPN_FIELDCHANGED</a> notification, this member can be set to any value that is within the range of the field and the control will place this new value in the field.
     */
    iValue : Int32

}
