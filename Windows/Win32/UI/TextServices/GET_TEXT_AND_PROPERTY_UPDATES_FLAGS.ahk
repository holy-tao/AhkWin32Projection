#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct GET_TEXT_AND_PROPERTY_UPDATES_FLAGS {
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
    static TF_GTP_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static TF_GTP_INCL_TEXT => 1
}
