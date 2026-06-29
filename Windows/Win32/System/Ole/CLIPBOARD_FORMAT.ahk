#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ole
 */
export default struct CLIPBOARD_FORMAT {
    value : UInt16

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (UInt16)}
     */
    static CF_TEXT => 1

    /**
     * @type {Integer (UInt16)}
     */
    static CF_BITMAP => 2

    /**
     * @type {Integer (UInt16)}
     */
    static CF_METAFILEPICT => 3

    /**
     * @type {Integer (UInt16)}
     */
    static CF_SYLK => 4

    /**
     * @type {Integer (UInt16)}
     */
    static CF_DIF => 5

    /**
     * @type {Integer (UInt16)}
     */
    static CF_TIFF => 6

    /**
     * @type {Integer (UInt16)}
     */
    static CF_OEMTEXT => 7

    /**
     * @type {Integer (UInt16)}
     */
    static CF_DIB => 8

    /**
     * @type {Integer (UInt16)}
     */
    static CF_PALETTE => 9

    /**
     * @type {Integer (UInt16)}
     */
    static CF_PENDATA => 10

    /**
     * @type {Integer (UInt16)}
     */
    static CF_RIFF => 11

    /**
     * @type {Integer (UInt16)}
     */
    static CF_WAVE => 12

    /**
     * @type {Integer (UInt16)}
     */
    static CF_UNICODETEXT => 13

    /**
     * @type {Integer (UInt16)}
     */
    static CF_ENHMETAFILE => 14

    /**
     * @type {Integer (UInt16)}
     */
    static CF_HDROP => 15

    /**
     * @type {Integer (UInt16)}
     */
    static CF_LOCALE => 16

    /**
     * @type {Integer (UInt16)}
     */
    static CF_DIBV5 => 17

    /**
     * @type {Integer (UInt16)}
     */
    static CF_MAX => 18

    /**
     * @type {Integer (UInt16)}
     */
    static CF_OWNERDISPLAY => 128

    /**
     * @type {Integer (UInt16)}
     */
    static CF_DSPTEXT => 129

    /**
     * @type {Integer (UInt16)}
     */
    static CF_DSPBITMAP => 130

    /**
     * @type {Integer (UInt16)}
     */
    static CF_DSPMETAFILEPICT => 131

    /**
     * @type {Integer (UInt16)}
     */
    static CF_DSPENHMETAFILE => 142

    /**
     * @type {Integer (UInt16)}
     */
    static CF_PRIVATEFIRST => 512

    /**
     * @type {Integer (UInt16)}
     */
    static CF_PRIVATELAST => 767

    /**
     * @type {Integer (UInt16)}
     */
    static CF_GDIOBJFIRST => 768

    /**
     * @type {Integer (UInt16)}
     */
    static CF_GDIOBJLAST => 1023
}
