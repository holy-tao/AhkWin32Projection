#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\WPARAM.ahk" { WPARAM }
#Import ".\DDEML_MSG_HOOK_DATA.ahk" { DDEML_MSG_HOOK_DATA }

/**
 * Contains information about a Dynamic Data Exchange (DDE) message. A DDE monitoring application can use this structure to obtain information about a DDE message that was sent or posted.
 * @see https://learn.microsoft.com/windows/win32/api/ddeml/ns-ddeml-monmsgstruct
 * @namespace Windows.Win32.System.DataExchange
 */
export default struct MONMSGSTRUCT {
    #StructPack 8

    /**
     * Type: <b>UINT</b>
     * 
     * The structure's size, in bytes.
     */
    cb : UInt32

    /**
     * Type: <b>HWND</b>
     * 
     * A handle to the window that receives the DDE message.
     */
    hwndTo : HWND

    /**
     * Type: <b>DWORD</b>
     * 
     * The Windows time at which the message was sent or posted. Windows time is the number of milliseconds that have elapsed since the system was booted.
     */
    dwTime : UInt32

    /**
     * Type: <b>HANDLE</b>
     * 
     * A handle to the task (application instance) containing the window that receives the DDE message.
     */
    hTask : HANDLE

    /**
     * Type: <b>UINT</b>
     * 
     * The identifier of the DDE message.
     */
    wMsg : UInt32

    /**
     * Type: <b>WPARAM</b>
     * 
     * The <b>wParam</b> parameter of the DDE message.
     */
    wParam : WPARAM

    /**
     * Type: <b>LPARAM</b>
     * 
     * The <b>lParam</b> parameter of the DDE message.
     */
    lParam : LPARAM

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/ddeml/ns-ddeml-ddeml_msg_hook_data">DDEML_MSG_HOOK_DATA</a></b>
     * 
     * Additional information about the DDE message.
     */
    dmhd : DDEML_MSG_HOOK_DATA

}
