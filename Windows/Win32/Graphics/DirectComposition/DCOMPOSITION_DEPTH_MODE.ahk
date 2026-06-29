#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.DirectComposition
 */
export default struct DCOMPOSITION_DEPTH_MODE {
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
    static DCOMPOSITION_DEPTH_MODE_TREE => 0

    /**
     * @type {Integer (Int32)}
     */
    static DCOMPOSITION_DEPTH_MODE_SPATIAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static DCOMPOSITION_DEPTH_MODE_SORTED => 3

    /**
     * @type {Integer (Int32)}
     */
    static DCOMPOSITION_DEPTH_MODE_INHERIT => -1
}
