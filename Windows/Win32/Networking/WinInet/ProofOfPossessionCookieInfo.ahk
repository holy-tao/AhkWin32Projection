#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * 
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/proofofpossessioncookieinfo/ns-proofofpossessioncookieinfo-proofofpossessioncookieinfo
 * @namespace Windows.Win32.Networking.WinInet
 * @version v4.0.30319
 */
class ProofOfPossessionCookieInfo extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * 
     * @type {Pointer<PWSTR>}
     */
    name {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * 
     * @type {Pointer<PWSTR>}
     */
    data {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * For example, **INTERNET_COOKIE_EVALUATE_P3P**, **INTERNET_COOKIE_HTTPONLY**, **INTERNET_COOKIE_THIRD_PARTY**. See [InternetSetCookieExA](/windows/win32/api/wininet/nf-wininet-internetsetcookieexa).
     * @type {Integer}
     */
    flags {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * 
     * @type {Pointer<PWSTR>}
     */
    p3pHeader {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
