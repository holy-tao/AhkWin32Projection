#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
export default struct GDI_IMAGE_TYPE {
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
    static IMAGE_BITMAP => 0

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_CURSOR => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_ICON => 1
}
