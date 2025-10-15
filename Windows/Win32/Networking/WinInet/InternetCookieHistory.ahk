#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * The InternetCookieHistory structure contains the cookie history.
 * @remarks
 * 
  * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
  * <div> </div>
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wininet/ns-wininet-internetcookiehistory
 * @namespace Windows.Win32.Networking.WinInet
 * @version v4.0.30319
 */
class InternetCookieHistory extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * If true, the cookie was accepted.
     * @type {BOOL}
     */
    fAccepted{
        get {
            if(!this.HasProp("__fAccepted"))
                this.__fAccepted := BOOL(this.ptr + 0)
            return this.__fAccepted
        }
    }

    /**
     * If true, the cookie was leashed.
     * @type {BOOL}
     */
    fLeashed{
        get {
            if(!this.HasProp("__fLeashed"))
                this.__fLeashed := BOOL(this.ptr + 4)
            return this.__fLeashed
        }
    }

    /**
     * If true, the cookie was downgraded.
     * @type {BOOL}
     */
    fDowngraded{
        get {
            if(!this.HasProp("__fDowngraded"))
                this.__fDowngraded := BOOL(this.ptr + 8)
            return this.__fDowngraded
        }
    }

    /**
     * If true, the cookie was rejected.
     * @type {BOOL}
     */
    fRejected{
        get {
            if(!this.HasProp("__fRejected"))
                this.__fRejected := BOOL(this.ptr + 12)
            return this.__fRejected
        }
    }
}
