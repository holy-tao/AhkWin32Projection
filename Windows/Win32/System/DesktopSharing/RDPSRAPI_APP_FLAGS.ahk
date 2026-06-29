#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines values for the type of application.
 * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/ne-rdpencomapi-rdpsrapi_app_flags
 * @namespace Windows.Win32.System.DesktopSharing
 */
export default struct RDPSRAPI_APP_FLAGS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * This flag indicates that the application cannot be shared. The application runs at a higher level than the process that is using the Windows Desktop Sharing API. An application can use this flag to prevent the user from sharing it by either disabling the entry for the application in the user interface or by not showing the entry.
     * @type {Integer (Int32)}
     */
    static APP_FLAG_PRIVILEGED => 1
}
