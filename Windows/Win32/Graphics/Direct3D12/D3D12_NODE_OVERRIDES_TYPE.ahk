#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_NODE_OVERRIDES_TYPE {
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
    static D3D12_NODE_OVERRIDES_TYPE_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_NODE_OVERRIDES_TYPE_BROADCASTING_LAUNCH => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_NODE_OVERRIDES_TYPE_COALESCING_LAUNCH => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_NODE_OVERRIDES_TYPE_THREAD_LAUNCH => 3

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_NODE_OVERRIDES_TYPE_COMMON_COMPUTE => 4
}
