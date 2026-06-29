#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies what to clear from the depth stencil view.
 * @remarks
 * This enum is used by <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12graphicscommandlist-cleardepthstencilview">ID3D12GraphicsCommandList::ClearDepthStencilView</a>.
 *           The flags can be combined to clear all.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_clear_flags
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_CLEAR_FLAGS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Indicates the depth buffer should be cleared.
     * @type {Integer (Int32)}
     */
    static D3D12_CLEAR_FLAG_DEPTH => 1

    /**
     * Indicates the stencil buffer should be cleared.
     * @type {Integer (Int32)}
     */
    static D3D12_CLEAR_FLAG_STENCIL => 2
}
