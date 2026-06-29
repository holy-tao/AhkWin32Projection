#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Input.Ime
 */
export default struct IME_SENTENCE_MODE {
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
    static IME_SMODE_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static IME_SMODE_PLAURALCLAUSE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IME_SMODE_SINGLECONVERT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IME_SMODE_AUTOMATIC => 4

    /**
     * @type {Integer (UInt32)}
     */
    static IME_SMODE_PHRASEPREDICT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static IME_SMODE_CONVERSATION => 16

    /**
     * @type {Integer (UInt32)}
     */
    static IME_SMODE_RESERVED => 61440
}
