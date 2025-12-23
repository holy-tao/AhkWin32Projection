#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class HTTPSPOLICY_CALLBACK_DATA_AUTH_TYPE extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static AUTHTYPE_CLIENT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static AUTHTYPE_SERVER => 2
}
