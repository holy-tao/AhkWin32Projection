#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class POOL_EXTENDED_PARAMETER_TYPE extends Win32Enum {

    /**
     * Native name: PoolExtendedParameterInvalidType
     * @type {Integer (Int32)}
     */
    static InvalidType => 0

    /**
     * Native name: PoolExtendedParameterPriority
     * @type {Integer (Int32)}
     */
    static Priority => 1

    /**
     * Native name: PoolExtendedParameterSecurePool
     * @type {Integer (Int32)}
     */
    static SecurePool => 2

    /**
     * Native name: PoolExtendedParameterNumaNode
     * @type {Integer (Int32)}
     */
    static NumaNode => 3

    /**
     * Native name: PoolExtendedParameterMax
     * @type {Integer (Int32)}
     */
    static Max => 4
}
