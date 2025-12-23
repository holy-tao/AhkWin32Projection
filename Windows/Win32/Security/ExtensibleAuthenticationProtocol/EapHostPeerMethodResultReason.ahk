#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the set of possible reasons that describe the results returned by an EAP method to a supplicant.
 * @see https://learn.microsoft.com/windows/win32/api/eaphostpeertypes/ne-eaphostpeertypes-eaphostpeermethodresultreason
 * @namespace Windows.Win32.Security.ExtensibleAuthenticationProtocol
 * @version v4.0.30319
 */
class EapHostPeerMethodResultReason extends Win32Enum{

    /**
     * Authentication was successful.
     * @type {Integer (Int32)}
     */
    static EapHostPeerMethodResultAltSuccessReceived => 1

    /**
     * The method timed out waiting for a response.
     * @type {Integer (Int32)}
     */
    static EapHostPeerMethodResultTimeout => 2

    /**
     * The  authentication process was completely normally.
     * @type {Integer (Int32)}
     */
    static EapHostPeerMethodResultFromMethod => 3
}
