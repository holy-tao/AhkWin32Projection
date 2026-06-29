#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct KMT_DISPLAY_UMD_VERSION {
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
    static KMT_DISPLAY_UMDVERSION_1 => 0

    /**
     * @type {Integer (Int32)}
     */
    static NUM_KMT_DISPLAY_UMDVERSIONS => 1
}
