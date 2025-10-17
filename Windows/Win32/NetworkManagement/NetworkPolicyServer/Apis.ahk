#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk
/**
 * @namespace Windows.Win32.NetworkManagement.NetworkPolicyServer
 * @version v4.0.30319
 */
class NetworkPolicyServer {

;@region Constants

    /**
     * @type {String}
     */
    static RADIUS_EXTENSION_INIT => "RadiusExtensionInit"

    /**
     * @type {String}
     */
    static RADIUS_EXTENSION_TERM => "RadiusExtensionTerm"

    /**
     * @type {String}
     */
    static RADIUS_EXTENSION_PROCESS => "RadiusExtensionProcess"

    /**
     * @type {String}
     */
    static RADIUS_EXTENSION_PROCESS_EX => "RadiusExtensionProcessEx"

    /**
     * @type {String}
     */
    static RADIUS_EXTENSION_FREE_ATTRIBUTES => "RadiusExtensionFreeAttributes"

    /**
     * @type {String}
     */
    static AUTHSRV_PARAMETERS_KEY_W => "System\CurrentControlSet\Services\AuthSrv\Parameters"

    /**
     * @type {String}
     */
    static AUTHSRV_EXTENSIONS_VALUE_W => "ExtensionDLLs"

    /**
     * @type {String}
     */
    static AUTHSRV_AUTHORIZATION_VALUE_W => "AuthorizationDLLs"

    /**
     * @type {String}
     */
    static AUTHSRV_ENFORCE_NP_FOR_PAP_CHALLENGE_RESPONSE_VALUE_W => "EnforceNetworkPolicyForPAPBasedChallengeResponse"

    /**
     * @type {Integer (UInt32)}
     */
    static RADIUS_EXTENSION_VERSION => 1

    /**
     * @type {String}
     */
    static RADIUS_EXTENSION_PROCESS2 => "RadiusExtensionProcess2"
;@endregion Constants

;@region Methods
;@endregion Methods
}
