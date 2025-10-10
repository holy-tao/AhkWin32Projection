#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Used with ID3D11On12Device::CreateWrappedResourceto override flags that would be inferred by the resource properties or heap properties, including bind flags, misc flags, and CPU access flags.
 * @remarks
 * 
  * Use this structure with <a href="https://docs.microsoft.com/windows/desktop/api/d3d11on12/nf-d3d11on12-id3d11on12device-createwrappedresource">CreateWrappedResource</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d11on12/ns-d3d11on12-d3d11_resource_flags
 * @namespace Windows.Win32.Graphics.Direct3D11on12
 * @version v4.0.30319
 */
class D3D11_RESOURCE_FLAGS extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * Bind flags must be either completely inferred, or completely specified, to allow the graphics driver to scope a general D3D12 resource to something that D3D11 can understand.
     *             
     * 
     * If a bind flag is specified which is not supported by the provided resource, an error will be returned.
     *             
     * 
     * The following bind flags (<a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_bind_flag">D3D11_BIND_FLAG</a> enumeration constants) will not be assumed, and must be specified in order for a resource to be used in such a fashion:
     *             
     * 
     * <ul>
     * <li>D3D11_BIND_VERTEX_BUFFER
     *               </li>
     * <li>D3D11_BIND_INDEX_BUFFER
     *               </li>
     * <li>D3D11_BIND_CONSTANT_BUFFER
     *               </li>
     * <li>D3D11_BIND_STREAM_OUTPUT
     *               </li>
     * <li>D3D11_BIND_DECODER
     *               </li>
     * <li>D3D11_BIND_VIDEO_ENCODER
     *               </li>
     * </ul>
     * The following bind flags will be assumed based on the presence of the corresponding D3D12 resource flag, and can be removed by specifying bind flags:
     *             
     * 
     * <ul>
     * <li>D3D11_BIND_SHADER_RESOURCE, as long as D3D12_RESOURCE_MISC_DENY_SHADER_RESOURCE is not present
     *               </li>
     * <li>D3D11_BIND_RENDER_TARGET, if D3D12_RESOURCE_MISC_ALLOW_RENDER_TARGET is present
     *               </li>
     * <li>D3D11_BIND_DEPTH_STENCIL, if D3D12_RESOURCE_MISC_ALLOW_DEPTH_STENCIL is present
     *               </li>
     * <li>D3D11_BIND_UNORDERED_ACCESS, if D3D12_RESOURCE_MISC_ALLOW_UNORDERED_ACCESS is present</li>
     * </ul>
     * A render target or UAV buffer can be wrapped without overriding flags; but a VB/IB/CB/SO buffer must have bind flags manually specified, since these are mutually exclusive in Direct3D 11.
     * @type {Integer}
     */
    BindFlags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * If misc flags are nonzero, then any specified flags will be OR’d into the final resource desc with inferred flags.
     *               Misc flags can be partially specified in order to add functionality, but misc flags which are implied cannot be masked out.
     *             
     * 
     * The following misc flags (<a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_resource_misc_flag">D3D11_RESOURCE_MISC_FLAG</a> enumeration constants) will not be assumed:
     *             
     * 
     * <ul>
     * <li>D3D11_RESOURCE_MISC_GENERATE_MIPS (conflicts with CLAMP).
     *               </li>
     * <li>D3D11_RESOURCE_MISC_TEXTURECUBE (alters default view behavior).
     *               </li>
     * <li>D3D11_RESOURCE_MISC_DRAWINDIRECT_ARGS (exclusive with some bind flags).
     *               </li>
     * <li>D3D11_RESOURCE_MISC_BUFFER_ALLOW_RAW_VIEWS (exclusive with other types of UAVs).
     *               </li>
     * <li>D3D11_RESOURCE_MISC_BUFFER_STRUCTURED (exclusive with other types of UAVs).
     *               </li>
     * <li>D3D11_RESOURCE_MISC_RESOURCE_CLAMP (prohibits D3D10 QIs, conflicts with GENERATE_MIPS).
     *               </li>
     * <li>D3D11_RESOURCE_MISC_SHARED_KEYEDMUTEX.  It is possible to create a D3D11 keyed mutex resource, create a shared handle for it, and open it via 11on12 or D3D11.
     *               </li>
     * </ul>
     * The following misc flags will be assumed, and cannot be removed from the produced resource desc.
     *               If one of these is set, and the D3D12 resource does not support it, creation will fail:
     *             
     * 
     * <ul>
     * <li>D3D11_RESOURCE_MISC_SHARED, D3D11_RESOURCE_MISC_SHARED_NTHANDLE, D3D11_RESOURCE_MISC_RESTRICT_SHARED_RESOURCE, if appropriate heap misc flags are present.
     *               </li>
     * <li>D3D11_RESOURCE_MISC_GDI_COMPATIBLE, if D3D12 resource is GDI-compatible.
     *               </li>
     * <li>D3D11_RESOURCE_MISC_TILED, if D3D12 resource was created via <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12device-createreservedresource">CreateReservedResource</a>.
     *               </li>
     * <li>D3D11_RESOURCE_MISC_TILE_POOL, if a D3D12 heap was passed in.
     *               </li>
     * </ul>
     * The following misc flags are invalid to specify for this API:
     *             
     * 
     * <ul>
     * <li>D3D11_RESOURCE_MISC_RESTRICTED_CONTENT, since D3D12 only supports hardware protection.
     *               </li>
     * <li>D3D11_RESOURCE_MISC_RESTRICT_SHARED_RESOURCE_DRIVER does not exist in 12, and cannot be added in after resource creation.
     *               </li>
     * <li>D3D11_RESOURCE_MISC_GUARDED is only meant to be set by an internal creation mechanism.
     *               </li>
     * </ul>
     * @type {Integer}
     */
    MiscFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The <b>CPUAccessFlags</b> are not inferred from the D3D12 resource.
     *               This is because all resources are treated as D3D11_USAGE_DEFAULT, so <b>CPUAccessFlags</b> force validation which assumes <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12resource-map">Map</a> of default buffers or textures.
     *               Wrapped resources do not support <b>Map(DISCARD)</b>.
     *               Wrapped resources do not support <b>Map(NO_OVERWRITE)</b>, but that can be implemented by mapping the underlying D3D12 resource instead.
     *               Issuing a <b>Map</b> call on a wrapped resource will synchronize with all D3D11 work submitted against that resource, unless the DO_NOT_WAIT flag was used.
     * @type {Integer}
     */
    CPUAccessFlags {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The size of each element in the buffer structure (in bytes) when the buffer represents a structured buffer.
     * @type {Integer}
     */
    StructureByteStride {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
