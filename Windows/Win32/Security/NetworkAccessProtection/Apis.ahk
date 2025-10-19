#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk

/**
 * @namespace Windows.Win32.Security.NetworkAccessProtection
 * @version v4.0.30319
 */
class NetworkAccessProtection {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static maxSoHAttributeCount => 100

    /**
     * @type {Integer (UInt32)}
     */
    static maxSoHAttributeSize => 4000

    /**
     * @type {Integer (UInt32)}
     */
    static minNetworkSoHSize => 12

    /**
     * @type {Integer (UInt32)}
     */
    static maxNetworkSoHSize => 4000

    /**
     * @type {Integer (UInt32)}
     */
    static maxStringLength => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static maxSystemHealthEntityCount => 20

    /**
     * @type {Integer (UInt32)}
     */
    static maxEnforcerCount => 20

    /**
     * @type {Integer (UInt32)}
     */
    static maxPrivateDataSize => 200

    /**
     * @type {Integer (UInt32)}
     */
    static maxConnectionCountPerEnforcer => 20

    /**
     * @type {Integer (UInt32)}
     */
    static freshSoHRequest => 1

    /**
     * @type {Integer (UInt32)}
     */
    static shaFixup => 1

    /**
     * @type {Integer (UInt32)}
     */
    static failureCategoryCount => 5

    /**
     * @type {Integer (UInt32)}
     */
    static ComponentTypeEnforcementClientSoH => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ComponentTypeEnforcementClientRp => 2

    /**
     * @type {Integer (UInt32)}
     */
    static percentageNotSupported => 101
;@endregion Constants

;@region Methods
;@endregion Methods
}
