#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains the notification data for an authentication request.
 * @remarks
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/wininet/ns-wininet-internet_auth_notify_data
 * @namespace Windows.Win32.Networking.WinInet
 */
export default struct INTERNET_AUTH_NOTIFY_DATA {
    #StructPack 8

    /**
     * Size of the structure, in bytes.
     */
    cbStruct : UInt32

    dwOptions : UInt32

    /**
     * Notification callback to retry 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-interneterrordlg">InternetErrorDlg</a>.
     */
    pfnNotify : IntPtr

    /**
     * Pointer to a variable that contains an application-defined value used to identify the application context to pass to the notification function.
     */
    dwContext : IntPtr

}
