#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Device context options.
 * @remarks
 * This enumeration is used by <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-gettype">ID3D11DeviceContext::GetType</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/ne-d3d11-d3d11_device_context_type
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct D3D11_DEVICE_CONTEXT_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The device context is an immediate context.
     * @type {Integer (Int32)}
     */
    static D3D11_DEVICE_CONTEXT_IMMEDIATE => 0

    /**
     * The device context is a deferred context.
     * @type {Integer (Int32)}
     */
    static D3D11_DEVICE_CONTEXT_DEFERRED => 1
}
