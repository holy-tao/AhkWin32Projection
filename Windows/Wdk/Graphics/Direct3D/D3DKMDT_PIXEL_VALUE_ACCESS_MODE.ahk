#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMDT_PIXEL_VALUE_ACCESS_MODE {
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
    static D3DKMDT_PVAM_UNINITIALIZED => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_PVAM_DIRECT => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_PVAM_PRESETPALETTE => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_PVAM_SETTABLEPALETTE => 3
}
