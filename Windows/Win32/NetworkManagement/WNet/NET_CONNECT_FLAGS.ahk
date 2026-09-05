#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WNet
 */
class NET_CONNECT_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: CONNECT_UPDATE_PROFILE
     * @type {Integer (UInt32)}
     */
    static UPDATE_PROFILE => 1

    /**
     * Native name: CONNECT_UPDATE_RECENT
     * @type {Integer (UInt32)}
     */
    static UPDATE_RECENT => 2

    /**
     * Native name: CONNECT_TEMPORARY
     * @type {Integer (UInt32)}
     */
    static TEMPORARY => 4

    /**
     * Native name: CONNECT_INTERACTIVE
     * @type {Integer (UInt32)}
     */
    static INTERACTIVE => 8

    /**
     * Native name: CONNECT_PROMPT
     * @type {Integer (UInt32)}
     */
    static PROMPT => 16

    /**
     * Native name: CONNECT_NEED_DRIVE
     * @type {Integer (UInt32)}
     */
    static NEED_DRIVE => 32

    /**
     * Native name: CONNECT_REFCOUNT
     * @type {Integer (UInt32)}
     */
    static REFCOUNT => 64

    /**
     * Native name: CONNECT_REDIRECT
     * @type {Integer (UInt32)}
     */
    static REDIRECT => 128

    /**
     * Native name: CONNECT_LOCALDRIVE
     * @type {Integer (UInt32)}
     */
    static LOCALDRIVE => 256

    /**
     * Native name: CONNECT_CURRENT_MEDIA
     * @type {Integer (UInt32)}
     */
    static CURRENT_MEDIA => 512

    /**
     * Native name: CONNECT_DEFERRED
     * @type {Integer (UInt32)}
     */
    static DEFERRED => 1024

    /**
     * Native name: CONNECT_RESERVED
     * @type {Integer (UInt32)}
     */
    static RESERVED => 4278190080

    /**
     * Native name: CONNECT_COMMANDLINE
     * @type {Integer (UInt32)}
     */
    static COMMANDLINE => 2048

    /**
     * Native name: CONNECT_CMD_SAVECRED
     * @type {Integer (UInt32)}
     */
    static CMD_SAVECRED => 4096

    /**
     * Native name: CONNECT_CRED_RESET
     * @type {Integer (UInt32)}
     */
    static CRED_RESET => 8192

    /**
     * Native name: CONNECT_REQUIRE_INTEGRITY
     * @type {Integer (UInt32)}
     */
    static REQUIRE_INTEGRITY => 16384

    /**
     * Native name: CONNECT_REQUIRE_PRIVACY
     * @type {Integer (UInt32)}
     */
    static REQUIRE_PRIVACY => 32768

    /**
     * Native name: CONNECT_WRITE_THROUGH_SEMANTICS
     * @type {Integer (UInt32)}
     */
    static WRITE_THROUGH_SEMANTICS => 65536

    /**
     * Native name: CONNECT_GLOBAL_MAPPING
     * @type {Integer (UInt32)}
     */
    static GLOBAL_MAPPING => 262144
}
