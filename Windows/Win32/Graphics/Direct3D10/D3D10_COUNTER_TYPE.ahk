#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Data type of a performance counter. (D3D10_COUNTER_TYPE)
 * @remarks
 * These flags are an output parameter in <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-checkcounter">ID3D10Device::CheckCounter</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d10/ne-d3d10-d3d10_counter_type
 * @namespace Windows.Win32.Graphics.Direct3D10
 */
export default struct D3D10_COUNTER_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * 32-bit floating point.
     * @type {Integer (Int32)}
     */
    static D3D10_COUNTER_TYPE_FLOAT32 => 0

    /**
     * 16-bit unsigned integer.
     * @type {Integer (Int32)}
     */
    static D3D10_COUNTER_TYPE_UINT16 => 1

    /**
     * 32-bit unsigned integer.
     * @type {Integer (Int32)}
     */
    static D3D10_COUNTER_TYPE_UINT32 => 2

    /**
     * 64-bit unsigned integer.
     * @type {Integer (Int32)}
     */
    static D3D10_COUNTER_TYPE_UINT64 => 3
}
