#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the notification data for an authentication request.
 * @remarks
 * 
  * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
  * <div> </div>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wininet/ns-wininet-internet_auth_notify_data
 * @namespace Windows.Win32.Networking.WinInet
 * @version v4.0.30319
 */
class INTERNET_AUTH_NOTIFY_DATA extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Size of the structure, in bytes.
     * @type {Integer}
     */
    cbStruct {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * 
     * @type {Integer}
     */
    dwOptions {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Notification callback to retry 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-interneterrordlg">InternetErrorDlg</a>.
     * @type {Pointer<PFN_AUTH_NOTIFY>}
     */
    pfnNotify {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Pointer to a variable that contains an application-defined value used to identify the application context to pass to the notification function.
     * @type {Pointer}
     */
    dwContext {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
