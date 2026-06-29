#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct MSV_SUBAUTH_LOGON_PARAMETER_CONTROL {
    value : UInt32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (UInt32)}
     */
    static MSV1_0_CLEARTEXT_PASSWORD_ALLOWED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MSV1_0_UPDATE_LOGON_STATISTICS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MSV1_0_RETURN_USER_PARAMETERS => 8

    /**
     * @type {Integer (UInt32)}
     */
    static MSV1_0_DONT_TRY_GUEST_ACCOUNT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static MSV1_0_ALLOW_SERVER_TRUST_ACCOUNT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static MSV1_0_RETURN_PASSWORD_EXPIRY => 64

    /**
     * @type {Integer (UInt32)}
     */
    static MSV1_0_ALLOW_WORKSTATION_TRUST_ACCOUNT => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static MSV1_0_TRY_GUEST_ACCOUNT_ONLY => 256

    /**
     * @type {Integer (UInt32)}
     */
    static MSV1_0_RETURN_PROFILE_PATH => 512

    /**
     * @type {Integer (UInt32)}
     */
    static MSV1_0_TRY_SPECIFIED_DOMAIN_ONLY => 1024
}
