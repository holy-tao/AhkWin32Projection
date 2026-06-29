#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct ATF_FLAGS {
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
    static ATF_TIMEOUTON => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ATF_ONOFFFEEDBACK => 2
}
