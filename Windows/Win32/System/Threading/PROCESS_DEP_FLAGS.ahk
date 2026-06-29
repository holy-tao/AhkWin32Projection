#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Threading
 */
export default struct PROCESS_DEP_FLAGS {
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
    static PROCESS_DEP_ENABLE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESS_DEP_DISABLE_ATL_THUNK_EMULATION => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESS_DEP_NONE => 0
}
