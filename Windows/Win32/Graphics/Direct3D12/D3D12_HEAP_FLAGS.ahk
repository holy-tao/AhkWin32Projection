#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies heap options, such as whether the heap can contain textures, and whether resources are shared across adapters.
 * @remarks
 * This enum is used by the following API items:
 * 
 * <ul>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12device-createheap">ID3D12Device::CreateHeap</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12device-createcommittedresource">ID3D12Device::CreateCommittedResource</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_heap_desc">D3D12_HEAP_DESC</a> structure
 *           </li>
 * </ul>
 * The following heap flags must be used with <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12device-createheap">ID3D12Device::CreateHeap</a>,
 *           but will be set automatically for implicit heaps created by <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12device-createcommittedresource">ID3D12Device::CreateCommittedResource</a>.
 *         
 * Adapters that only support <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_resource_heap_tier">heap tier 1</a> must set two out of the three following flags.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td>D3D12_HEAP_FLAG_DENY_BUFFERS</td>
 * <td>The heap isn't allowed to contain resources with
 *               D3D12_RESOURCE_DIMENSION_BUFFER (which is a <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_resource_dimension">D3D12_RESOURCE_DIMENSION</a> enumeration constant).
 *             </td>
 * </tr>
 * <tr>
 * <td>D3D12_HEAP_FLAG_DENY_RT_DS_TEXTURES</td>
 * <td>The heap isn't allowed to contain resources with
 *               D3D12_RESOURCE_DIMENSION_TEXTURE1D,
 *               D3D12_RESOURCE_DIMENSION_TEXTURE2D, or
 *               D3D12_RESOURCE_DIMENSION_TEXTURE3D
 *               together with either
 *               D3D12_RESOURCE_FLAG_ALLOW_RENDER_TARGET or
 *               D3D12_RESOURCE_FLAG_ALLOW_DEPTH_STENCIL.
 *               (The latter two items are <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_resource_flags">D3D12_RESOURCE_FLAGS</a> enumeration constants.)
 *             </td>
 * </tr>
 * <tr>
 * <td>D3D12_HEAP_FLAG_DENY_NON_RT_DS_TEXTURES</td>
 * <td>The heap isn't allowed to contain resources with
 *               D3D12_RESOURCE_DIMENSION_TEXTURE1D,
 *               D3D12_RESOURCE_DIMENSION_TEXTURE2D, or
 *               D3D12_RESOURCE_DIMENSION_TEXTURE3D
 *               unless
 *               D3D12_RESOURCE_FLAG_ALLOW_RENDER_TARGET and
 *               D3D12_RESOURCE_FLAG_ALLOW_DEPTH_STENCIL are absent.
 *             </td>
 * </tr>
 * </table>
 * 
 * <h3><a id="Aliases"></a><a id="aliases"></a><a id="ALIASES"></a>Aliases</h3>
 * Adapters that support <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_resource_heap_tier">heap tier 2</a> or greater are additionally allowed to set none of the above flags.
 *           Aliases for these flags are available for applications that prefer thinking only of which resources are supported.
 * 
 * The following aliases exist, so be careful when doing bit-manipulations:
 * 
 * <ul>
 * <li>D3D12_HEAP_FLAG_ALLOW_ALL_BUFFERS_AND_TEXTURES = 0 and is only supported on <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_resource_heap_tier">heap tier 2</a> and greater.
 *           </li>
 * <li>D3D12_HEAP_FLAG_ALLOW_ONLY_BUFFERS = D3D12_HEAP_FLAG_DENY_RT_DS_TEXTURES | D3D12_HEAP_FLAG_DENY_NON_RT_DS_TEXTURES
 *           </li>
 * <li>D3D12_HEAP_FLAG_ALLOW_ONLY_NON_RT_DS_TEXTURES = D3D12_HEAP_FLAG_DENY_BUFFERS | D3D12_HEAP_FLAG_DENY_RT_DS_TEXTURES
 *           </li>
 * <li>D3D12_HEAP_FLAG_ALLOW_ONLY_RT_DS_TEXTURES = D3D12_HEAP_FLAG_DENY_BUFFERS | D3D12_HEAP_FLAG_DENY_NON_RT_DS_TEXTURES
 *           </li>
 * </ul>
 * <h3><a id="Displayable_heaps"></a><a id="displayable_heaps"></a><a id="DISPLAYABLE_HEAPS"></a>Displayable heaps</h3>
 * Displayable heaps are most commonly created by the swapchain for presentation, to enable scanning out to a monitor.
 * 
 * Displayable heaps are specified with the D3D12_HEAP_FLAG_ALLOW_DISPLAY member of the <b>D3D12_HEAP_FLAGS</b> enum.
 * 
 * Applications may create displayable heaps outside of a swapchain; but cannot actually present with them.
 *  This flag is not supported by <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12device-createheap">CreateHeap</a> and can only be used with <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12device-createcommittedresource">CreateCommittedResource</a> with D3D12_HEAP_TYPE_DEFAULT. 
 * 
 * Additional restrictions to the  <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_resource_desc">D3D12_RESOURCE_DESC</a> apply to the resource created with displayable heaps.
 * 
 * <ul>
 * <li>The format must not only be supported by the device, but must be supported for scan-out. Refer to the use of the   D3D12_FORMAT_SUPPORT1_DISPLAY member of <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_format_support1">D3D12_FORMAT_SUPPORT1</a>.</li>
 * <li><i>Dimension</i> must be D3D12_RESOURCE_DIMENSION_TEXTURE2D.</li>
 * <li><i>Alignment</i> must be 0.</li>
 * <li><i>ArraySize</i> may be either 1 or 2.</li>
 * <li><i>MipLevels</i> must be 1.</li>
 * <li><i>SampleDesc</i> must have <i>Count</i> set to 1 and <i>Quality</i> set to 0.</li>
 * <li><i>Layout</i> must be D3D12_TEXTURE_LAYOUT_UNKNOWN.</li>
 * <li>D3D12_RESOURCE_FLAG_ALLOW_DEPTH_STENCIL and D3D12_RESOURCE_FLAG_ALLOW_CROSS_ADAPTER are invalid
 * flags.</li>
 * </ul>
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_heap_flags
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_HEAP_FLAGS extends Win32BitflagEnum{

    /**
     * No options are specified.
     * @type {Integer (Int32)}
     */
    static D3D12_HEAP_FLAG_NONE => 0

    /**
     * The heap is shared. Refer to <a href="https://docs.microsoft.com/windows/desktop/direct3d12/shared-heaps">Shared Heaps</a>.
     * @type {Integer (Int32)}
     */
    static D3D12_HEAP_FLAG_SHARED => 1

    /**
     * The heap isn't allowed to contain buffers.
     * @type {Integer (Int32)}
     */
    static D3D12_HEAP_FLAG_DENY_BUFFERS => 4

    /**
     * The heap is allowed to contain swap-chain surfaces.
     * @type {Integer (Int32)}
     */
    static D3D12_HEAP_FLAG_ALLOW_DISPLAY => 8

    /**
     * The heap is allowed to share resources across adapters. Refer to <a href="https://docs.microsoft.com/windows/desktop/direct3d12/shared-heaps">Shared Heaps</a>. A protected session cannot be mixed with resources that are shared across adapters.
     * @type {Integer (Int32)}
     */
    static D3D12_HEAP_FLAG_SHARED_CROSS_ADAPTER => 32

    /**
     * The heap is not allowed to store Render Target (RT) and/or Depth-Stencil (DS) textures.
     * @type {Integer (Int32)}
     */
    static D3D12_HEAP_FLAG_DENY_RT_DS_TEXTURES => 64

    /**
     * The heap is not allowed to contain resources with D3D12_RESOURCE_DIMENSION_TEXTURE1D, D3D12_RESOURCE_DIMENSION_TEXTURE2D, or D3D12_RESOURCE_DIMENSION_TEXTURE3D  unless either D3D12_RESOURCE_FLAG_ALLOW_RENDER_TARGET or D3D12_RESOURCE_FLAG_ALLOW_DEPTH_STENCIL are present. Refer to <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_resource_dimension">D3D12_RESOURCE_DIMENSION</a> and <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_resource_flags">D3D12_RESOURCE_FLAGS</a>.
     * @type {Integer (Int32)}
     */
    static D3D12_HEAP_FLAG_DENY_NON_RT_DS_TEXTURES => 128

    /**
     * Unsupported. Do not use.
     * @type {Integer (Int32)}
     */
    static D3D12_HEAP_FLAG_HARDWARE_PROTECTED => 256

    /**
     * The heap supports MEM_WRITE_WATCH functionality, which causes the system to track the pages that are written to in the committed memory region. This flag can't be combined with the D3D12_HEAP_TYPE_DEFAULT or D3D12_CPU_PAGE_PROPERTY_UNKNOWN flags. Applications are discouraged from using this flag themselves because it prevents tools from using this functionality.
     * @type {Integer (Int32)}
     */
    static D3D12_HEAP_FLAG_ALLOW_WRITE_WATCH => 512

    /**
     * Ensures that atomic operations will be atomic on this heap's memory, according to components able to see the memory.
     * 
     * Creating a heap with this flag will fail under either of these conditions.
     * - The heap type is **D3D12_HEAP_TYPE_DEFAULT**, and the heap can be visible on multiple nodes, but the device does *not* support [**D3D12_CROSS_NODE_SHARING_TIER_3**](./ne-d3d12-d3d12_cross_node_sharing_tier.md).
     * - The heap is CPU-visible, but the heap type is *not* **D3D12_HEAP_TYPE_CUSTOM**.
     * 
     * Note that heaps with this flag might be a limited resource on some systems.
     * @type {Integer (Int32)}
     */
    static D3D12_HEAP_FLAG_ALLOW_SHADER_ATOMICS => 1024

    /**
     * The heap is created in a non-resident state and must be made resident using [ID3D12Device::MakeResident](./nf-d3d12-id3d12device-makeresident.md) or [ID3D12Device3::EnqueueMakeResident](./nf-d3d12-id3d12device3-enqueuemakeresident.md).
     * 
     * By default, the final step of heap creation is to make the heap resident, so this flag skips this step and allows the application to decide when to do so.
     * @type {Integer (Int32)}
     */
    static D3D12_HEAP_FLAG_CREATE_NOT_RESIDENT => 2048

    /**
     * Allows the OS to not zero the heap created. By default, committed resources and heaps are almost always zeroed upon creation. This flag allows this to be elided in some scenarios. However, it doesn't guarantee it. For example, memory coming from other processes still needs to be zeroed for data protection and process isolation. This can lower the overhead of creating the heap.
     * @type {Integer (Int32)}
     */
    static D3D12_HEAP_FLAG_CREATE_NOT_ZEROED => 4096

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_HEAP_FLAG_TOOLS_USE_MANUAL_WRITE_TRACKING => 8192

    /**
     * The heap is allowed to store all types of buffers and/or textures. This is an alias; for more details, see "Aliases" in the Remarks section.
     * @type {Integer (Int32)}
     */
    static D3D12_HEAP_FLAG_ALLOW_ALL_BUFFERS_AND_TEXTURES => 0

    /**
     * The heap is only allowed to store buffers. This is an alias; for more details, see "Aliases" in the Remarks section.
     * @type {Integer (Int32)}
     */
    static D3D12_HEAP_FLAG_ALLOW_ONLY_BUFFERS => 192

    /**
     * The heap is only allowed to store non-RT, non-DS textures. This is an alias; for more details, see "Aliases" in the Remarks section.
     * @type {Integer (Int32)}
     */
    static D3D12_HEAP_FLAG_ALLOW_ONLY_NON_RT_DS_TEXTURES => 68

    /**
     * The heap is only allowed to store RT and/or DS textures. This is an alias; for more details, see "Aliases" in the Remarks section.
     * @type {Integer (Int32)}
     */
    static D3D12_HEAP_FLAG_ALLOW_ONLY_RT_DS_TEXTURES => 132
}
