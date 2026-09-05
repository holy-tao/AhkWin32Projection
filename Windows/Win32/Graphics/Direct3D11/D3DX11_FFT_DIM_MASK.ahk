#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Number of dimensions for FFT data.
 * @see https://learn.microsoft.com/windows/win32/api/d3dcsx/ne-d3dcsx-d3dx11_fft_dim_mask
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
class D3DX11_FFT_DIM_MASK extends Win32Enum {

    /**
     * One dimension.
     * Native name: D3DX11_FFT_DIM_MASK_1D
     * @type {Integer (Int32)}
     */
    static 1D => 1

    /**
     * Two dimensions.
     * Native name: D3DX11_FFT_DIM_MASK_2D
     * @type {Integer (Int32)}
     */
    static 2D => 3

    /**
     * Three dimensions.
     * Native name: D3DX11_FFT_DIM_MASK_3D
     * @type {Integer (Int32)}
     */
    static 3D => 7
}
