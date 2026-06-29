#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.ProcessStatus
 */
export default struct ENUM_PROCESS_MODULES_EX_FLAGS {
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
    static LIST_MODULES_ALL => 3

    /**
     * @type {Integer (UInt32)}
     */
    static LIST_MODULES_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static LIST_MODULES_32BIT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LIST_MODULES_64BIT => 2
}
