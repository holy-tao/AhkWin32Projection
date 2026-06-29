#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Query information about the amount of data streamed out to the stream-output buffers in between ID3D10Asynchronous::Begin and ID3D10Asynchronous::End.
 * @see https://learn.microsoft.com/windows/win32/api/d3d10/ns-d3d10-d3d10_query_data_so_statistics
 * @namespace Windows.Win32.Graphics.Direct3D10
 */
export default struct D3D10_QUERY_DATA_SO_STATISTICS {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT64</a></b>
     * 
     * Number of primitives (that is, points, lines, and triangles) written to the stream-output buffers.
     */
    NumPrimitivesWritten : Int64

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT64</a></b>
     * 
     * Number of primitives that would have been written to the stream-output buffers if there had been enough space for them all.
     */
    PrimitivesStorageNeeded : Int64

}
