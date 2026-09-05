#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WNet
 */
class NET_RESOURCE_SCOPE extends Win32Enum {

    /**
     * Native name: RESOURCE_CONNECTED
     * @type {Integer (UInt32)}
     */
    static CONNECTED => 1

    /**
     * Native name: RESOURCE_CONTEXT
     * @type {Integer (UInt32)}
     */
    static CONTEXT => 5

    /**
     * Native name: RESOURCE_GLOBALNET
     * @type {Integer (UInt32)}
     */
    static GLOBALNET => 2

    /**
     * Native name: RESOURCE_REMEMBERED
     * @type {Integer (UInt32)}
     */
    static REMEMBERED => 3
}
