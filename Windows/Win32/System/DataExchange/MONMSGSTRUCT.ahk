#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HWND.ahk
#Include ..\..\Foundation\HANDLE.ahk
#Include ..\..\Foundation\WPARAM.ahk
#Include ..\..\Foundation\LPARAM.ahk
#Include .\DDEML_MSG_HOOK_DATA.ahk

/**
 * Contains information about a Dynamic Data Exchange (DDE) message. A DDE monitoring application can use this structure to obtain information about a DDE message that was sent or posted.
 * @see https://docs.microsoft.com/windows/win32/api//ddeml/ns-ddeml-monmsgstruct
 * @namespace Windows.Win32.System.DataExchange
 * @version v4.0.30319
 */
class MONMSGSTRUCT extends Win32Struct
{
    static sizeof => 112

    static packingSize => 8

    /**
     * Type: <b>UINT</b>
     * 
     * The structure's size, in bytes.
     * @type {Integer}
     */
    cb {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>HWND</b>
     * 
     * A handle to the window that receives the DDE message.
     * @type {HWND}
     */
    hwndTo{
        get {
            if(!this.HasProp("__hwndTo"))
                this.__hwndTo := HWND(this.ptr + 8)
            return this.__hwndTo
        }
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The Windows time at which the message was sent or posted. Windows time is the number of milliseconds that have elapsed since the system was booted.
     * @type {Integer}
     */
    dwTime {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Type: <b>HANDLE</b>
     * 
     * A handle to the task (application instance) containing the window that receives the DDE message.
     * @type {HANDLE}
     */
    hTask{
        get {
            if(!this.HasProp("__hTask"))
                this.__hTask := HANDLE(this.ptr + 24)
            return this.__hTask
        }
    }

    /**
     * Type: <b>UINT</b>
     * 
     * The identifier of the DDE message.
     * @type {Integer}
     */
    wMsg {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Type: <b>WPARAM</b>
     * 
     * The <b>wParam</b> parameter of the DDE message.
     * @type {WPARAM}
     */
    wParam{
        get {
            if(!this.HasProp("__wParam"))
                this.__wParam := WPARAM(this.ptr + 40)
            return this.__wParam
        }
    }

    /**
     * Type: <b>LPARAM</b>
     * 
     * The <b>lParam</b> parameter of the DDE message.
     * @type {LPARAM}
     */
    lParam{
        get {
            if(!this.HasProp("__lParam"))
                this.__lParam := LPARAM(this.ptr + 48)
            return this.__lParam
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/ddeml/ns-ddeml-ddeml_msg_hook_data">DDEML_MSG_HOOK_DATA</a></b>
     * 
     * Additional information about the DDE message.
     * @type {DDEML_MSG_HOOK_DATA}
     */
    dmhd{
        get {
            if(!this.HasProp("__dmhd"))
                this.__dmhd := DDEML_MSG_HOOK_DATA(this.ptr + 56)
            return this.__dmhd
        }
    }
}
