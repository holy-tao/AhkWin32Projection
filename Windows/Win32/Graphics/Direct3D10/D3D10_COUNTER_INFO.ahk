#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D10_COUNTER.ahk" { D3D10_COUNTER }

/**
 * Information about the video card's performance counter capabilities. (D3D10_COUNTER_INFO)
 * @remarks
 * This structure is returned by <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-checkcounterinfo">ID3D10Device::CheckCounterInfo</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d10/ns-d3d10-d3d10_counter_info
 * @namespace Windows.Win32.Graphics.Direct3D10
 */
export default struct D3D10_COUNTER_INFO {
    #StructPack 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_counter">D3D10_COUNTER</a></b>
     * 
     * Largest device-dependent counter ID that the device supports. If none are supported, this value will be 0. Otherwise it will be greater than or equal to D3D10_COUNTER_DEVICE_DEPENDENT_0. See <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_counter">D3D10_COUNTER</a>.
     */
    LastDeviceDependentCounter : D3D10_COUNTER

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of counters that can be simultaneously supported.
     */
    NumSimultaneousCounters : UInt32

    /**
     * Type: <b>UINT8</b>
     * 
     * Number of detectable parallel units that the counter is able to discern. Values are 1 ~ 4. Use NumDetectableParallelUnits to interpret the values of the VERTEX_PROCESSING, GEOMETRY_PROCESSING, PIXEL_PROCESSING, and OTHER_GPU_PROCESSING counters. See <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10asynchronous-getdata">ID3D10Asynchronous::GetData</a> for an equation.
     */
    NumDetectableParallelUnits : Int8

}
