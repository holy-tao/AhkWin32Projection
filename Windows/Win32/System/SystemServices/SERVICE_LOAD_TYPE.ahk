#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.SystemServices
 * @version v4.0.30319
 */
class SERVICE_LOAD_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static BootLoad => 0

    /**
     * @type {Integer (Int32)}
     */
    static SystemLoad => 1

    /**
     * @type {Integer (Int32)}
     */
    static AutoLoad => 2

    /**
     * @type {Integer (Int32)}
     */
    static DemandLoad => 3

    /**
     * @type {Integer (Int32)}
     */
    static DisableLoad => 4
}
