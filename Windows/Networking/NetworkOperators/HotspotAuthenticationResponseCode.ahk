#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines values used to indicate status of connection authentication with a mobile hotspot. Provides the response code from the WISPr server for an authentication attempt.
  * 
  * Possible values are defined in the .
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.hotspotauthenticationresponsecode
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class HotspotAuthenticationResponseCode extends Win32Enum{

    /**
     * No response returned.
     * @type {Integer (Int32)}
     */
    static NoError => 0

    /**
     * Hotspot authentication successful.
     * @type {Integer (Int32)}
     */
    static LoginSucceeded => 50

    /**
     * Hotspot authentication failed.
     * @type {Integer (Int32)}
     */
    static LoginFailed => 100

    /**
     * No response from authentication server.
     * @type {Integer (Int32)}
     */
    static RadiusServerError => 102

    /**
     * An error occurred that requires contacting the network administrator.
     * @type {Integer (Int32)}
     */
    static NetworkAdministratorError => 105

    /**
     * The authentication request was aborted.
     * @type {Integer (Int32)}
     */
    static LoginAborted => 151

    /**
     * An internal error occurred in the access gateway.
     * @type {Integer (Int32)}
     */
    static AccessGatewayInternalError => 255
}
