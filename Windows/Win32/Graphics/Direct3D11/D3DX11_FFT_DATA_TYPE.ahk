#Requires AutoHotkey v2.0.0 64-bit

/**
 * FFT data types.
 * @see https://learn.microsoft.com/windows/win32/api/d3dcsx/ne-d3dcsx-d3dx11_fft_data_type
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3DX11_FFT_DATA_TYPE{

    /**
     * Real numbers.
     * @type {Integer (Int32)}
     */
    static D3DX11_FFT_DATA_TYPE_REAL => 0

    /**
     * Complex numbers.
     * @type {Integer (Int32)}
     */
    static D3DX11_FFT_DATA_TYPE_COMPLEX => 1
}
