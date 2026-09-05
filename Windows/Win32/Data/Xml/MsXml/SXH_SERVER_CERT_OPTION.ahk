#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 */
class SXH_SERVER_CERT_OPTION extends Win32Enum {

    /**
     * Native name: SXH_SERVER_CERT_IGNORE_UNKNOWN_CA
     * @type {Integer (Int32)}
     */
    static IGNORE_UNKNOWN_CA => 256

    /**
     * Native name: SXH_SERVER_CERT_IGNORE_WRONG_USAGE
     * @type {Integer (Int32)}
     */
    static IGNORE_WRONG_USAGE => 512

    /**
     * Native name: SXH_SERVER_CERT_IGNORE_CERT_CN_INVALID
     * @type {Integer (Int32)}
     */
    static IGNORE_CERT_CN_INVALID => 4096

    /**
     * Native name: SXH_SERVER_CERT_IGNORE_CERT_DATE_INVALID
     * @type {Integer (Int32)}
     */
    static IGNORE_CERT_DATE_INVALID => 8192

    /**
     * Native name: SXH_SERVER_CERT_IGNORE_ALL_SERVER_ERRORS
     * @type {Integer (Int32)}
     */
    static IGNORE_ALL_SERVER_ERRORS => 13056
}
