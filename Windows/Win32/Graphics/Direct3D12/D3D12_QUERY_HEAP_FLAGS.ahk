#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_QUERY_HEAP_FLAGS {
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
    static D3D12_QUERY_HEAP_FLAG_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_QUERY_HEAP_FLAG_CPU_RESOLVE => 1
}
