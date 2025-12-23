#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\HDESK.ahk
#Include ..\..\Foundation\HWND.ahk
#Include ..\..\Foundation\LUID.ahk

/**
 * Contains information about a window that denied a request from BroadcastSystemMessageEx.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-bsminfo
 * @namespace Windows.Win32.System.StationsAndDesktops
 * @version v4.0.30319
 */
class BSMINFO extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Type: <b>UINT</b>
     * 
     * The size, in bytes, of this structure.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>HDESK</b>
     * 
     * A desktop handle to the window specified by 
     * 					<b>hwnd</b>. This value is returned only if <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-broadcastsystemmessageexa">BroadcastSystemMessageEx</a> specifies <b>BSF_RETURNHDESK</b> and <b>BSF_QUERY</b>.
     * @type {HDESK}
     */
    hdesk{
        get {
            if(!this.HasProp("__hdesk"))
                this.__hdesk := HDESK(8, this)
            return this.__hdesk
        }
    }

    /**
     * Type: <b>HWND</b>
     * 
     * A handle to the window that denied the request. This value is returned if <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-broadcastsystemmessageexa">BroadcastSystemMessageEx</a> specifies <b>BSF_QUERY</b>.
     * @type {HWND}
     */
    hwnd{
        get {
            if(!this.HasProp("__hwnd"))
                this.__hwnd := HWND(16, this)
            return this.__hwnd
        }
    }

    /**
     * Type: <b>LUID</b>
     * 
     * A locally unique identifier (LUID) for the window.
     * @type {LUID}
     */
    luid{
        get {
            if(!this.HasProp("__luid"))
                this.__luid := LUID(24, this)
            return this.__luid
        }
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 32
    }
}
