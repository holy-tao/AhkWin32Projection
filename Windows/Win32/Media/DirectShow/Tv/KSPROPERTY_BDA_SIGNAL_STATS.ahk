#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
class KSPROPERTY_BDA_SIGNAL_STATS extends Win32Enum {

    /**
     * Native name: KSPROPERTY_BDA_SIGNAL_STRENGTH
     * @type {Integer (Int32)}
     */
    static STRENGTH => 0

    /**
     * Native name: KSPROPERTY_BDA_SIGNAL_QUALITY
     * @type {Integer (Int32)}
     */
    static QUALITY => 1

    /**
     * Native name: KSPROPERTY_BDA_SIGNAL_PRESENT
     * @type {Integer (Int32)}
     */
    static PRESENT => 2

    /**
     * Native name: KSPROPERTY_BDA_SIGNAL_LOCKED
     * @type {Integer (Int32)}
     */
    static LOCKED => 3

    /**
     * Native name: KSPROPERTY_BDA_SAMPLE_TIME
     * @type {Integer (Int32)}
     */
    static SAMPLE_TIME => 4

    /**
     * Native name: KSPROPERTY_BDA_SIGNAL_LOCK_CAPS
     * @type {Integer (Int32)}
     */
    static LOCK_CAPS => 5

    /**
     * Native name: KSPROPERTY_BDA_SIGNAL_LOCK_TYPE
     * @type {Integer (Int32)}
     */
    static LOCK_TYPE => 6
}
