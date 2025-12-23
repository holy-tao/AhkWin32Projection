#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class CERT_DELETE_ROW_FLAGS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static CDR_EXPIRED => 1

    /**
     * @type {Integer (Int32)}
     */
    static CDR_REQUEST_LAST_CHANGED => 2
}
