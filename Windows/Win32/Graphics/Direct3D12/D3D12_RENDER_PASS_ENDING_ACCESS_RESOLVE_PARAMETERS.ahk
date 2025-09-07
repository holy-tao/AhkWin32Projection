#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes a resource to resolve to at the conclusion of a render pass.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_render_pass_ending_access_resolve_parameters
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_RENDER_PASS_ENDING_ACCESS_RESOLVE_PARAMETERS extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12resource">ID3D12Resource</a>. The source resource.
     * @type {Pointer<ID3D12Resource>}
     */
    pSrcResource {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12resource">ID3D12Resource</a>. The destination resource.
     * @type {Pointer<ID3D12Resource>}
     */
    pDstResource {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * A <b>UINT</b>. The number of subresources.
     * @type {Integer}
     */
    SubresourceCount {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * A pointer to a constant array of <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_render_pass_ending_access_resolve_subresource_parameters">D3D12_RENDER_PASS_ENDING_ACCESS_RESOLVE_SUBRESOURCE_PARAMETERS</a>. These subresources can be a subset of the render target's array slices, but you can't target subresources that aren't part of the render target view (RTV) or the depth/stencil view (DSV).
     * 
     * > [!NOTE]
     * > This pointer is directly referenced by the command list, and the memory for this array must remain alive and intact until [EndRenderPass](nf-d3d12-id3d12graphicscommandlist4-endrenderpass.md) is called.
     * @type {Pointer<D3D12_RENDER_PASS_ENDING_ACCESS_RESOLVE_SUBRESOURCE_PARAMETERS>}
     */
    pSubresourceParameters {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a>. The data format of the resources.
     * @type {Integer}
     */
    Format {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_resolve_mode">D3D12_RESOLVE_MODE</a>. The resolve operation.
     * @type {Integer}
     */
    ResolveMode {
        get => NumGet(this, 36, "int")
        set => NumPut("int", value, this, 36)
    }

    /**
     * A <b>BOOL</b>. <b>TRUE</b> to preserve the resolve source, otherwise <b>FALSE</b>.
     * @type {Integer}
     */
    PreserveResolveSource {
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
    }
}
