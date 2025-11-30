#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class ADDED_CERT_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static XECT_EXTENSION_V1 => 1

    /**
     * @type {Integer (Int32)}
     */
    static XECT_EXTENSION_V2 => 2
}
