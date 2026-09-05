#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class STORAGE_ZONE_TYPES extends Win32Enum {

    /**
     * Native name: ZoneTypeUnknown
     * @type {Integer (Int32)}
     */
    static TypeUnknown => 0

    /**
     * Native name: ZoneTypeConventional
     * @type {Integer (Int32)}
     */
    static TypeConventional => 1

    /**
     * Native name: ZoneTypeSequentialWriteRequired
     * @type {Integer (Int32)}
     */
    static TypeSequentialWriteRequired => 2

    /**
     * Native name: ZoneTypeSequentialWritePreferred
     * @type {Integer (Int32)}
     */
    static TypeSequentialWritePreferred => 3

    /**
     * Native name: ZoneTypeMax
     * @type {Integer (Int32)}
     */
    static TypeMax => 4
}
