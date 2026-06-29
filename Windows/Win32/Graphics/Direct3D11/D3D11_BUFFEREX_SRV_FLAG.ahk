#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Identifies how to view a buffer resource. (D3D11_BUFFEREX_SRV_FLAG)
 * @remarks
 * This enumeration is used by <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_bufferex_srv">D3D11_BUFFEREX_SRV</a>
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/ne-d3d11-d3d11_bufferex_srv_flag
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct D3D11_BUFFEREX_SRV_FLAG {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * View the buffer as raw. For more info about raw viewing of buffers, see <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-resources-intro">Raw Views of Buffers</a>.
     * @type {Integer (Int32)}
     */
    static D3D11_BUFFEREX_SRV_FLAG_RAW => 1
}
