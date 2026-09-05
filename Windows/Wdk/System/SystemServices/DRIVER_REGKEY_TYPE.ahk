#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class DRIVER_REGKEY_TYPE extends Win32Enum {

    /**
     * Native name: DriverRegKeyParameters
     * @type {Integer (Int32)}
     */
    static RegKeyParameters => 0

    /**
     * Native name: DriverRegKeyPersistentState
     * @type {Integer (Int32)}
     */
    static RegKeyPersistentState => 1

    /**
     * Native name: DriverRegKeySharedPersistentState
     * @type {Integer (Int32)}
     */
    static RegKeySharedPersistentState => 2
}
