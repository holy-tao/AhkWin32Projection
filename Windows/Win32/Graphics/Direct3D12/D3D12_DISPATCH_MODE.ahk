#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_DISPATCH_MODE {
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
    static D3D12_DISPATCH_MODE_NODE_CPU_INPUT => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_DISPATCH_MODE_NODE_GPU_INPUT => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_DISPATCH_MODE_MULTI_NODE_CPU_INPUT => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_DISPATCH_MODE_MULTI_NODE_GPU_INPUT => 3
}
