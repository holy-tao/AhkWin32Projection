#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Documentation varies per use. Refer to each: <see href="https://learn.microsoft.com/windows/win32/api//content/xenroll/nf-xenroll-icenroll4-getkeylenex">CEnroll.GetKeyLenEx</see>, <see href="https://learn.microsoft.com/windows/win32/api//content/xenroll/nf-xenroll-icenroll4-getkeylenex">ICEnroll4.GetKeyLenEx</see>, <see href="https://learn.microsoft.com/windows/win32/api//content/xenroll/nf-xenroll-ienroll4-getkeylenex">IEnroll4.GetKeyLenEx</see>.
 * @see 
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class XEKL_KEYSIZE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static XEKL_KEYSIZE_MIN => 1

    /**
     * @type {Integer (Int32)}
     */
    static XEKL_KEYSIZE_MAX => 2

    /**
     * @type {Integer (Int32)}
     */
    static XEKL_KEYSIZE_INC => 3
}
