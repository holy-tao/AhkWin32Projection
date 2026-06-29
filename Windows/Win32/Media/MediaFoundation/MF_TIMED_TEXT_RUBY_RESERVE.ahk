#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MF_TIMED_TEXT_RUBY_RESERVE {
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
    static MF_TIMED_TEXT_RUBY_RESERVE_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static MF_TIMED_TEXT_RUBY_RESERVE_BEFORE => 1

    /**
     * @type {Integer (Int32)}
     */
    static MF_TIMED_TEXT_RUBY_RESERVE_AFTER => 2

    /**
     * @type {Integer (Int32)}
     */
    static MF_TIMED_TEXT_RUBY_RESERVE_BOTH => 3

    /**
     * @type {Integer (Int32)}
     */
    static MF_TIMED_TEXT_RUBY_RESERVE_OUTSIDE => 4
}
