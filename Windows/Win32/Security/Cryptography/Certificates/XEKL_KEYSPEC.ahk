#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Exchange key
 * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll4-getkeylenex
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class XEKL_KEYSPEC extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static XEKL_KEYSPEC_KEYX => 1

    /**
     * @type {Integer (Int32)}
     */
    static XEKL_KEYSPEC_SIG => 2
}
