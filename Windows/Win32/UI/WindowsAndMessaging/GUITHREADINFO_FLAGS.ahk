#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
export default struct GUITHREADINFO_FLAGS {
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
    static GUI_CARETBLINKING => 1

    /**
     * @type {Integer (UInt32)}
     */
    static GUI_INMENUMODE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static GUI_INMOVESIZE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static GUI_POPUPMENUMODE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static GUI_SYSTEMMENUMODE => 8
}
