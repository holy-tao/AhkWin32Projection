#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Security.Credentials
 * @version v4.0.30319
 */
class CREDUIWIN_FLAGS{

    /**
     * @type {Integer (UInt32)}
     */
    static CREDUIWIN_GENERIC => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CREDUIWIN_CHECKBOX => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CREDUIWIN_AUTHPACKAGE_ONLY => 16

    /**
     * @type {Integer (UInt32)}
     */
    static CREDUIWIN_IN_CRED_ONLY => 32

    /**
     * @type {Integer (UInt32)}
     */
    static CREDUIWIN_ENUMERATE_ADMINS => 256

    /**
     * @type {Integer (UInt32)}
     */
    static CREDUIWIN_ENUMERATE_CURRENT_USER => 512

    /**
     * @type {Integer (UInt32)}
     */
    static CREDUIWIN_SECURE_PROMPT => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static CREDUIWIN_PREPROMPTING => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static CREDUIWIN_PACK_32_WOW => 268435456
}
