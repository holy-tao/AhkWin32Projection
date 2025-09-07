#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class USER_ACCOUNT_FLAGS{

    /**
     * @type {Integer (UInt32)}
     */
    static UF_SCRIPT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static UF_ACCOUNTDISABLE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static UF_HOMEDIR_REQUIRED => 8

    /**
     * @type {Integer (UInt32)}
     */
    static UF_PASSWD_NOTREQD => 32

    /**
     * @type {Integer (UInt32)}
     */
    static UF_PASSWD_CANT_CHANGE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static UF_LOCKOUT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static UF_DONT_EXPIRE_PASSWD => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static UF_ENCRYPTED_TEXT_PASSWORD_ALLOWED => 128

    /**
     * @type {Integer (UInt32)}
     */
    static UF_NOT_DELEGATED => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static UF_SMARTCARD_REQUIRED => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static UF_USE_DES_KEY_ONLY => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static UF_DONT_REQUIRE_PREAUTH => 4194304

    /**
     * @type {Integer (UInt32)}
     */
    static UF_TRUSTED_FOR_DELEGATION => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static UF_PASSWORD_EXPIRED => 8388608

    /**
     * @type {Integer (UInt32)}
     */
    static UF_TRUSTED_TO_AUTHENTICATE_FOR_DELEGATION => 16777216
}
