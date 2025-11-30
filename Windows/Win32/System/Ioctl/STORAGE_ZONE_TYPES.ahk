#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class STORAGE_ZONE_TYPES extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static ZoneTypeUnknown => 0

    /**
     * @type {Integer (Int32)}
     */
    static ZoneTypeConventional => 1

    /**
     * @type {Integer (Int32)}
     */
    static ZoneTypeSequentialWriteRequired => 2

    /**
     * @type {Integer (Int32)}
     */
    static ZoneTypeSequentialWritePreferred => 3

    /**
     * @type {Integer (Int32)}
     */
    static ZoneTypeMax => 4
}
