#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_WORK_GRAPH_FLAGS {
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
    static D3D12_WORK_GRAPH_FLAG_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_WORK_GRAPH_FLAG_INCLUDE_ALL_AVAILABLE_NODES => 1
}
