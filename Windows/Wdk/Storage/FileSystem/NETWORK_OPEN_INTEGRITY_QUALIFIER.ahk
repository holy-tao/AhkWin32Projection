#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 * @version v4.0.30319
 */
class NETWORK_OPEN_INTEGRITY_QUALIFIER extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static NetworkOpenIntegrityAny => 0

    /**
     * @type {Integer (Int32)}
     */
    static NetworkOpenIntegrityNone => 1

    /**
     * @type {Integer (Int32)}
     */
    static NetworkOpenIntegritySigned => 2

    /**
     * @type {Integer (Int32)}
     */
    static NetworkOpenIntegrityEncrypted => 3

    /**
     * @type {Integer (Int32)}
     */
    static NetworkOpenIntegrityMaximum => 4
}
