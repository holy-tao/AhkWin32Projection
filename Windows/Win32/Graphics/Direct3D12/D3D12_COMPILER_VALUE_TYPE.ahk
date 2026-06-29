#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_COMPILER_VALUE_TYPE {
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
    static D3D12_COMPILER_VALUE_TYPE_OBJECT_CODE => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_COMPILER_VALUE_TYPE_METADATA => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_COMPILER_VALUE_TYPE_DEBUG_PDB => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_COMPILER_VALUE_TYPE_PERFORMANCE_DATA => 3
}
