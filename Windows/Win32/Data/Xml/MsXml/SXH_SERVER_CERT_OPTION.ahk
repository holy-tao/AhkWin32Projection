#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 * @version v4.0.30319
 */
class SXH_SERVER_CERT_OPTION extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static SXH_SERVER_CERT_IGNORE_UNKNOWN_CA => 256

    /**
     * @type {Integer (Int32)}
     */
    static SXH_SERVER_CERT_IGNORE_WRONG_USAGE => 512

    /**
     * @type {Integer (Int32)}
     */
    static SXH_SERVER_CERT_IGNORE_CERT_CN_INVALID => 4096

    /**
     * @type {Integer (Int32)}
     */
    static SXH_SERVER_CERT_IGNORE_CERT_DATE_INVALID => 8192

    /**
     * @type {Integer (Int32)}
     */
    static SXH_SERVER_CERT_IGNORE_ALL_SERVER_ERRORS => 13056
}
