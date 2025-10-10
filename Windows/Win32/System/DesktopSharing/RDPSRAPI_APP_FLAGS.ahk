#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines values for the type of application.
 * @see https://docs.microsoft.com/windows/win32/api//rdpencomapi/ne-rdpencomapi-rdpsrapi_app_flags
 * @namespace Windows.Win32.System.DesktopSharing
 * @version v4.0.30319
 */
class RDPSRAPI_APP_FLAGS{

    /**
     * This flag indicates that the application cannot be shared. The application runs at a higher level than the process that is using the Windows Desktop Sharing API. An application can use this flag to prevent the user from sharing it by either disabling the entry for the application in the user interface or by not showing the entry.
     * @type {Integer (Int32)}
     */
    static APP_FLAG_PRIVILEGED => 1
}
