#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies fence options. (D3D11_FENCE_FLAG)
 * @remarks
 * This enum is used by the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_4/nf-d3d11_4-id3d11device5-createfence">ID3D11Device::CreateFence</a> method.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11_3/ne-d3d11_3-d3d11_fence_flag
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct D3D11_FENCE_FLAG {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * No options are specified.
     * @type {Integer (Int32)}
     */
    static D3D11_FENCE_FLAG_NONE => 0

    /**
     * The fence is shared.
     * @type {Integer (Int32)}
     */
    static D3D11_FENCE_FLAG_SHARED => 2

    /**
     * The fence is shared with another GPU adapter.
     * @type {Integer (Int32)}
     */
    static D3D11_FENCE_FLAG_SHARED_CROSS_ADAPTER => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3D11_FENCE_FLAG_NON_MONITORED => 8
}
