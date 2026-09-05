#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
class DESC_LINKAGE_TYPE extends Win32Enum {

    /**
     * Native name: DESC_LINKAGE_RESERVED0
     * @type {Integer (Int32)}
     */
    static RESERVED0 => 0

    /**
     * Native name: DESC_LINKAGE_INFORMATION
     * @type {Integer (Int32)}
     */
    static INFORMATION => 1

    /**
     * Native name: DESC_LINKAGE_EPG
     * @type {Integer (Int32)}
     */
    static EPG => 2

    /**
     * Native name: DESC_LINKAGE_CA_REPLACEMENT
     * @type {Integer (Int32)}
     */
    static CA_REPLACEMENT => 3

    /**
     * Native name: DESC_LINKAGE_COMPLETE_NET_BOUQUET_SI
     * @type {Integer (Int32)}
     */
    static COMPLETE_NET_BOUQUET_SI => 4

    /**
     * Native name: DESC_LINKAGE_REPLACEMENT
     * @type {Integer (Int32)}
     */
    static REPLACEMENT => 5

    /**
     * Native name: DESC_LINKAGE_DATA
     * @type {Integer (Int32)}
     */
    static DATA => 6

    /**
     * Native name: DESC_LINKAGE_RESERVED1
     * @type {Integer (Int32)}
     */
    static RESERVED1 => 7

    /**
     * Native name: DESC_LINKAGE_USER
     * @type {Integer (Int32)}
     */
    static USER => 8

    /**
     * Native name: DESC_LINKAGE_RESERVED2
     * @type {Integer (Int32)}
     */
    static RESERVED2 => 255
}
