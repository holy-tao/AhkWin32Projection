#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct DXGKDT_OPM_DVI_CHARACTERISTICS {
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
    static DXGKMDT_OPM_DVI_CHARACTERISTIC_1_0 => 1

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMDT_OPM_DVI_CHARACTERISTIC_1_1_OR_ABOVE => 2
}
