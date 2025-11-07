#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Information about the video card's performance counter capabilities.
 * @remarks
 * 
 * This structure is returned by <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-checkcounterinfo">ID3D10Device::CheckCounterInfo</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d10/ns-d3d10-d3d10_counter_info
 * @namespace Windows.Win32.Graphics.Direct3D10
 * @version v4.0.30319
 */
class D3D10_COUNTER_INFO extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_counter">D3D10_COUNTER</a></b>
     * 
     * Largest device-dependent counter ID that the device supports. If none are supported, this value will be 0. Otherwise it will be greater than or equal to D3D10_COUNTER_DEVICE_DEPENDENT_0. See <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_counter">D3D10_COUNTER</a>.
     * @type {Integer}
     */
    LastDeviceDependentCounter {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of counters that can be simultaneously supported.
     * @type {Integer}
     */
    NumSimultaneousCounters {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b>UINT8</b>
     * 
     * Number of detectable parallel units that the counter is able to discern. Values are 1 ~ 4. Use NumDetectableParallelUnits to interpret the values of the VERTEX_PROCESSING, GEOMETRY_PROCESSING, PIXEL_PROCESSING, and OTHER_GPU_PROCESSING counters. See <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10asynchronous-getdata">ID3D10Asynchronous::GetData</a> for an equation.
     * @type {Integer}
     */
    NumDetectableParallelUnits {
        get => NumGet(this, 8, "char")
        set => NumPut("char", value, this, 8)
    }
}
