#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct MSV_SUB_AUTHENTICATION_FILTER {
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
    static LOGON_GUEST => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LOGON_NOENCRYPTION => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LOGON_CACHED_ACCOUNT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static LOGON_USED_LM_PASSWORD => 8

    /**
     * @type {Integer (UInt32)}
     */
    static LOGON_EXTRA_SIDS => 32

    /**
     * @type {Integer (UInt32)}
     */
    static LOGON_SUBAUTH_SESSION_KEY => 64

    /**
     * @type {Integer (UInt32)}
     */
    static LOGON_SERVER_TRUST_ACCOUNT => 128

    /**
     * @type {Integer (UInt32)}
     */
    static LOGON_PROFILE_PATH_RETURNED => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static LOGON_RESOURCE_GROUPS => 512
}
