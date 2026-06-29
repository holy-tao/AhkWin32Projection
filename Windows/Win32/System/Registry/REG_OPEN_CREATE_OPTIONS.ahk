#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Registry
 */
export default struct REG_OPEN_CREATE_OPTIONS {
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
    static REG_OPTION_RESERVED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static REG_OPTION_NON_VOLATILE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static REG_OPTION_VOLATILE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static REG_OPTION_CREATE_LINK => 2

    /**
     * @type {Integer (UInt32)}
     */
    static REG_OPTION_BACKUP_RESTORE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static REG_OPTION_OPEN_LINK => 8

    /**
     * @type {Integer (UInt32)}
     */
    static REG_OPTION_DONT_VIRTUALIZE => 16
}
