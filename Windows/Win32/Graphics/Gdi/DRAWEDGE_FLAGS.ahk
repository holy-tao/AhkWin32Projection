#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct DRAWEDGE_FLAGS {
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
    static BDR_RAISEDOUTER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static BDR_SUNKENOUTER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static BDR_RAISEDINNER => 4

    /**
     * @type {Integer (UInt32)}
     */
    static BDR_SUNKENINNER => 8

    /**
     * @type {Integer (UInt32)}
     */
    static BDR_OUTER => 3

    /**
     * @type {Integer (UInt32)}
     */
    static BDR_INNER => 12

    /**
     * @type {Integer (UInt32)}
     */
    static BDR_RAISED => 5

    /**
     * @type {Integer (UInt32)}
     */
    static BDR_SUNKEN => 10

    /**
     * @type {Integer (UInt32)}
     */
    static EDGE_RAISED => 5

    /**
     * @type {Integer (UInt32)}
     */
    static EDGE_SUNKEN => 10

    /**
     * @type {Integer (UInt32)}
     */
    static EDGE_ETCHED => 6

    /**
     * @type {Integer (UInt32)}
     */
    static EDGE_BUMP => 9
}
