#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the set of possible reasons that describe the results returned by an EAP method to a supplicant.
 * @see https://learn.microsoft.com/windows/win32/api/eaphostpeertypes/ne-eaphostpeertypes-eaphostpeermethodresultreason
 * @namespace Windows.Win32.Security.ExtensibleAuthenticationProtocol
 */
class EapHostPeerMethodResultReason extends Win32Enum {

    /**
     * Authentication was successful.
     * Native name: EapHostPeerMethodResultAltSuccessReceived
     * @type {Integer (Int32)}
     */
    static AltSuccessReceived => 1

    /**
     * The method timed out waiting for a response.
     * Native name: EapHostPeerMethodResultTimeout
     * @type {Integer (Int32)}
     */
    static Timeout => 2

    /**
     * The  authentication process was completely normally.
     * Native name: EapHostPeerMethodResultFromMethod
     * @type {Integer (Int32)}
     */
    static FromMethod => 3
}
