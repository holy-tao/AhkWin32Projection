#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class POOL_EXTENDED_PARAMETER_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static PoolExtendedParameterInvalidType => 0

    /**
     * @type {Integer (Int32)}
     */
    static PoolExtendedParameterPriority => 1

    /**
     * @type {Integer (Int32)}
     */
    static PoolExtendedParameterSecurePool => 2

    /**
     * @type {Integer (Int32)}
     */
    static PoolExtendedParameterNumaNode => 3

    /**
     * @type {Integer (Int32)}
     */
    static PoolExtendedParameterMax => 4
}
