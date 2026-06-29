#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Threading
 */
export default struct PROCESS_AFFINITY_AUTO_UPDATE_FLAGS {
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
    static PROCESS_AFFINITY_DISABLE_AUTO_UPDATE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESS_AFFINITY_ENABLE_AUTO_UPDATE => 1
}
