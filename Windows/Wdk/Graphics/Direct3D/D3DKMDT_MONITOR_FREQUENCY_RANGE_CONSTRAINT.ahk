#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMDT_MONITOR_FREQUENCY_RANGE_CONSTRAINT {
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
    static D3DKMDT_MFRC_UNINITIALIZED => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_MFRC_ACTIVESIZE => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_MFRC_MAXPIXELRATE => 2
}
