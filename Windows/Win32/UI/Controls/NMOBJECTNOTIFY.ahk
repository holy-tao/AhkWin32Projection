#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HWND.ahk
#Include .\NMHDR.ahk

/**
 * Contains information used with the TBN_GETOBJECT, TCN_GETOBJECT, and PSN_GETOBJECT notification codes.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-nmobjectnotify
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class NMOBJECTNOTIFY extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a></b>
     * 
     * An <a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a> structure that contains additional information about this notification.
     * @type {NMHDR}
     */
    hdr{
        get {
            if(!this.HasProp("__hdr"))
                this.__hdr := NMHDR(0, this)
            return this.__hdr
        }
    }

    /**
     * Type: <b>int</b>
     * 
     * A control-specific item identifier. This value will comply to item identification standards for the control sending the notification. However, this member is not used with the <a href="https://docs.microsoft.com/windows/desktop/Controls/psn-getobject">PSN_GETOBJECT</a> notification code.
     * @type {Integer}
     */
    iItem {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * Type: <b>IID*</b>
     * 
     * A pointer to an interface identifier of the requested object.
     * @type {Pointer<Guid>}
     */
    piid {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>*</b>
     * 
     * A pointer to an object provided by the window processing the notification code. The application processing the notification code sets this member.
     * @type {Pointer<Void>}
     */
    pObject {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * COM success or failure flags. The application processing the notification code sets this member.
     * @type {HRESULT}
     */
    hResult {
        get => NumGet(this, 48, "int")
        set => NumPut("int", value, this, 48)
    }

    /**
     * 
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }
}
