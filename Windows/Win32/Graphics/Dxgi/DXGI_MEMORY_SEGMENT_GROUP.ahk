#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the memory segment group to use.
 * @remarks
 * 
 * This enum is used by <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_4/nf-dxgi1_4-idxgiadapter3-queryvideomemoryinfo">QueryVideoMemoryInfo</a> and <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_4/nf-dxgi1_4-idxgiadapter3-setvideomemoryreservation">SetVideoMemoryReservation</a>.
 * 
 * Refer to the remarks for <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_memory_pool">D3D12_MEMORY_POOL</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//dxgi1_4/ne-dxgi1_4-dxgi_memory_segment_group
 * @namespace Windows.Win32.Graphics.Dxgi
 * @version v4.0.30319
 */
class DXGI_MEMORY_SEGMENT_GROUP extends Win32Enum{

    /**
     * The grouping of segments which is considered local to the video adapter, and represents the fastest available memory to the GPU. Applications should target the local segment group as the target size for their working set.
     * @type {Integer (Int32)}
     */
    static DXGI_MEMORY_SEGMENT_GROUP_LOCAL => 0

    /**
     * The grouping of segments which is considered non-local to the video adapter, and may have slower performance than the local segment group.
     * @type {Integer (Int32)}
     */
    static DXGI_MEMORY_SEGMENT_GROUP_NON_LOCAL => 1
}
