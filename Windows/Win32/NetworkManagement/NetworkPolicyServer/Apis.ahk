#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk
#Include ..\..\System\WinRT\Apis.ahk
#Include ..\..\System\WinRT\HSTRING.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.NetworkPolicyServer
 * @version v4.0.30319
 */
class NetworkPolicyServer {

;@region Constants

    /**
     * @type {HSTRING}
     */
    static RADIUS_EXTENSION_INIT => "RadiusExtensionInit"

    /**
     * @type {HSTRING}
     */
    static RADIUS_EXTENSION_TERM => "RadiusExtensionTerm"

    /**
     * @type {HSTRING}
     */
    static RADIUS_EXTENSION_PROCESS => "RadiusExtensionProcess"

    /**
     * @type {HSTRING}
     */
    static RADIUS_EXTENSION_PROCESS_EX => "RadiusExtensionProcessEx"

    /**
     * @type {HSTRING}
     */
    static RADIUS_EXTENSION_FREE_ATTRIBUTES => "RadiusExtensionFreeAttributes"

    /**
     * @type {HSTRING}
     */
    static AUTHSRV_PARAMETERS_KEY_W => "System\CurrentControlSet\Services\AuthSrv\Parameters"

    /**
     * @type {HSTRING}
     */
    static AUTHSRV_EXTENSIONS_VALUE_W => "ExtensionDLLs"

    /**
     * @type {HSTRING}
     */
    static AUTHSRV_AUTHORIZATION_VALUE_W => "AuthorizationDLLs"

    /**
     * @type {HSTRING}
     */
    static AUTHSRV_ENFORCE_NP_FOR_PAP_CHALLENGE_RESPONSE_VALUE_W => "EnforceNetworkPolicyForPAPBasedChallengeResponse"

    /**
     * @type {Integer (UInt32)}
     */
    static RADIUS_EXTENSION_VERSION => 1

    /**
     * @type {HSTRING}
     */
    static RADIUS_EXTENSION_PROCESS2 => "RadiusExtensionProcess2"
;@endregion Constants

;@region Methods
;@endregion Methods
}
