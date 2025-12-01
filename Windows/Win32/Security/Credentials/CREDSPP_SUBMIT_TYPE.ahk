#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the type of credentials specified by a CREDSSP_CRED structure.
 * @see https://learn.microsoft.com/windows/win32/api/credssp/ne-credssp-credspp_submit_type
 * @namespace Windows.Win32.Security.Credentials
 * @version v4.0.30319
 */
class CREDSPP_SUBMIT_TYPE extends Win32Enum{

    /**
     * The credentials are a user name and password.
     * @type {Integer (Int32)}
     */
    static CredsspPasswordCreds => 2

    /**
     * The credentials are Schannel credentials.
     * @type {Integer (Int32)}
     */
    static CredsspSchannelCreds => 4

    /**
     * The credentials are in a certificate.
     * @type {Integer (Int32)}
     */
    static CredsspCertificateCreds => 13

    /**
     * The credentials contain both certificate and Schannel credentials.
     * @type {Integer (Int32)}
     */
    static CredsspSubmitBufferBoth => 50

    /**
     * 
     * @type {Integer (Int32)}
     */
    static CredsspSubmitBufferBothOld => 51

    /**
     * 
     * @type {Integer (Int32)}
     */
    static CredsspCredEx => 100
}
