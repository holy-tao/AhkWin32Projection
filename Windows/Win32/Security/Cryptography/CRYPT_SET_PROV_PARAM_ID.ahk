#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CRYPT_SET_PROV_PARAM_ID{

    /**
     * @type {Integer (UInt32)}
     */
    static PP_CLIENT_HWND => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PP_DELETEKEY => 24

    /**
     * @type {Integer (UInt32)}
     */
    static PP_KEYEXCHANGE_ALG => 14

    /**
     * @type {Integer (UInt32)}
     */
    static PP_KEYEXCHANGE_PIN => 32

    /**
     * @type {Integer (UInt32)}
     */
    static PP_KEYEXCHANGE_KEYSIZE => 12

    /**
     * @type {Integer (UInt32)}
     */
    static PP_KEYSET_SEC_DESCR => 8

    /**
     * @type {Integer (UInt32)}
     */
    static PP_PIN_PROMPT_STRING => 44

    /**
     * @type {Integer (UInt32)}
     */
    static PP_ROOT_CERTSTORE => 46

    /**
     * @type {Integer (UInt32)}
     */
    static PP_SIGNATURE_ALG => 15

    /**
     * @type {Integer (UInt32)}
     */
    static PP_SIGNATURE_PIN => 33

    /**
     * @type {Integer (UInt32)}
     */
    static PP_SIGNATURE_KEYSIZE => 13

    /**
     * @type {Integer (UInt32)}
     */
    static PP_UI_PROMPT => 21

    /**
     * @type {Integer (UInt32)}
     */
    static PP_USE_HARDWARE_RNG => 38

    /**
     * @type {Integer (UInt32)}
     */
    static PP_USER_CERTSTORE => 42

    /**
     * @type {Integer (UInt32)}
     */
    static PP_SECURE_KEYEXCHANGE_PIN => 47

    /**
     * @type {Integer (UInt32)}
     */
    static PP_SECURE_SIGNATURE_PIN => 48

    /**
     * @type {Integer (UInt32)}
     */
    static PP_SMARTCARD_READER => 43
}
