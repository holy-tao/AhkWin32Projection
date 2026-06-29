#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes the current video memory budgeting parameters.
 * @remarks
 * Use this structure with <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_4/nf-dxgi1_4-idxgiadapter3-queryvideomemoryinfo">QueryVideoMemoryInfo</a>.
 * 
 * Refer to the remarks for <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_memory_pool">D3D12_MEMORY_POOL</a>.
 * @see https://learn.microsoft.com/windows/win32/api/dxgi1_4/ns-dxgi1_4-dxgi_query_video_memory_info
 * @namespace Windows.Win32.Graphics.Dxgi
 */
export default struct DXGI_QUERY_VIDEO_MEMORY_INFO {
    #StructPack 8

    /**
     * Specifies the OS-provided video memory budget, in bytes, that the application should target. If <i>CurrentUsage</i> is greater than <i>Budget</i>, the application may incur stuttering or performance penalties due to background activity by the OS to provide other applications with a fair usage of video memory.
     */
    Budget : Int64

    /**
     * Specifies the application’s current video memory usage, in bytes.
     */
    CurrentUsage : Int64

    /**
     * The amount of video memory, in bytes, that the application has available for reservation. To reserve this video memory, the application should call <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_4/nf-dxgi1_4-idxgiadapter3-setvideomemoryreservation">IDXGIAdapter3::SetVideoMemoryReservation</a>.
     */
    AvailableForReservation : Int64

    /**
     * The amount of video memory, in bytes, that is reserved by the application. The OS uses the reservation as a hint to determine the application’s minimum working set. Applications should attempt to ensure that their video memory usage can be trimmed to meet this requirement.
     */
    CurrentReservation : Int64

}
