#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct REDRAW_WINDOW_FLAGS {
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
    static RDW_INVALIDATE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RDW_INTERNALPAINT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RDW_ERASE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static RDW_VALIDATE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static RDW_NOINTERNALPAINT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static RDW_NOERASE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static RDW_NOCHILDREN => 64

    /**
     * @type {Integer (UInt32)}
     */
    static RDW_ALLCHILDREN => 128

    /**
     * @type {Integer (UInt32)}
     */
    static RDW_UPDATENOW => 256

    /**
     * @type {Integer (UInt32)}
     */
    static RDW_ERASENOW => 512

    /**
     * @type {Integer (UInt32)}
     */
    static RDW_FRAME => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static RDW_NOFRAME => 2048
}
