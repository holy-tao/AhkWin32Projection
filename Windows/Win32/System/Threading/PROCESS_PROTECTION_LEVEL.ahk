#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Threading
 */
export default struct PROCESS_PROTECTION_LEVEL {
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
