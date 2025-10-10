#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes buffer requirements for an FFT.
 * @remarks
 * 
  * The <b>D3DX11_FFT_BUFFER_INFO</b> structure is initialized by a call to one of the create-FFT functions
  *           (for example, <a href="https://docs.microsoft.com/windows/desktop/api/d3dcsx/nf-d3dcsx-d3dx11createfft">D3DX11CreateFFT</a>).
  *           For more create-FFT functions, see <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d11-graphics-reference-d3dcsx11-functions">D3DCSX 11 Functions</a>.
  *         
  * 
  * Use the info in <b>D3DX11_FFT_BUFFER_INFO</b> to allocate raw buffers of the specified (or larger) sizes and then call the <a href="https://docs.microsoft.com/windows/desktop/api/d3dcsx/nf-d3dcsx-id3dx11fft-attachbuffersandprecompute">ID3DX11FFT::AttachBuffersAndPrecompute</a> method to register the buffers with the FFT object.
  *         
  * 
  * Some FFT algorithms benefit from precomputing sin and cos. The FFT object might store precomputed data in the user-supplied buffers.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3dcsx/ns-d3dcsx-d3dx11_fft_buffer_info
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3DX11_FFT_BUFFER_INFO extends Win32Struct
{
    static sizeof => 40

    static packingSize => 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of temporary buffers needed. 
     *             Allowed range is 0 to <b>D3DX11_FFT_MAX_TEMP_BUFFERS</b>.
     * @type {Integer}
     */
    NumTempBufferSizes {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a>[D3DX11_FFT_MAX_TEMP_BUFFERS]</b>
     * 
     * Minimum sizes (in FLOATs) of temporary buffers.
     * @type {Array<UInt32>}
     */
    TempBufferFloatSizes{
        get {
            if(!this.HasProp("__TempBufferFloatSizesProxyArray"))
                this.__TempBufferFloatSizesProxyArray := Win32FixedArray(this.ptr + 4, 4, Primitive, "uint")
            return this.__TempBufferFloatSizesProxyArray
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of precompute buffers required.  
     *             Allowed range is 0 to <b>D3DX11_FFT_MAX_PRECOMPUTE_BUFFERS</b>.
     * @type {Integer}
     */
    NumPrecomputeBufferSizes {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a>[D3DX11_FFT_MAX_PRECOMPUTE_BUFFERS]</b>
     * 
     * Minimum sizes (in FLOATs) for precompute buffers.
     * @type {Array<UInt32>}
     */
    PrecomputeBufferFloatSizes{
        get {
            if(!this.HasProp("__PrecomputeBufferFloatSizesProxyArray"))
                this.__PrecomputeBufferFloatSizesProxyArray := Win32FixedArray(this.ptr + 24, 4, Primitive, "uint")
            return this.__PrecomputeBufferFloatSizesProxyArray
        }
    }
}
