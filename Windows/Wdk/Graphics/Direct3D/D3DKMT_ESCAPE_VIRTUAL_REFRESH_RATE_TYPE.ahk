#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_ESCAPE_VIRTUAL_REFRESH_RATE_TYPE {
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
    static D3DKMT_ESCAPE_VIRTUAL_REFRESH_RATE_TYPE_SET_BASE_DESKTOP_DURATION => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_ESCAPE_VIRTUAL_REFRESH_RATE_TYPE_SET_VSYNC_MULTIPLIER => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_ESCAPE_VIRTUAL_REFRESH_RATE_TYPE_SET_PROCESS_BOOST_ELIGIBLE => 2
}
