#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
export default struct SYSTEM_CURSOR_ID {
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
    static OCR_APPSTARTING => 32650

    /**
     * @type {Integer (UInt32)}
     */
    static OCR_NORMAL => 32512

    /**
     * @type {Integer (UInt32)}
     */
    static OCR_CROSS => 32515

    /**
     * @type {Integer (UInt32)}
     */
    static OCR_HAND => 32649

    /**
     * @type {Integer (UInt32)}
     */
    static OCR_HELP => 32651

    /**
     * @type {Integer (UInt32)}
     */
    static OCR_IBEAM => 32513

    /**
     * @type {Integer (UInt32)}
     */
    static OCR_NO => 32648

    /**
     * @type {Integer (UInt32)}
     */
    static OCR_SIZEALL => 32646

    /**
     * @type {Integer (UInt32)}
     */
    static OCR_SIZENESW => 32643

    /**
     * @type {Integer (UInt32)}
     */
    static OCR_SIZENS => 32645

    /**
     * @type {Integer (UInt32)}
     */
    static OCR_SIZENWSE => 32642

    /**
     * @type {Integer (UInt32)}
     */
    static OCR_SIZEWE => 32644

    /**
     * @type {Integer (UInt32)}
     */
    static OCR_UP => 32516

    /**
     * @type {Integer (UInt32)}
     */
    static OCR_WAIT => 32514
}
