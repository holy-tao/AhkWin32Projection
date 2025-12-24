#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class DRIVER_REGKEY_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DriverRegKeyParameters => 0

    /**
     * @type {Integer (Int32)}
     */
    static DriverRegKeyPersistentState => 1

    /**
     * @type {Integer (Int32)}
     */
    static DriverRegKeySharedPersistentState => 2
}
