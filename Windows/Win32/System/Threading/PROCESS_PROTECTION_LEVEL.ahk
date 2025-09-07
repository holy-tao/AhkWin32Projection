#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.Threading
 * @version v4.0.30319
 */
class PROCESS_PROTECTION_LEVEL{

    /**
     * @type {Integer (UInt32)}
     */
    static PROTECTION_LEVEL_WINTCB_LIGHT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PROTECTION_LEVEL_WINDOWS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PROTECTION_LEVEL_WINDOWS_LIGHT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PROTECTION_LEVEL_ANTIMALWARE_LIGHT => 3

    /**
     * @type {Integer (UInt32)}
     */
    static PROTECTION_LEVEL_LSA_LIGHT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PROTECTION_LEVEL_WINTCB => 5

    /**
     * @type {Integer (UInt32)}
     */
    static PROTECTION_LEVEL_CODEGEN_LIGHT => 6

    /**
     * @type {Integer (UInt32)}
     */
    static PROTECTION_LEVEL_AUTHENTICODE => 7

    /**
     * @type {Integer (UInt32)}
     */
    static PROTECTION_LEVEL_PPL_APP => 8

    /**
     * @type {Integer (UInt32)}
     */
    static PROTECTION_LEVEL_NONE => 4294967294
}
