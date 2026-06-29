#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMDT_VIDPN_PRESENT_PATH_COPYPROTECTION_TYPE {
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
    static D3DKMDT_VPPMT_UNINITIALIZED => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_VPPMT_NOPROTECTION => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_VPPMT_MACROVISION_APSTRIGGER => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_VPPMT_MACROVISION_FULLSUPPORT => 3
}
