#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct GET_CHARACTER_PLACEMENT_FLAGS {
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
    static GCP_CLASSIN => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static GCP_DIACRITIC => 256

    /**
     * @type {Integer (UInt32)}
     */
    static GCP_DISPLAYZWG => 4194304

    /**
     * @type {Integer (UInt32)}
     */
    static GCP_GLYPHSHAPE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static GCP_JUSTIFY => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static GCP_KASHIDA => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static GCP_LIGATE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static GCP_MAXEXTENT => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static GCP_NEUTRALOVERRIDE => 33554432

    /**
     * @type {Integer (UInt32)}
     */
    static GCP_NUMERICOVERRIDE => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static GCP_NUMERICSLATIN => 67108864

    /**
     * @type {Integer (UInt32)}
     */
    static GCP_NUMERICSLOCAL => 134217728

    /**
     * @type {Integer (UInt32)}
     */
    static GCP_REORDER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static GCP_SYMSWAPOFF => 8388608

    /**
     * @type {Integer (UInt32)}
     */
    static GCP_USEKERNING => 8
}
