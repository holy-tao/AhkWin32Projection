#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct DVD_PLAY_DIRECTION {
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
    static DVD_DIR_FORWARD => 0

    /**
     * @type {Integer (Int32)}
     */
    static DVD_DIR_BACKWARD => 1
}
