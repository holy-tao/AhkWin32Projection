#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @see https://learn.microsoft.com/windows/win32/api/proofofpossessioncookieinfo/ns-proofofpossessioncookieinfo-proofofpossessioncookieinfo
 * @namespace Windows.Win32.Networking.WinInet
 */
export default struct ProofOfPossessionCookieInfo {
    #StructPack 8

    name : PWSTR

    data : PWSTR

    /**
     * For example, **INTERNET_COOKIE_EVALUATE_P3P**, **INTERNET_COOKIE_HTTPONLY**, **INTERNET_COOKIE_THIRD_PARTY**. See [InternetSetCookieExA](/windows/win32/api/wininet/nf-wininet-internetsetcookieexa).
     */
    flags : UInt32

    p3pHeader : PWSTR

}
