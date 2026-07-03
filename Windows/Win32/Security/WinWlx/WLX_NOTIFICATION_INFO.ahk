#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\System\StationsAndDesktops\HDESK.ahk" { HDESK }

/**
 * This structure stores information about a Winlogon event.
 * @see https://learn.microsoft.com/windows/win32/api/winwlx/ns-winwlx-wlx_notification_info
 * @namespace Windows.Win32.Security.WinWlx
 */
export default struct WLX_NOTIFICATION_INFO {
    #StructPack 8

    /**
     * Indicates the size of the structure, in bytes. Your application can check this value against the structure size to validate the structure.
     */
    Size : UInt32

    /**
     * Reserved for internal use.
     */
    Flags : UInt32

    /**
     * String that specifies the name of the user currently logged on to the system. If the event occurs before a user logs on, this value is <b>NULL</b>.
     */
    UserName : PWSTR

    /**
     * String that specifies the name of the domain the user is currently logged on to. If the event occurs before a user logs on, this value is <b>NULL</b>.
     */
    Domain : PWSTR

    /**
     * Specifies the name of the window station the user is currently logged on to. If the event occurs before a user logs on, this value is <b>NULL</b>. Note that most configurations use a single, default window station. Some applications, such as 
     * <a href="https://docs.microsoft.com/windows/desktop/TermServ/about-terminal-services">About Terminal Services</a>, use multiple window stations.
     */
    WindowStation : PWSTR

    /**
     * A handle to the user's token. This value is <b>NULL</b> if the event occurs before a user logs on.
     */
    hToken : HANDLE

    /**
     * A handle to the desktop that is currently active.
     */
    hDesktop : HDESK

    /**
     * Reserved for internal use.
     */
    pStatusCallback : IntPtr

}
