#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Identifies which authentication protocol to use.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.credentials.ui.authenticationprotocol
 * @namespace Windows.Security.Credentials.UI
 * @version WindowsRuntime 1.4
 */
class AuthenticationProtocol extends Win32Enum{

    /**
     * The authentication protocol is basic. Credentials are returned to the caller as plaintext.
     * @type {Integer (Int32)}
     */
    static Basic => 0

    /**
     * The authentication protocol is digest. Credentials are returned to the caller as plaintext.
     * @type {Integer (Int32)}
     */
    static Digest => 1

    /**
     * The authentication protocol is NTLM. Credentials are transformed before being returned to the caller.
     * @type {Integer (Int32)}
     */
    static Ntlm => 2

    /**
     * The authentication protocol is Kerberos. Credentials are transformed before being returned to the caller.
     * @type {Integer (Int32)}
     */
    static Kerberos => 3

    /**
     * The authentication protocol is negotiate, including negotiate extensions. Credentials are transformed before being returned to the caller.
     * @type {Integer (Int32)}
     */
    static Negotiate => 4

    /**
     * The authentication protocol is for remote access using the Credential Security Support Provider (CredSSP) protocol.
     * @type {Integer (Int32)}
     */
    static CredSsp => 5

    /**
     * The authentication protocol is anything other than the previous ones. Credentials are returned to the caller as plaintext.
     * @type {Integer (Int32)}
     */
    static Custom => 6
}
