#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * FFT data types.
 * @see https://learn.microsoft.com/windows/win32/api/d3dcsx/ne-d3dcsx-d3dx11_fft_data_type
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct D3DX11_FFT_DATA_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
