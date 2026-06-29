#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D10_COUNTER.ahk" { D3D10_COUNTER }

/**
 * Describes a counter. (D3D10_COUNTER_DESC)
 * @see https://learn.microsoft.com/windows/win32/api/d3d10/ns-d3d10-d3d10_counter_desc
 * @namespace Windows.Win32.Graphics.Direct3D10
 */
export default struct D3D10_COUNTER_DESC {
    #StructPack 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_counter">D3D10_COUNTER</a></b>
     * 
     * Type of counter (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_counter">D3D10_COUNTER</a>).
     */
    Counter : D3D10_COUNTER

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Reserved.
     */
    MiscFlags : UInt32

}
