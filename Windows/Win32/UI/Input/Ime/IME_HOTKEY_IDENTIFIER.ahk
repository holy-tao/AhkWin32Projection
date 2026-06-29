#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Input.Ime
 */
export default struct IME_HOTKEY_IDENTIFIER {
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
    static IME_CHOTKEY_IME_NONIME_TOGGLE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static IME_CHOTKEY_SHAPE_TOGGLE => 17

    /**
     * @type {Integer (UInt32)}
     */
    static IME_CHOTKEY_SYMBOL_TOGGLE => 18

    /**
     * @type {Integer (UInt32)}
     */
    static IME_JHOTKEY_CLOSE_OPEN => 48

    /**
     * @type {Integer (UInt32)}
     */
    static IME_KHOTKEY_SHAPE_TOGGLE => 80

    /**
     * @type {Integer (UInt32)}
     */
    static IME_KHOTKEY_HANJACONVERT => 81

    /**
     * @type {Integer (UInt32)}
     */
    static IME_KHOTKEY_ENGLISH => 82

    /**
     * @type {Integer (UInt32)}
     */
    static IME_THOTKEY_IME_NONIME_TOGGLE => 112

    /**
     * @type {Integer (UInt32)}
     */
    static IME_THOTKEY_SHAPE_TOGGLE => 113

    /**
     * @type {Integer (UInt32)}
     */
    static IME_THOTKEY_SYMBOL_TOGGLE => 114

    /**
     * @type {Integer (UInt32)}
     */
    static IME_ITHOTKEY_RESEND_RESULTSTR => 512

    /**
     * @type {Integer (UInt32)}
     */
    static IME_ITHOTKEY_PREVIOUS_COMPOSITION => 513

    /**
     * @type {Integer (UInt32)}
     */
    static IME_ITHOTKEY_UISTYLE_TOGGLE => 514

    /**
     * @type {Integer (UInt32)}
     */
    static IME_ITHOTKEY_RECONVERTSTRING => 515
}
