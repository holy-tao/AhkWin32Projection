#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Query information about the reliability of a timestamp query. (D3D11_QUERY_DATA_TIMESTAMP_DISJOINT)
 * @remarks
 * For a list of query types see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_query">D3D11_QUERY</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_query_data_timestamp_disjoint
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_QUERY_DATA_TIMESTAMP_DISJOINT extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT64</a></b>
     * 
     * How frequently the GPU counter increments in Hz.
     * @type {Integer}
     */
    Frequency {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * If this is <b>TRUE</b>, something occurred in between the query's <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-begin">ID3D11DeviceContext::Begin</a> and <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-end">ID3D11DeviceContext::End</a> calls that caused the timestamp counter to become discontinuous or disjoint, such as unplugging the AC cord on a laptop, overheating, or throttling up/down due to laptop savings events. The timestamp returned by <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-getdata">ID3D11DeviceContext::GetData</a> for a timestamp query is only reliable if <b>Disjoint</b> is <b>FALSE</b>.
     * @type {BOOL}
     */
    Disjoint {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }
}
