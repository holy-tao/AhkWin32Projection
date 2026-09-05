#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Credentials
 */
class CREDUIWIN_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: CREDUIWIN_GENERIC
     * @type {Integer (UInt32)}
     */
    static GENERIC => 1

    /**
     * Native name: CREDUIWIN_CHECKBOX
     * @type {Integer (UInt32)}
     */
    static CHECKBOX => 2

    /**
     * Native name: CREDUIWIN_AUTHPACKAGE_ONLY
     * @type {Integer (UInt32)}
     */
    static AUTHPACKAGE_ONLY => 16

    /**
     * Native name: CREDUIWIN_IN_CRED_ONLY
     * @type {Integer (UInt32)}
     */
    static IN_CRED_ONLY => 32

    /**
     * Native name: CREDUIWIN_ENUMERATE_ADMINS
     * @type {Integer (UInt32)}
     */
    static ENUMERATE_ADMINS => 256

    /**
     * Native name: CREDUIWIN_ENUMERATE_CURRENT_USER
     * @type {Integer (UInt32)}
     */
    static ENUMERATE_CURRENT_USER => 512

    /**
     * Native name: CREDUIWIN_SECURE_PROMPT
     * @type {Integer (UInt32)}
     */
    static SECURE_PROMPT => 4096

    /**
     * Native name: CREDUIWIN_PREPROMPTING
     * @type {Integer (UInt32)}
     */
    static PREPROMPTING => 8192

    /**
     * Native name: CREDUIWIN_PACK_32_WOW
     * @type {Integer (UInt32)}
     */
    static PACK_32_WOW => 268435456
}
