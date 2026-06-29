#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct STGOP {
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
    static STGOP_MOVE => 1

    /**
     * @type {Integer (Int32)}
     */
    static STGOP_COPY => 2

    /**
     * @type {Integer (Int32)}
     */
    static STGOP_SYNC => 3

    /**
     * @type {Integer (Int32)}
     */
    static STGOP_REMOVE => 5

    /**
     * @type {Integer (Int32)}
     */
    static STGOP_RENAME => 6

    /**
     * @type {Integer (Int32)}
     */
    static STGOP_APPLYPROPERTIES => 8

    /**
     * @type {Integer (Int32)}
     */
    static STGOP_NEW => 10
}
