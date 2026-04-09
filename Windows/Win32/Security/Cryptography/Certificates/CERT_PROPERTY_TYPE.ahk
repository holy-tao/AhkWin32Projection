#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
class CERT_PROPERTY_TYPE extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static PROPTYPE_BINARY => 3

    /**
     * @type {Integer (Int32)}
     */
    static PROPTYPE_DATE => 2

    /**
     * @type {Integer (Int32)}
     */
    static PROPTYPE_LONG => 1

    /**
     * @type {Integer (Int32)}
     */
    static PROPTYPE_STRING => 4
}
