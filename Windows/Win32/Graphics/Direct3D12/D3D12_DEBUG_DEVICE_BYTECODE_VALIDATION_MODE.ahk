#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_DEBUG_DEVICE_BYTECODE_VALIDATION_MODE {
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
    static D3D12_DEBUG_DEVICE_BYTECODE_VALIDATION_DISABLED => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_DEBUG_DEVICE_BYTECODE_VALIDATION_WHEN_HASH_BYPASSED => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_DEBUG_DEVICE_BYTECODE_VALIDATION_ALL_BYTECODE => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_DEBUG_DEVICE_BYTECODE_VALIDATION_MODE_DEFAULT => 1
}
