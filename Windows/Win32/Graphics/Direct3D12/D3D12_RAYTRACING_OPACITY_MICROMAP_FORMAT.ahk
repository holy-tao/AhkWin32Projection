#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_RAYTRACING_OPACITY_MICROMAP_FORMAT {
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
    static D3D12_RAYTRACING_OPACITY_MICROMAP_FORMAT_OC1_2_STATE => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_RAYTRACING_OPACITY_MICROMAP_FORMAT_OC1_4_STATE => 2
}
