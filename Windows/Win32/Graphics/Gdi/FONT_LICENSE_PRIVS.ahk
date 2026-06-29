#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct FONT_LICENSE_PRIVS {
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
    static LICENSE_PREVIEWPRINT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static LICENSE_EDITABLE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static LICENSE_INSTALLABLE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static LICENSE_NOEMBEDDING => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LICENSE_DEFAULT => 0
}
