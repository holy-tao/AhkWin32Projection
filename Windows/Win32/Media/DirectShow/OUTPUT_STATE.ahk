#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct OUTPUT_STATE {
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
    static Disabled => 0

    /**
     * @type {Integer (Int32)}
     */
    static ReadData => 1

    /**
     * @type {Integer (Int32)}
     */
    static RenderData => 2
}
