#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.HostComputeSystem
 */
class HCS_RESOURCE_TYPE extends Win32Enum {

    /**
     * Native name: HcsResourceTypeNone
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Native name: HcsResourceTypeFile
     * @type {Integer (Int32)}
     */
    static File => 1

    /**
     * Native name: HcsResourceTypeJob
     * @type {Integer (Int32)}
     */
    static Job => 2

    /**
     * Native name: HcsResourceTypeComObject
     * @type {Integer (Int32)}
     */
    static ComObject => 3

    /**
     * Native name: HcsResourceTypeSocket
     * @type {Integer (Int32)}
     */
    static Socket => 4
}
