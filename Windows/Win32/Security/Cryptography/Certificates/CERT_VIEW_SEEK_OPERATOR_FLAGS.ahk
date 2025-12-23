#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class CERT_VIEW_SEEK_OPERATOR_FLAGS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static CVR_SEEK_EQ => 1

    /**
     * @type {Integer (Int32)}
     */
    static CVR_SEEK_LE => 4

    /**
     * @type {Integer (Int32)}
     */
    static CVR_SEEK_LT => 2

    /**
     * @type {Integer (Int32)}
     */
    static CVR_SEEK_GE => 8

    /**
     * @type {Integer (Int32)}
     */
    static CVR_SEEK_GT => 16
}
