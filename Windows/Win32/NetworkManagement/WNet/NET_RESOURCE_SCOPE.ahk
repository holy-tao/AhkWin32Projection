#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WNet
 */
class NET_RESOURCE_SCOPE extends Win32Enum {

    /**
     * @type {Integer (UInt32)}
     */
    static RESOURCE_CONNECTED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RESOURCE_CONTEXT => 5

    /**
     * @type {Integer (UInt32)}
     */
    static RESOURCE_GLOBALNET => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RESOURCE_REMEMBERED => 3
}
