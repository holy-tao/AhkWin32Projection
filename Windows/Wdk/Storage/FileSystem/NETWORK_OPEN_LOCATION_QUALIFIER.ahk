#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
class NETWORK_OPEN_LOCATION_QUALIFIER extends Win32Enum {

    /**
     * Native name: NetworkOpenLocationAny
     * @type {Integer (Int32)}
     */
    static Any => 0

    /**
     * Native name: NetworkOpenLocationRemote
     * @type {Integer (Int32)}
     */
    static Remote => 1

    /**
     * Native name: NetworkOpenLocationLoopback
     * @type {Integer (Int32)}
     */
    static Loopback => 2
}
