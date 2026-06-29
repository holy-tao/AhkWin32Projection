#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Threading
 */
export default struct THREAD_CREATION_FLAGS {
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
    static THREAD_CREATE_RUN_IMMEDIATELY => 0

    /**
     * @type {Integer (UInt32)}
     */
    static THREAD_CREATE_SUSPENDED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static STACK_SIZE_PARAM_IS_A_RESERVATION => 65536
}
