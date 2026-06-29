#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_COMPILER_VALUE_TYPE_FLAGS {
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
    static D3D12_COMPILER_VALUE_TYPE_FLAGS_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_COMPILER_VALUE_TYPE_FLAGS_OBJECT_CODE => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_COMPILER_VALUE_TYPE_FLAGS_METADATA => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_COMPILER_VALUE_TYPE_FLAGS_DEBUG_PDB => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_COMPILER_VALUE_TYPE_FLAGS_PERFORMANCE_DATA => 8
}
