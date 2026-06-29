#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3DX11_FFT_DATA_TYPE.ahk" { D3DX11_FFT_DATA_TYPE }

/**
 * Describes an FFT.
 * @see https://learn.microsoft.com/windows/win32/api/d3dcsx/ns-d3dcsx-d3dx11_fft_desc
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct D3DX11_FFT_DESC {
    #StructPack 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of dimension in the FFT.
     */
    NumDimensions : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a>[D3DX11_FFT_MAX_DIMENSIONS]</b>
     * 
     * Length of each dimension in the FFT.
     */
    ElementLengths : UInt32[32]

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Combination of <a href="https://docs.microsoft.com/windows/desktop/api/d3dcsx/ne-d3dcsx-d3dx11_fft_dim_mask">D3DX11_FFT_DIM_MASK</a> flags indicating the  dimensions to transform.
     */
    DimensionMask : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3dcsx/ne-d3dcsx-d3dx11_fft_data_type">D3DX11_FFT_DATA_TYPE</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3dcsx/ne-d3dcsx-d3dx11_fft_data_type">D3DX11_FFT_DATA_TYPE</a> flag indicating the type of data being transformed.
     */
    Type : D3DX11_FFT_DATA_TYPE

}
