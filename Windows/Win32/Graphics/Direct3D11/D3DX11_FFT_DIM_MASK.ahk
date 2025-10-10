#Requires AutoHotkey v2.0.0 64-bit

/**
 * Number of dimensions for FFT data.
 * @see https://docs.microsoft.com/windows/win32/api//d3dcsx/ne-d3dcsx-d3dx11_fft_dim_mask
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3DX11_FFT_DIM_MASK{

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
