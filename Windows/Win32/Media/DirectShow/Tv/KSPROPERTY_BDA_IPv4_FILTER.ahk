#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class KSPROPERTY_BDA_IPv4_FILTER extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_BDA_IPv4_FILTER_MULTICAST_LIST_SIZE => 0

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_BDA_IPv4_FILTER_MULTICAST_LIST => 1

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_BDA_IPv4_FILTER_MULTICAST_MODE => 2
}
