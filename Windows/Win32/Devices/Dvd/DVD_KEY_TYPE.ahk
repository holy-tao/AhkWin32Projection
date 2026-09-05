#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Dvd
 */
class DVD_KEY_TYPE extends Win32Enum {

    /**
     * Native name: DvdChallengeKey
     * @type {Integer (Int32)}
     */
    static ChallengeKey => 1

    /**
     * Native name: DvdBusKey1
     * @type {Integer (Int32)}
     */
    static BusKey1 => 2

    /**
     * Native name: DvdBusKey2
     * @type {Integer (Int32)}
     */
    static BusKey2 => 3

    /**
     * Native name: DvdTitleKey
     * @type {Integer (Int32)}
     */
    static TitleKey => 4

    /**
     * Native name: DvdAsf
     * @type {Integer (Int32)}
     */
    static Asf => 5

    /**
     * Native name: DvdSetRpcKey
     * @type {Integer (Int32)}
     */
    static SetRpcKey => 6

    /**
     * Native name: DvdGetRpcKey
     * @type {Integer (Int32)}
     */
    static GetRpcKey => 8

    /**
     * Native name: DvdDiskKey
     * @type {Integer (Int32)}
     */
    static DiskKey => 128

    /**
     * Native name: DvdInvalidateAGID
     * @type {Integer (Int32)}
     */
    static InvalidateAGID => 63
}
