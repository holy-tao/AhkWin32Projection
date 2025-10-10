#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Query information about the amount of data streamed out to the stream-output buffers in between ID3D11DeviceContext::Begin and ID3D11DeviceContext::End.
 * @see https://docs.microsoft.com/windows/win32/api//d3d11/ns-d3d11-d3d11_query_data_so_statistics
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_QUERY_DATA_SO_STATISTICS extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT64</a></b>
     * 
     * Number of primitives (that is, points, lines, and triangles) written to the stream-output buffers.
     * @type {Integer}
     */
    NumPrimitivesWritten {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT64</a></b>
     * 
     * Number of primitives that would have been written to the stream-output buffers if there had been enough space for them all.
     * @type {Integer}
     */
    PrimitivesStorageNeeded {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
