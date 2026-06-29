#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Number of dimensions for FFT data.
 * @see https://learn.microsoft.com/windows/win32/api/d3dcsx/ne-d3dcsx-d3dx11_fft_dim_mask
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct D3DX11_FFT_DIM_MASK {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * One dimension.
     * @type {Integer (Int32)}
     */
    static D3DX11_FFT_DIM_MASK_1D => 1

    /**
     * Two dimensions.
     * @type {Integer (Int32)}
     */
    static D3DX11_FFT_DIM_MASK_2D => 3

    /**
     * Three dimensions.
     * @type {Integer (Int32)}
     */
    static D3DX11_FFT_DIM_MASK_3D => 7
}
