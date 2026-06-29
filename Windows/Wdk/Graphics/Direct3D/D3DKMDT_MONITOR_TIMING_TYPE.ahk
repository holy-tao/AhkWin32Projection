#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMDT_MONITOR_TIMING_TYPE {
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
    static D3DKMDT_MTT_UNINITIALIZED => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_MTT_ESTABLISHED => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_MTT_STANDARD => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_MTT_EXTRASTANDARD => 3

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_MTT_DETAILED => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_MTT_DEFAULTMONITORPROFILE => 5

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_MTT_DRIVER => 6
}
