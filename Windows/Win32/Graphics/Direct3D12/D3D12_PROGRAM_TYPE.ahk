#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_PROGRAM_TYPE {
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
    static D3D12_PROGRAM_TYPE_GENERIC_PIPELINE => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_PROGRAM_TYPE_RAYTRACING_PIPELINE => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_PROGRAM_TYPE_WORK_GRAPH => 5
}
