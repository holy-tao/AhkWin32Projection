#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_MIRACAST_DRIVER_TYPE {
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
    static D3DKMT_MIRACAST_DRIVER_NOT_SUPPORTED => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_MIRACAST_DRIVER_IHV => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_MIRACAST_DRIVER_MS => 2
}
