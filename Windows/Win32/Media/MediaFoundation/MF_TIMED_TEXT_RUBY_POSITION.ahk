#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MF_TIMED_TEXT_RUBY_POSITION {
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
    static MF_TIMED_TEXT_RUBY_POSITION_BEFORE => 0

    /**
     * @type {Integer (Int32)}
     */
    static MF_TIMED_TEXT_RUBY_POSITION_AFTER => 1

    /**
     * @type {Integer (Int32)}
     */
    static MF_TIMED_TEXT_RUBY_POSITION_OUTSIDE => 2
}
