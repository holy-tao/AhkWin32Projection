#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_DRED_DEVICE_STATE {
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
    static D3D12_DRED_DEVICE_STATE_UNKNOWN => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_DRED_DEVICE_STATE_HUNG => 3

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_DRED_DEVICE_STATE_FAULT => 6

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_DRED_DEVICE_STATE_PAGEFAULT => 7
}
