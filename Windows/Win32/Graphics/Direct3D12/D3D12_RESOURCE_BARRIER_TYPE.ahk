#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies a type of resource barrier (transition in resource use) description.
 * @remarks
 * 
 * This enum is used in the <b>D3D12_RESOURCE_BARRIER_TYPE</b> structure. Use these values with the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12graphicscommandlist-resourcebarrier">ID3D12GraphicsCommandList::ResourceBarrier</a> method.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ne-d3d12-d3d12_resource_barrier_type
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_RESOURCE_BARRIER_TYPE extends Win32Enum{

    /**
     * A transition barrier that indicates a transition of a set of subresources between different usages. The caller must specify the before and after usages of the subresources.
     * @type {Integer (Int32)}
     */
    static D3D12_RESOURCE_BARRIER_TYPE_TRANSITION => 0

    /**
     * An aliasing barrier that indicates a transition between usages of 2 different resources that have mappings into the same tile pool. The caller can specify both the before and the after resource. Note that one or both resources can be <b>NULL</b>, which indicates that any tiled resource could cause aliasing.
     * @type {Integer (Int32)}
     */
    static D3D12_RESOURCE_BARRIER_TYPE_ALIASING => 1

    /**
     * An unordered access view (UAV) barrier that indicates all UAV accesses (reads or writes) to a particular resource must complete before any future UAV accesses (read or write) can begin.
     * @type {Integer (Int32)}
     */
    static D3D12_RESOURCE_BARRIER_TYPE_UAV => 2
}
