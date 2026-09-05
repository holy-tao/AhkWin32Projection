#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
class KSPROPERTY_BDA_IPv4_FILTER extends Win32Enum {

    /**
     * Native name: KSPROPERTY_BDA_IPv4_FILTER_MULTICAST_LIST_SIZE
     * @type {Integer (Int32)}
     */
    static MULTICAST_LIST_SIZE => 0

    /**
     * Native name: KSPROPERTY_BDA_IPv4_FILTER_MULTICAST_LIST
     * @type {Integer (Int32)}
     */
    static MULTICAST_LIST => 1

    /**
     * Native name: KSPROPERTY_BDA_IPv4_FILTER_MULTICAST_MODE
     * @type {Integer (Int32)}
     */
    static MULTICAST_MODE => 2
}
