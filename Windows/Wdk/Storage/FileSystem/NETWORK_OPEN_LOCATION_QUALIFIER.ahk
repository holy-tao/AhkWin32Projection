#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 * @version v4.0.30319
 */
class NETWORK_OPEN_LOCATION_QUALIFIER extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static NetworkOpenLocationAny => 0

    /**
     * @type {Integer (Int32)}
     */
    static NetworkOpenLocationRemote => 1

    /**
     * @type {Integer (Int32)}
     */
    static NetworkOpenLocationLoopback => 2
}
