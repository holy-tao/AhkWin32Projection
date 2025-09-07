#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the level of sharing across nodes of an adapter, such as Tier 1 Emulated, Tier 1, or Tier 2.
 * @remarks
 * This enum is used by the <b>CrossNodeSharingTier</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_feature_data_d3d12_options">D3D12_FEATURE_DATA_D3D12_OPTIONS</a> structure.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_cross_node_sharing_tier
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_CROSS_NODE_SHARING_TIER{

    /**
     * If an adapter has only 1 node, then cross-node sharing doesn't apply, so the <b>CrossNodeSharingTier</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_feature_data_d3d12_options">D3D12_FEATURE_DATA_D3D12_OPTIONS</a> structure is set to D3D12_CROSS_NODE_SHARING_NOT_SUPPORTED.
     * @type {Integer (Int32)}
     */
    static D3D12_CROSS_NODE_SHARING_TIER_NOT_SUPPORTED => 0

    /**
     * Tier 1 Emulated. Devices that set the <b>CrossNodeSharingTier</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_feature_data_d3d12_options">D3D12_FEATURE_DATA_D3D12_OPTIONS</a> structure to D3D12_CROSS_NODE_SHARING_TIER_1_EMULATED have Tier 1 support.
 * However, drivers stage these copy operations through a driver-internal system memory allocation. This will cause these copy operations to consume time on the destination GPU as well as the source.
     * @type {Integer (Int32)}
     */
    static D3D12_CROSS_NODE_SHARING_TIER_1_EMULATED => 1

    /**
     * Tier 1. Devices that set the <b>CrossNodeSharingTier</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_feature_data_d3d12_options">D3D12_FEATURE_DATA_D3D12_OPTIONS</a> structure to D3D12_CROSS_NODE_SHARING_TIER_1 only support the following cross-node copy operations:
 * 
 * <ul>
 * <li><a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12graphicscommandlist-copybufferregion">ID3D12CommandList::CopyBufferRegion</a></li>
 * <li><a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12graphicscommandlist-copytextureregion">ID3D12CommandList::CopyTextureRegion</a></li>
 * <li><a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12graphicscommandlist-copyresource">ID3D12CommandList::CopyResource</a></li>
 * </ul>
 * 
 * Additionally, the cross-node resource must be the destination of the copy operation.
     * @type {Integer (Int32)}
     */
    static D3D12_CROSS_NODE_SHARING_TIER_1 => 2

    /**
     * Tier 2. Devices that set the <b>CrossNodeSharingTier</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_feature_data_d3d12_options">D3D12_FEATURE_DATA_D3D12_OPTIONS</a> structure to D3D12_CROSS_NODE_SHARING_TIER_2 support all operations across nodes, except for the following:
 * 
 * <ul>
 * <li>Render target views.</li>
 * <li>Depth stencil views.</li>
 * <li>UAV atomic operations. Similar to CPU/GPU interop, shaders may perform UAV atomic operations; however, no atomicity across adapters is guaranteed.</li>
 * </ul>
 * Applications can retrieve the node where a resource/heap exists from the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_heap_desc">D3D12_HEAP_DESC</a> structure. These values are retrievable for opened resources. The runtime performs the appropriate re-mapping in case the 2 devices are using different UMD-specified node re-mappings.
     * @type {Integer (Int32)}
     */
    static D3D12_CROSS_NODE_SHARING_TIER_2 => 3

    /**
     * Indicates support for [**D3D12_HEAP_FLAG_ALLOW_SHADER_ATOMICS**](./ne-d3d12-d3d12_heap_flags.md) on heaps that are visible to multiple nodes.
     * @type {Integer (Int32)}
     */
    static D3D12_CROSS_NODE_SHARING_TIER_3 => 4
}
