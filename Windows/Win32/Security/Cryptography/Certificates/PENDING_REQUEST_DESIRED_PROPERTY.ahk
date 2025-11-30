#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class PENDING_REQUEST_DESIRED_PROPERTY extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static XEPR_CADNS => 1

    /**
     * @type {Integer (Int32)}
     */
    static XEPR_CAFRIENDLYNAME => 3

    /**
     * @type {Integer (Int32)}
     */
    static XEPR_CANAME => 2

    /**
     * @type {Integer (Int32)}
     */
    static XEPR_HASH => 8

    /**
     * @type {Integer (Int32)}
     */
    static XEPR_REQUESTID => 4
}
