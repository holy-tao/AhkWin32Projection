#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The InternetCookieHistory structure contains the cookie history.
 * @remarks
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
  * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/wininet/ns-wininet-internetcookiehistory
 * @namespace Windows.Win32.Networking.WinInet
 * @version v4.0.30319
 */
class InternetCookieHistory extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * If true, the cookie was accepted.
     * @type {Integer}
     */
    fAccepted {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * If true, the cookie was leashed.
     * @type {Integer}
     */
    fLeashed {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * If true, the cookie was downgraded.
     * @type {Integer}
     */
    fDowngraded {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * If true, the cookie was rejected.
     * @type {Integer}
     */
    fRejected {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }
}
