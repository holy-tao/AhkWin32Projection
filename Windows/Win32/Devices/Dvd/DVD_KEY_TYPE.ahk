#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Dvd
 * @version v4.0.30319
 */
class DVD_KEY_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DvdChallengeKey => 1

    /**
     * @type {Integer (Int32)}
     */
    static DvdBusKey1 => 2

    /**
     * @type {Integer (Int32)}
     */
    static DvdBusKey2 => 3

    /**
     * @type {Integer (Int32)}
     */
    static DvdTitleKey => 4

    /**
     * @type {Integer (Int32)}
     */
    static DvdAsf => 5

    /**
     * @type {Integer (Int32)}
     */
    static DvdSetRpcKey => 6

    /**
     * @type {Integer (Int32)}
     */
    static DvdGetRpcKey => 8

    /**
     * @type {Integer (Int32)}
     */
    static DvdDiskKey => 128

    /**
     * @type {Integer (Int32)}
     */
    static DvdInvalidateAGID => 63
}
