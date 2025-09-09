#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes an FFT.
 * @see https://learn.microsoft.com/windows/win32/api/d3dcsx/ns-d3dcsx-d3dx11_fft_desc
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3DX11_FFT_DESC extends Win32Struct
{
    static sizeof => 140

    static packingSize => 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of dimension in the FFT.
     * @type {Integer}
     */
    NumDimensions {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a>[D3DX11_FFT_MAX_DIMENSIONS]</b>
     * 
     * Length of each dimension in the FFT.
     * @type {Array<UInt32>}
     */
    ElementLengths{
        get {
            if(!this.HasProp("__ElementLengthsProxyArray"))
                this.__ElementLengthsProxyArray := Win32FixedArray(this.ptr + 4, 32, Primitive, "uint")
            return this.__ElementLengthsProxyArray
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Combination of <a href="https://docs.microsoft.com/windows/desktop/api/d3dcsx/ne-d3dcsx-d3dx11_fft_dim_mask">D3DX11_FFT_DIM_MASK</a> flags indicating the  dimensions to transform.
     * @type {Integer}
     */
    DimensionMask {
        get => NumGet(this, 132, "uint")
        set => NumPut("uint", value, this, 132)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3dcsx/ne-d3dcsx-d3dx11_fft_data_type">D3DX11_FFT_DATA_TYPE</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3dcsx/ne-d3dcsx-d3dx11_fft_data_type">D3DX11_FFT_DATA_TYPE</a> flag indicating the type of data being transformed.
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 136, "int")
        set => NumPut("int", value, this, 136)
    }
}
