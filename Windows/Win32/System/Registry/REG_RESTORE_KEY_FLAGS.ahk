#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Registry
 */
export default struct REG_RESTORE_KEY_FLAGS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static REG_FORCE_RESTORE => 8

    /**
     * @type {Integer (Int32)}
     */
    static REG_WHOLE_HIVE_VOLATILE => 1
}
