#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes flags that are used to create a device context state object (ID3DDeviceContextState) with the ID3D11Device1::CreateDeviceContextState method.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11_1/ne-d3d11_1-d3d11_1_create_device_context_state_flag
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct D3D11_1_CREATE_DEVICE_CONTEXT_STATE_FLAG {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * You use this flag if your application will only call methods of Direct3D 11 and Direct3D 10 interfaces from a single thread. By default, Direct3D 11 and Direct3D 10 are  <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-render-multi-thread-differences">thread-safe</a>. 
     *         By using this flag, you can increase performance. However, if you use this flag and your application calls methods from multiple threads, undefined behavior might result.
     * @type {Integer (Int32)}
     */
    static D3D11_1_CREATE_DEVICE_CONTEXT_STATE_SINGLETHREADED => 1
}
