#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DDEML_MSG_HOOK_DATA.ahk

/**
 * Contains information about a Dynamic Data Exchange (DDE) message. A DDE monitoring application can use this structure to obtain information about a DDE message that was sent or posted.
 * @see https://learn.microsoft.com/windows/win32/api/ddeml/ns-ddeml-monmsgstruct
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
     * @type {Pointer<HWND>}
     */
    hwndTo {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
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
     * @type {Pointer<HANDLE>}
     */
    hTask {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
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
     * @type {Pointer}
     */
    wParam {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Type: <b>LPARAM</b>
     * 
     * The <b>lParam</b> parameter of the DDE message.
     * @type {Pointer}
     */
    lParam {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
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
