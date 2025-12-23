#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Determines the authentication method for the operation.
 * @see https://learn.microsoft.com/windows/win32/api/wsman/ne-wsman-wsmanauthenticationflags
 * @namespace Windows.Win32.System.RemoteManagement
 * @version v4.0.30319
 */
class WSManAuthenticationFlags extends Win32Enum{

    /**
     * Use the default authentication.
     * @type {Integer (Int32)}
     */
    static WSMAN_FLAG_DEFAULT_AUTHENTICATION => 0

    /**
     * Use no authentication for a remote operation.
     * @type {Integer (Int32)}
     */
    static WSMAN_FLAG_NO_AUTHENTICATION => 1

    /**
     * Use Digest authentication. Only the client computer can initiate a Digest authentication request. The client sends a request to the server to authenticate and receives from the server a token string. The client then sends the resource request, including the user name and a cryptographic hash of the password combined with the token string. Digest authentication is supported for HTTP and HTTPS. WinRM Shell client scripts and applications can specify Digest authentication, but the service cannot.
     * @type {Integer (Int32)}
     */
    static WSMAN_FLAG_AUTH_DIGEST => 2

    /**
     * Use Negotiate authentication. The client sends a request to the server to authenticate. The server determines whether to use Kerberos or NTLM. In general, Kerberos is selected to authenticate a domain account and NTLM is selected for local computer accounts. But there are also some special cases in which Kerberos/NTLM are selected. The user name should be specified in the form DOMAIN\username for a domain user or SERVERNAME\username for a local user on a server computer.
     * @type {Integer (Int32)}
     */
    static WSMAN_FLAG_AUTH_NEGOTIATE => 4

    /**
     * Use Basic authentication. The client presents credentials in the form of a user name and password that are directly transmitted in the request message. You can specify the credentials only of  a local administrator account on the remote computer.
     * @type {Integer (Int32)}
     */
    static WSMAN_FLAG_AUTH_BASIC => 8

    /**
     * Use Kerberos authentication. The client and server mutually authenticate by using Kerberos certificates.
     * @type {Integer (Int32)}
     */
    static WSMAN_FLAG_AUTH_KERBEROS => 16

    /**
     * Use CredSSP authentication for a remote operation. If a certificate from the local machine is used to authenticate the server, the Network service must be allowed access to the private key of the certificate.
     * @type {Integer (Int32)}
     */
    static WSMAN_FLAG_AUTH_CREDSSP => 128

    /**
     * Use client certificate authentication. The certificate thumbprint is passed as part of the <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_authentication_credentials">WSMAN_AUTHENTICATION_CREDENTIALS</a> structure. The WinRM client will try to find the certificate in the computer store and then, if it is not found, in the current user store. If no matching certificate is found, an error will be reported to the user.
     * @type {Integer (Int32)}
     */
    static WSMAN_FLAG_AUTH_CLIENT_CERTIFICATE => 32
}
