#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.InteractionContext
 */
export default struct TRANSLATION_PARAMETER {
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
    static TRANSLATION_PARAMETER_MIN_CONTACT_COUNT => 0

    /**
     * @type {Integer (Int32)}
     */
    static TRANSLATION_PARAMETER_MAX_CONTACT_COUNT => 1

    /**
     * @type {Integer (Int32)}
     */
    static TRANSLATION_PARAMETER_MAX => -1
}
