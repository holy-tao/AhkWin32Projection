#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct GET_DCX_FLAGS {
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
    static DCX_WINDOW => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DCX_CACHE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DCX_PARENTCLIP => 32

    /**
     * @type {Integer (UInt32)}
     */
    static DCX_CLIPSIBLINGS => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DCX_CLIPCHILDREN => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DCX_NORESETATTRS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DCX_LOCKWINDOWUPDATE => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static DCX_EXCLUDERGN => 64

    /**
     * @type {Integer (UInt32)}
     */
    static DCX_INTERSECTRGN => 128

    /**
     * @type {Integer (UInt32)}
     */
    static DCX_INTERSECTUPDATE => 512

    /**
     * @type {Integer (UInt32)}
     */
    static DCX_VALIDATE => 2097152
}
