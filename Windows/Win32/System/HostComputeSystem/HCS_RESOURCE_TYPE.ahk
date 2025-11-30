#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.HostComputeSystem
 * @version v4.0.30319
 */
class HCS_RESOURCE_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static HcsResourceTypeNone => 0

    /**
     * @type {Integer (Int32)}
     */
    static HcsResourceTypeFile => 1

    /**
     * @type {Integer (Int32)}
     */
    static HcsResourceTypeJob => 2

    /**
     * @type {Integer (Int32)}
     */
    static HcsResourceTypeComObject => 3

    /**
     * @type {Integer (Int32)}
     */
    static HcsResourceTypeSocket => 4
}
