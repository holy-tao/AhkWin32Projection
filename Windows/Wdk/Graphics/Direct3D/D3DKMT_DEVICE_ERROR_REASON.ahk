#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_DEVICE_ERROR_REASON {
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
    static D3DKMT_DEVICE_ERROR_REASON_GENERIC => -2147483648

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_DEVICE_ERROR_REASON_DRIVER_ERROR => -2147483642
}
