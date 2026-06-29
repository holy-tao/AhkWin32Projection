#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct EMBEDDED_FONT_PRIV_STATUS {
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
    static EMBED_PREVIEWPRINT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static EMBED_EDITABLE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static EMBED_INSTALLABLE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static EMBED_NOEMBEDDING => 4
}
