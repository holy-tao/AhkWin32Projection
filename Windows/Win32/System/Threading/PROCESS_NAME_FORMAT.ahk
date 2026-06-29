#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Threading
 */
export default struct PROCESS_NAME_FORMAT {
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
    static PROCESS_NAME_WIN32 => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESS_NAME_NATIVE => 1
}
