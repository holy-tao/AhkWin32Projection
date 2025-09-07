#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.WNet
 * @version v4.0.30319
 */
class NET_CONNECT_FLAGS{

    /**
     * @type {Integer (UInt32)}
     */
    static CONNECT_UPDATE_PROFILE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CONNECT_UPDATE_RECENT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CONNECT_TEMPORARY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CONNECT_INTERACTIVE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static CONNECT_PROMPT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static CONNECT_NEED_DRIVE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static CONNECT_REFCOUNT => 64

    /**
     * @type {Integer (UInt32)}
     */
    static CONNECT_REDIRECT => 128

    /**
     * @type {Integer (UInt32)}
     */
    static CONNECT_LOCALDRIVE => 256

    /**
     * @type {Integer (UInt32)}
     */
    static CONNECT_CURRENT_MEDIA => 512

    /**
     * @type {Integer (UInt32)}
     */
    static CONNECT_DEFERRED => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static CONNECT_RESERVED => 4278190080

    /**
     * @type {Integer (UInt32)}
     */
    static CONNECT_COMMANDLINE => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static CONNECT_CMD_SAVECRED => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static CONNECT_CRED_RESET => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static CONNECT_REQUIRE_INTEGRITY => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static CONNECT_REQUIRE_PRIVACY => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static CONNECT_WRITE_THROUGH_SEMANTICS => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static CONNECT_GLOBAL_MAPPING => 262144
}
