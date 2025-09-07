#Requires AutoHotkey v2.0.0 64-bit

/**
 * Determines the proxy authentication mechanism.
 * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/ne-wsmandisp-wsmanproxyauthenticationflags
 * @namespace Windows.Win32.System.RemoteManagement
 * @version v4.0.30319
 */
class WSManProxyAuthenticationFlags{

    /**
     * Use Negotiate authentication. The client sends a request to the server to authenticate. The server determines whether to use Kerberos or NTLM. In general, Kerberos is selected to authenticate a domain account and NTLM is selected for local computer accounts. But there are also some special cases in which Kerberos/NTLM are selected. The user name should be specified in the form DOMAIN\username for a domain user or SERVERNAME\username for a local user on a server computer.
     * @type {Integer (Int32)}
     */
    static WSManFlagProxyAuthenticationUseNegotiate => 1

    /**
     * Use Basic authentication. The client presents credentials in the form of a user name and password that are directly transmitted in the request message.
     * @type {Integer (Int32)}
     */
    static WSManFlagProxyAuthenticationUseBasic => 2

    /**
     * Use Digest authentication. Only the client computer can initiate a Digest authentication request. The client sends a request to the server to authenticate and receives from the server a token string. The client then sends the resource request, including the user name and a cryptographic hash of the password combined with the token string. Digest authentication is supported for HTTP and HTTPS.
     * @type {Integer (Int32)}
     */
    static WSManFlagProxyAuthenticationUseDigest => 4
}
