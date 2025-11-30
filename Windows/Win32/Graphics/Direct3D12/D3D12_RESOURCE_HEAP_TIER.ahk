#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies which resource heap tier the hardware and driver support.
 * @remarks
 * 
 * This enum is used by the <b>ResourceHeapTier</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_feature_data_d3d12_options">D3D12_FEATURE_DATA_D3D12_OPTIONS</a> structure.
 *         
 * 
 * This enum specifies which resource heap tier the hardware and driver support.
 *           Lower tiers require more heap attribution than greater tiers.
 *         
 * 
 * Resources can be categorized into the following types:
 *         
 * 
 * <ul>
 * <li>Buffers</li>
 * <li>Non-render target &amp; non-depth stencil textures</li>
 * <li>Render target or depth stencil textures</li>
 * </ul>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ne-d3d12-d3d12_resource_heap_tier
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_RESOURCE_HEAP_TIER extends Win32Enum{

    /**
     * Indicates that heaps can only support resources from a single resource category.
     *             For the list of resource categories, see Remarks.
     *             In tier 1, these resource categories are mutually exclusive and cannot be used with the same heap.
     *             The resource category must be declared when creating a heap, using the correct <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_heap_flags">D3D12_HEAP_FLAGS</a> enumeration constant.
     *             Applications cannot create heaps with flags that allow all three categories.
     * @type {Integer (Int32)}
     */
    static D3D12_RESOURCE_HEAP_TIER_1 => 1

    /**
     * Indicates that heaps can support resources from all three categories.
     *             For the list of resource categories, see Remarks.
     *             In tier 2, these resource categories can be mixed within the same heap.
     *             Applications may create heaps with flags that allow all three categories; but are not required to do so.
     *             Applications may be written to support tier 1 and seamlessly run on tier 2.
     * @type {Integer (Int32)}
     */
    static D3D12_RESOURCE_HEAP_TIER_2 => 2
}
