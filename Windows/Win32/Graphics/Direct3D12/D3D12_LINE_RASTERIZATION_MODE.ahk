#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_LINE_RASTERIZATION_MODE {
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
    static D3D12_LINE_RASTERIZATION_MODE_ALIASED => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_LINE_RASTERIZATION_MODE_ALPHA_ANTIALIASED => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_LINE_RASTERIZATION_MODE_QUADRILATERAL_WIDE => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_LINE_RASTERIZATION_MODE_QUADRILATERAL_NARROW => 3
}
