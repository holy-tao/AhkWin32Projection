#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Credentials
 */
class CREDUI_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: CREDUI_FLAGS_ALWAYS_SHOW_UI
     * @type {Integer (UInt32)}
     */
    static ALWAYS_SHOW_UI => 128

    /**
     * Native name: CREDUI_FLAGS_COMPLETE_USERNAME
     * @type {Integer (UInt32)}
     */
    static COMPLETE_USERNAME => 2048

    /**
     * Native name: CREDUI_FLAGS_DO_NOT_PERSIST
     * @type {Integer (UInt32)}
     */
    static DO_NOT_PERSIST => 2

    /**
     * Native name: CREDUI_FLAGS_EXCLUDE_CERTIFICATES
     * @type {Integer (UInt32)}
     */
    static EXCLUDE_CERTIFICATES => 8

    /**
     * Native name: CREDUI_FLAGS_EXPECT_CONFIRMATION
     * @type {Integer (UInt32)}
     */
    static EXPECT_CONFIRMATION => 131072

    /**
     * Native name: CREDUI_FLAGS_GENERIC_CREDENTIALS
     * @type {Integer (UInt32)}
     */
    static GENERIC_CREDENTIALS => 262144

    /**
     * Native name: CREDUI_FLAGS_INCORRECT_PASSWORD
     * @type {Integer (UInt32)}
     */
    static INCORRECT_PASSWORD => 1

    /**
     * Native name: CREDUI_FLAGS_KEEP_USERNAME
     * @type {Integer (UInt32)}
     */
    static KEEP_USERNAME => 1048576

    /**
     * Native name: CREDUI_FLAGS_PASSWORD_ONLY_OK
     * @type {Integer (UInt32)}
     */
    static PASSWORD_ONLY_OK => 512

    /**
     * Native name: CREDUI_FLAGS_PERSIST
     * @type {Integer (UInt32)}
     */
    static PERSIST => 4096

    /**
     * Native name: CREDUI_FLAGS_REQUEST_ADMINISTRATOR
     * @type {Integer (UInt32)}
     */
    static REQUEST_ADMINISTRATOR => 4

    /**
     * Native name: CREDUI_FLAGS_REQUIRE_CERTIFICATE
     * @type {Integer (UInt32)}
     */
    static REQUIRE_CERTIFICATE => 16

    /**
     * Native name: CREDUI_FLAGS_REQUIRE_SMARTCARD
     * @type {Integer (UInt32)}
     */
    static REQUIRE_SMARTCARD => 256

    /**
     * Native name: CREDUI_FLAGS_SERVER_CREDENTIAL
     * @type {Integer (UInt32)}
     */
    static SERVER_CREDENTIAL => 16384

    /**
     * Native name: CREDUI_FLAGS_SHOW_SAVE_CHECK_BOX
     * @type {Integer (UInt32)}
     */
    static SHOW_SAVE_CHECK_BOX => 64

    /**
     * Native name: CREDUI_FLAGS_USERNAME_TARGET_CREDENTIALS
     * @type {Integer (UInt32)}
     */
    static USERNAME_TARGET_CREDENTIALS => 524288

    /**
     * Native name: CREDUI_FLAGS_VALIDATE_USERNAME
     * @type {Integer (UInt32)}
     */
    static VALIDATE_USERNAME => 1024
}
