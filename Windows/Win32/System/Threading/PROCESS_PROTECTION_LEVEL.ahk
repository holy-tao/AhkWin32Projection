#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Threading
 */
class PROCESS_PROTECTION_LEVEL extends Win32Enum {

    /**
     * Native name: PROTECTION_LEVEL_WINTCB_LIGHT
     * @type {Integer (UInt32)}
     */
    static WINTCB_LIGHT => 0

    /**
     * Native name: PROTECTION_LEVEL_WINDOWS
     * @type {Integer (UInt32)}
     */
    static WINDOWS => 1

    /**
     * Native name: PROTECTION_LEVEL_WINDOWS_LIGHT
     * @type {Integer (UInt32)}
     */
    static WINDOWS_LIGHT => 2

    /**
     * Native name: PROTECTION_LEVEL_ANTIMALWARE_LIGHT
     * @type {Integer (UInt32)}
     */
    static ANTIMALWARE_LIGHT => 3

    /**
     * Native name: PROTECTION_LEVEL_LSA_LIGHT
     * @type {Integer (UInt32)}
     */
    static LSA_LIGHT => 4

    /**
     * Native name: PROTECTION_LEVEL_WINTCB
     * @type {Integer (UInt32)}
     */
    static WINTCB => 5

    /**
     * Native name: PROTECTION_LEVEL_CODEGEN_LIGHT
     * @type {Integer (UInt32)}
     */
    static CODEGEN_LIGHT => 6

    /**
     * Native name: PROTECTION_LEVEL_AUTHENTICODE
     * @type {Integer (UInt32)}
     */
    static AUTHENTICODE => 7

    /**
     * Native name: PROTECTION_LEVEL_PPL_APP
     * @type {Integer (UInt32)}
     */
    static PPL_APP => 8

    /**
     * Native name: PROTECTION_LEVEL_NONE
     * @type {Integer (UInt32)}
     */
    static NONE => 4294967294
}
