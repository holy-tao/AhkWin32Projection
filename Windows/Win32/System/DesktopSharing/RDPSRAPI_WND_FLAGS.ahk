#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines values for the type of window.
 * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/ne-rdpencomapi-rdpsrapi_wnd_flags
 * @namespace Windows.Win32.System.DesktopSharing
 * @version v4.0.30319
 */
class RDPSRAPI_WND_FLAGS{

    /**
     * The window is part of an application that runs at a higher level than the current process. This flag indicates that the window cannot be shared. Applications can use this flag to prevent the user from sharing it either by disabling the entry for the window in the user interface or by not showing the entry.
     * @type {Integer (Int32)}
     */
    static WND_FLAG_PRIVILEGED => 1
}
