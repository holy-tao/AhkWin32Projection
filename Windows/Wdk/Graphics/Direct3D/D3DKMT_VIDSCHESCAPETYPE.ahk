#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_VIDSCHESCAPETYPE {
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
    static D3DKMT_VIDSCHESCAPETYPE_PREEMPTIONCONTROL => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_VIDSCHESCAPETYPE_SUSPENDSCHEDULER => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_VIDSCHESCAPETYPE_TDRCONTROL => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_VIDSCHESCAPETYPE_SUSPENDRESUME => 3

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_VIDSCHESCAPETYPE_ENABLECONTEXTDELAY => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_VIDSCHESCAPETYPE_CONFIGURE_TDR_LIMIT => 5

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_VIDSCHESCAPETYPE_VGPU_RESET => 6

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_VIDSCHESCAPETYPE_PFN_CONTROL => 7

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_VIDSCHESCAPETYPE_VIRTUAL_REFRESH_RATE => 8
}
