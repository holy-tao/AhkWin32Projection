#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
class NETWORK_OPEN_INTEGRITY_QUALIFIER extends Win32Enum {

    /**
     * Native name: NetworkOpenIntegrityAny
     * @type {Integer (Int32)}
     */
    static Any => 0

    /**
     * Native name: NetworkOpenIntegrityNone
     * @type {Integer (Int32)}
     */
    static None => 1

    /**
     * Native name: NetworkOpenIntegritySigned
     * @type {Integer (Int32)}
     */
    static Signed => 2

    /**
     * Native name: NetworkOpenIntegrityEncrypted
     * @type {Integer (Int32)}
     */
    static Encrypted => 3

    /**
     * Native name: NetworkOpenIntegrityMaximum
     * @type {Integer (Int32)}
     */
    static Maximum => 4
}
