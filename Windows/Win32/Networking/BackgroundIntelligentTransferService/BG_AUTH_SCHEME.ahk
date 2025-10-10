#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines constants that specify the authentication scheme to use when a proxy or server requests user authentication.
 * @remarks
 * 
  * BITS supports Passport authentication for explicit credentials only, not implicit credentials tied to the account.
  * 
  * The following table shows the authentication requests that BITS does not support.
  * 
  * |Scenario|Windows XP|Windows Server 2003|
  * |-|-|-|
  * |Passport authentication on the server when the proxy requires authentication (using the HTTPS protocol).|Not supported|Not supported|
  * |Any authentication scheme on the server when the proxy requires Digest authentication.|Not supported|Not supported|
  * |Negotiate authentication on the server when the proxy requires Basic authentication.|Not supported||
  * |Using HTTPS when the proxy requires Digest authentication.|Not supported||
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//bits1_5/ne-bits1_5-bg_auth_scheme
 * @namespace Windows.Win32.Networking.BackgroundIntelligentTransferService
 * @version v4.0.30319
 */
class BG_AUTH_SCHEME{

    /**
     * <em>Basic</em> is a scheme in which the user name and password are sent in clear-text to the server or proxy.
     * @type {Integer (Int32)}
     */
    static BG_AUTH_SCHEME_BASIC => 1

    /**
     * <em>Digest</em> is a challenge-response scheme that uses a server-specified data string for the challenge.
     * @type {Integer (Int32)}
     */
    static BG_AUTH_SCHEME_DIGEST => 2

    /**
     * <em>NTLM</em> is a challenge-response scheme that uses the credentials of the user for authentication in a Windows network environment.
     * @type {Integer (Int32)}
     */
    static BG_AUTH_SCHEME_NTLM => 3

    /**
     * <em>Simple and Protected Negotiation</em> (Snego) is a challenge-response scheme that negotiates with the server or proxy to determine which scheme to use for authentication. Examples are the Kerberos protocol, and NTLM.
     * @type {Integer (Int32)}
     */
    static BG_AUTH_SCHEME_NEGOTIATE => 4

    /**
     * <em>Passport</em> is a centralized authentication service provided by Microsoft that offers a single logon for member sites.
     * @type {Integer (Int32)}
     */
    static BG_AUTH_SCHEME_PASSPORT => 5
}
