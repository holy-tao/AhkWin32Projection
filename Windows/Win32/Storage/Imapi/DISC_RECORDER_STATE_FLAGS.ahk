#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Imapi
 */
export default struct DISC_RECORDER_STATE_FLAGS {
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
    static RECORDER_BURNING => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RECORDER_DOING_NOTHING => 0

    /**
     * @type {Integer (UInt32)}
     */
    static RECORDER_OPENED => 1
}
