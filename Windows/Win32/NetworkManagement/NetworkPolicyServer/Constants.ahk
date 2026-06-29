#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.NetworkPolicyServer
 */

;@region Constants

/**
 * @type {String}
 */
export global RADIUS_EXTENSION_INIT := "RadiusExtensionInit"

/**
 * @type {String}
 */
export global RADIUS_EXTENSION_TERM := "RadiusExtensionTerm"

/**
 * @type {String}
 */
export global RADIUS_EXTENSION_PROCESS := "RadiusExtensionProcess"

/**
 * @type {String}
 */
export global RADIUS_EXTENSION_PROCESS_EX := "RadiusExtensionProcessEx"

/**
 * @type {String}
 */
export global RADIUS_EXTENSION_FREE_ATTRIBUTES := "RadiusExtensionFreeAttributes"

/**
 * @type {String}
 */
export global AUTHSRV_PARAMETERS_KEY_W := "System\CurrentControlSet\Services\AuthSrv\Parameters"

/**
 * @type {String}
 */
export global AUTHSRV_EXTENSIONS_VALUE_W := "ExtensionDLLs"

/**
 * @type {String}
 */
export global AUTHSRV_AUTHORIZATION_VALUE_W := "AuthorizationDLLs"

/**
 * @type {String}
 */
export global AUTHSRV_ENFORCE_NP_FOR_PAP_CHALLENGE_RESPONSE_VALUE_W := "EnforceNetworkPolicyForPAPBasedChallengeResponse"

/**
 * @type {Integer (UInt32)}
 */
export global RADIUS_EXTENSION_VERSION := 1

/**
 * @type {String}
 */
export global RADIUS_EXTENSION_PROCESS2 := "RadiusExtensionProcess2"
;@endregion Constants
