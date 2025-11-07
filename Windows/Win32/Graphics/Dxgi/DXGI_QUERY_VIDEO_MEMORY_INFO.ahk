#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes the current video memory budgeting parameters.
 * @remarks
 * 
 * Use this structure with <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_4/nf-dxgi1_4-idxgiadapter3-queryvideomemoryinfo">QueryVideoMemoryInfo</a>.
 * 
 * Refer to the remarks for <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_memory_pool">D3D12_MEMORY_POOL</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//dxgi1_4/ns-dxgi1_4-dxgi_query_video_memory_info
 * @namespace Windows.Win32.Graphics.Dxgi
 * @version v4.0.30319
 */
class DXGI_QUERY_VIDEO_MEMORY_INFO extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Specifies the OS-provided video memory budget, in bytes, that the application should target. If <i>CurrentUsage</i> is greater than <i>Budget</i>, the application may incur stuttering or performance penalties due to background activity by the OS to provide other applications with a fair usage of video memory.
     * @type {Integer}
     */
    Budget {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies the application’s current video memory usage, in bytes.
     * @type {Integer}
     */
    CurrentUsage {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The amount of video memory, in bytes, that the application has available for reservation. To reserve this video memory, the application should call <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_4/nf-dxgi1_4-idxgiadapter3-setvideomemoryreservation">IDXGIAdapter3::SetVideoMemoryReservation</a>.
     * @type {Integer}
     */
    AvailableForReservation {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The amount of video memory, in bytes, that is reserved by the application. The OS uses the reservation as a hint to determine the application’s minimum working set. Applications should attempt to ensure that their video memory usage can be trimmed to meet this requirement.
     * @type {Integer}
     */
    CurrentReservation {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
