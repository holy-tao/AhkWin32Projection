#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines if Extended Protection data should be validated.
 * @see https://docs.microsoft.com/windows/win32/api//webservices/ne-webservices-ws_extended_protection_policy
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_EXTENDED_PROTECTION_POLICY{

    /**
     * Extended protection data is not validated.
     * @type {Integer (Int32)}
     */
    static WS_EXTENDED_PROTECTION_POLICY_NEVER => 1

    /**
     * If the client system supports the extended protection feature, extended protection data is looked for and validated during authentication. Otherwise it is ignored.
 *                 
 * 
 * A server can detect whether the client's operating system supports extended protection but chose not to include the extended protection data or 
 *                     whether it does not support extended protection. The former case is insecure and thus rejected. The latter is allowed when using this flag.
 *                 
 * 
 * NOTE: If the client supports the extended protection feature, but did not include extended protection data in the authentication data, this setting will cause requests to fail. This 
 *                     scenario is possible when the operating system was patched but the client web services implementation does not send the neccessary data.
 *                 
 * 
 * This is the default.
     * @type {Integer (Int32)}
     */
    static WS_EXTENDED_PROTECTION_POLICY_WHEN_SUPPORTED => 2

    /**
     * Extended protection data is required to be present and is always validated. Clients that are not extended-protection-aware cannot authenticate to a server 
 *                     setting this flag.
     * @type {Integer (Int32)}
     */
    static WS_EXTENDED_PROTECTION_POLICY_ALWAYS => 3
}
