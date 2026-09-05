#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * FFT data types.
 * @see https://learn.microsoft.com/windows/win32/api/d3dcsx/ne-d3dcsx-d3dx11_fft_data_type
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
class D3DX11_FFT_DATA_TYPE extends Win32Enum {

    /**
     * Real numbers.
     * Native name: D3DX11_FFT_DATA_TYPE_REAL
     * @type {Integer (Int32)}
     */
    static REAL => 0

    /**
     * Complex numbers.
     * Native name: D3DX11_FFT_DATA_TYPE_COMPLEX
     * @type {Integer (Int32)}
     */
    static COMPLEX => 1
}
