#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMDT_MONITOR_ORIENTATION {
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
    static D3DKMDT_MO_UNINITIALIZED => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_MO_0DEG => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_MO_90DEG => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_MO_180DEG => 3

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_MO_270DEG => 4
}
