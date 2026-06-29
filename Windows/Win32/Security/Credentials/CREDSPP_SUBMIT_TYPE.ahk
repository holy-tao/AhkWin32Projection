#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the type of credentials specified by a CREDSSP_CRED structure.
 * @see https://learn.microsoft.com/windows/win32/api/credssp/ne-credssp-credspp_submit_type
 * @namespace Windows.Win32.Security.Credentials
 */
export default struct CREDSPP_SUBMIT_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
     * @type {Integer (Int32)}
     */
    static CredsspSubmitBufferBothOld => 51

    /**
     * @type {Integer (Int32)}
     */
    static CredsspCredEx => 100
}
