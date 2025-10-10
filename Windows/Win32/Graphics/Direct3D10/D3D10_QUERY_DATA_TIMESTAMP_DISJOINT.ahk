#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Query information about the reliability of a timestamp query.
 * @remarks
 * 
  * For a list of query types see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_query">D3D10_QUERY</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d10/ns-d3d10-d3d10_query_data_timestamp_disjoint
 * @namespace Windows.Win32.Graphics.Direct3D10
 * @version v4.0.30319
 */
class D3D10_QUERY_DATA_TIMESTAMP_DISJOINT extends Win32Struct
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
     * If this is <b>TRUE</b>, something occurred in between the query's <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10asynchronous-begin">ID3D10Asynchronous::Begin</a> and <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10asynchronous-end">ID3D10Asynchronous::End</a> calls that caused the timestamp counter to become discontinuous or disjoint, such as unplugging the AC chord on a laptop, overheating, or throttling up/down due to laptop savings events. The timestamp returned by <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10asynchronous-getdata">ID3D10Asynchronous::GetData</a> for a timestamp query is only reliable if Disjoint is <b>FALSE</b>.
     * @type {Integer}
     */
    Disjoint {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }
}
