#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

/**
 * @namespace Windows.Win32.Security.NetworkAccessProtection
 */

;@region Constants

/**
 * @type {Integer (UInt32)}
 */
export global maxSoHAttributeCount := 100

/**
 * @type {Integer (UInt32)}
 */
export global maxSoHAttributeSize := 4000

/**
 * @type {Integer (UInt32)}
 */
export global minNetworkSoHSize := 12

/**
 * @type {Integer (UInt32)}
 */
export global maxNetworkSoHSize := 4000

/**
 * @type {Integer (UInt32)}
 */
export global maxStringLength := 1024

/**
 * @type {Integer (UInt32)}
 */
export global maxSystemHealthEntityCount := 20

/**
 * @type {Integer (UInt32)}
 */
export global maxEnforcerCount := 20

/**
 * @type {Integer (UInt32)}
 */
export global maxPrivateDataSize := 200

/**
 * @type {Integer (UInt32)}
 */
export global maxConnectionCountPerEnforcer := 20

/**
 * @type {Integer (UInt32)}
 */
export global freshSoHRequest := 1

/**
 * @type {Integer (UInt32)}
 */
export global shaFixup := 1

/**
 * @type {Integer (UInt32)}
 */
export global failureCategoryCount := 5

/**
 * @type {Integer (UInt32)}
 */
export global ComponentTypeEnforcementClientSoH := 1

/**
 * @type {Integer (UInt32)}
 */
export global ComponentTypeEnforcementClientRp := 2

/**
 * @type {Integer (UInt32)}
 */
export global percentageNotSupported := 101
;@endregion Constants
