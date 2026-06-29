#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HWND.ahk" { HWND }

/**
 * Contains information about a hardware message sent to the system message queue. This structure is used to store message information for the JournalPlaybackProc callback function.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-eventmsg
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
export default struct EVENTMSG {
    #StructPack 8

    /**
     * Type: <b>UINT</b>
     * 
     * The message.
     */
    message : UInt32

    /**
     * Type: <b>UINT</b>
     * 
     * Additional information about the message. The exact meaning depends on the 
     * 					<b>message</b> value.
     */
    paramL : UInt32

    /**
     * Type: <b>UINT</b>
     * 
     * Additional information about the message. The exact meaning depends on the 
     * 					<b>message</b> value.
     */
    paramH : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The time at which the message was posted.
     */
    time : UInt32

    /**
     * Type: <b>HWND</b>
     * 
     * A handle to the window to which the message was posted.
     */
    hwnd : HWND

}
