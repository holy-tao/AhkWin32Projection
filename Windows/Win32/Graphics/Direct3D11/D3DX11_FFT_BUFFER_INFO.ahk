#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes buffer requirements for an FFT.
 * @remarks
 * The <b>D3DX11_FFT_BUFFER_INFO</b> structure is initialized by a call to one of the create-FFT functions
 *           (for example, <a href="https://docs.microsoft.com/windows/desktop/api/d3dcsx/nf-d3dcsx-d3dx11createfft">D3DX11CreateFFT</a>).
 *           For more create-FFT functions, see <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d11-graphics-reference-d3dcsx11-functions">D3DCSX 11 Functions</a>.
 *         
 * 
 * Use the info in <b>D3DX11_FFT_BUFFER_INFO</b> to allocate raw buffers of the specified (or larger) sizes and then call the <a href="https://docs.microsoft.com/windows/desktop/api/d3dcsx/nf-d3dcsx-id3dx11fft-attachbuffersandprecompute">ID3DX11FFT::AttachBuffersAndPrecompute</a> method to register the buffers with the FFT object.
 *         
 * 
 * Some FFT algorithms benefit from precomputing sin and cos. The FFT object might store precomputed data in the user-supplied buffers.
 * @see https://learn.microsoft.com/windows/win32/api/d3dcsx/ns-d3dcsx-d3dx11_fft_buffer_info
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct D3DX11_FFT_BUFFER_INFO {
    #StructPack 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of temporary buffers needed. 
     *             Allowed range is 0 to <b>D3DX11_FFT_MAX_TEMP_BUFFERS</b>.
     */
    NumTempBufferSizes : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a>[D3DX11_FFT_MAX_TEMP_BUFFERS]</b>
     * 
     * Minimum sizes (in FLOATs) of temporary buffers.
     */
    TempBufferFloatSizes : UInt32[4]

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of precompute buffers required.  
     *             Allowed range is 0 to <b>D3DX11_FFT_MAX_PRECOMPUTE_BUFFERS</b>.
     */
    NumPrecomputeBufferSizes : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a>[D3DX11_FFT_MAX_PRECOMPUTE_BUFFERS]</b>
     * 
     * Minimum sizes (in FLOATs) for precompute buffers.
     */
    PrecomputeBufferFloatSizes : UInt32[4]

}
