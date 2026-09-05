#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
class BDA_MULTICAST_MODE extends Win32Enum {

    /**
     * Native name: BDA_PROMISCUOUS_MULTICAST
     * @type {Integer (Int32)}
     */
    static PROMISCUOUS_MULTICAST => 0

    /**
     * Native name: BDA_FILTERED_MULTICAST
     * @type {Integer (Int32)}
     */
    static FILTERED_MULTICAST => 1

    /**
     * Native name: BDA_NO_MULTICAST
     * @type {Integer (Int32)}
     */
    static NO_MULTICAST => 2
}
