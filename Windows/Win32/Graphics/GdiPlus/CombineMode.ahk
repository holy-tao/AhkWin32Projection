#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
export default struct CombineMode {
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
    static CombineModeReplace => 0

    /**
     * @type {Integer (Int32)}
     */
    static CombineModeIntersect => 1

    /**
     * @type {Integer (Int32)}
     */
    static CombineModeUnion => 2

    /**
     * @type {Integer (Int32)}
     */
    static CombineModeXor => 3

    /**
     * @type {Integer (Int32)}
     */
    static CombineModeExclude => 4

    /**
     * @type {Integer (Int32)}
     */
    static CombineModeComplement => 5
}
