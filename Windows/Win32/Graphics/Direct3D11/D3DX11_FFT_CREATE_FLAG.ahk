#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * FFT creation flags.
 * @see https://learn.microsoft.com/windows/win32/api/d3dcsx/ne-d3dcsx-d3dx11_fft_create_flag
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct D3DX11_FFT_CREATE_FLAG {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Do not AddRef or Release temp and precompute buffers, caller is responsible for holding 
     *           references to these buffers.
     * @type {Integer (Int32)}
     */
    static D3DX11_FFT_CREATE_FLAG_NO_PRECOMPUTE_BUFFERS => 1
}
