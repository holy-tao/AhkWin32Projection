#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * Describes Direct3D 12 feature options in the current graphics driver.
 * @remarks
 * 
  * See <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_feature">D3D12_FEATURE</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ns-d3d12-d3d12_feature_data_d3d12_options
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_FEATURE_DATA_D3D12_OPTIONS extends Win32Struct
{
    static sizeof => 60

    static packingSize => 4

    /**
     * Specifies whether <b>double</b> types are allowed for shader operations.
     *               If <b>TRUE</b>, double types are allowed; otherwise <b>FALSE</b>.
     *               The supported operations are equivalent to Direct3D 11's <b>ExtendedDoublesShaderInstructions</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_feature_data_d3d11_options">D3D11_FEATURE_DATA_D3D11_OPTIONS</a> structure.
     *             
     * 
     * To use any HLSL shader that is compiled with a <b>double</b> type,
     *               the runtime must set <b>DoublePrecisionFloatShaderOps</b> to <b>TRUE</b>.
     * @type {BOOL}
     */
    DoublePrecisionFloatShaderOps{
        get {
            if(!this.HasProp("__DoublePrecisionFloatShaderOps"))
                this.__DoublePrecisionFloatShaderOps := BOOL(this.ptr + 0)
            return this.__DoublePrecisionFloatShaderOps
        }
    }

    /**
     * Specifies whether logic operations are available in blend state. The runtime sets this member to <b>TRUE</b> if logic operations are available in blend state and <b>FALSE</b> otherwise. This member is <b>FALSE</b> for feature level 9.1, 9.2, and 9.3.  This member is optional for feature level 10, 10.1, and 11.  This member is <b>TRUE</b> for feature level 11.1 and 12.
     * @type {BOOL}
     */
    OutputMergerLogicOp{
        get {
            if(!this.HasProp("__OutputMergerLogicOp"))
                this.__OutputMergerLogicOp := BOOL(this.ptr + 4)
            return this.__OutputMergerLogicOp
        }
    }

    /**
     * A combination of <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_shader_min_precision_support">D3D12_SHADER_MIN_PRECISION_SUPPORT</a>-typed values that are combined by using a bitwise OR operation. The resulting value specifies minimum precision levels that the driver supports for shader stages. A value of zero indicates that the driver supports only full 32-bit precision for all shader stages.
     * @type {Integer}
     */
    MinPrecisionSupport {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * Specifies whether the hardware and driver support tiled resources. The runtime sets this member to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_tiled_resources_tier">D3D12_TILED_RESOURCES_TIER</a>-typed value that indicates if the hardware and driver support tiled resources and at what tier level.
     * @type {Integer}
     */
    TiledResourcesTier {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * Specifies the level at which the hardware and driver support resource binding. The runtime sets this member to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_resource_binding_tier">D3D12_RESOURCE_BINDING_TIER</a>-typed value that indicates the tier level.
     * @type {Integer}
     */
    ResourceBindingTier {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * Specifies whether pixel shader stencil ref is supported. If <b>TRUE</b>, it's supported; otherwise <b>FALSE</b>.
     * @type {BOOL}
     */
    PSSpecifiedStencilRefSupported{
        get {
            if(!this.HasProp("__PSSpecifiedStencilRefSupported"))
                this.__PSSpecifiedStencilRefSupported := BOOL(this.ptr + 20)
            return this.__PSSpecifiedStencilRefSupported
        }
    }

    /**
     * Specifies whether the loading of additional formats for typed unordered-access views (UAVs) is supported.
     *             If <b>TRUE</b>, it's supported; otherwise <b>FALSE</b>.
     * @type {BOOL}
     */
    TypedUAVLoadAdditionalFormats{
        get {
            if(!this.HasProp("__TypedUAVLoadAdditionalFormats"))
                this.__TypedUAVLoadAdditionalFormats := BOOL(this.ptr + 24)
            return this.__TypedUAVLoadAdditionalFormats
        }
    }

    /**
     * Specifies whether <a href="https://docs.microsoft.com/windows/desktop/direct3d12/directx-12-glossary">Rasterizer Order Views</a> (ROVs) are supported. If <b>TRUE</b>, they're supported; otherwise <b>FALSE</b>.
     * @type {BOOL}
     */
    ROVsSupported{
        get {
            if(!this.HasProp("__ROVsSupported"))
                this.__ROVsSupported := BOOL(this.ptr + 28)
            return this.__ROVsSupported
        }
    }

    /**
     * Specifies the level at which the hardware and driver support conservative rasterization. The runtime sets this member to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_conservative_rasterization_tier">D3D12_CONSERVATIVE_RASTERIZATION_TIER</a>-typed value that indicates the tier level.
     * @type {Integer}
     */
    ConservativeRasterizationTier {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }

    /**
     * Don't use this field; instead, use the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_feature_data_gpu_virtual_address_support">D3D12_FEATURE_DATA_GPU_VIRTUAL_ADDRESS_SUPPORT</a> query
     *             (a structure with a <b>MaxGPUVirtualAddressBitsPerResource</b> member), which is more accurate.
     * @type {Integer}
     */
    MaxGPUVirtualAddressBitsPerResource {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * TRUE if the hardware supports textures with the 64KB standard swizzle pattern.
     *             Support for this pattern enables zero-copy texture optimizations while providing near-equilateral locality for each dimension within the texture.
     *             For texture swizzle options and restrictions, see <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_texture_layout">D3D12_TEXTURE_LAYOUT</a>.
     * @type {BOOL}
     */
    StandardSwizzle64KBSupported{
        get {
            if(!this.HasProp("__StandardSwizzle64KBSupported"))
                this.__StandardSwizzle64KBSupported := BOOL(this.ptr + 40)
            return this.__StandardSwizzle64KBSupported
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_cross_node_sharing_tier">D3D12_CROSS_NODE_SHARING_TIER</a> enumeration constant that specifies the level of sharing across nodes of an adapter that has multiple nodes,
     *             such as Tier 1 Emulated, Tier 1, or Tier 2.
     * @type {Integer}
     */
    CrossNodeSharingTier {
        get => NumGet(this, 44, "int")
        set => NumPut("int", value, this, 44)
    }

    /**
     * FALSE means the device only supports copy operations to and from cross-adapter row-major textures.
     *             TRUE means the device supports shader resource views, unordered access views, and render target views of cross-adapter row-major textures.
     *             "Cross-adapter" means between multiple adapters (even from different IHVs).
     * @type {BOOL}
     */
    CrossAdapterRowMajorTextureSupported{
        get {
            if(!this.HasProp("__CrossAdapterRowMajorTextureSupported"))
                this.__CrossAdapterRowMajorTextureSupported := BOOL(this.ptr + 48)
            return this.__CrossAdapterRowMajorTextureSupported
        }
    }

    /**
     * Whether the viewport (VP) and Render Target (RT) array index from any shader feeding the rasterizer are supported without geometry shader emulation.
     *             Compare the <b>VPAndRTArrayIndexFromAnyShaderFeedingRasterizer</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_feature_data_d3d11_options3">D3D11_FEATURE_DATA_D3D11_OPTIONS3</a> structure.
     *             In <a href="https://docs.microsoft.com/windows/desktop/api/d3d12shader/nf-d3d12shader-id3d12shaderreflection-getrequiresflags">ID3D12ShaderReflection::GetRequiresFlags</a>, see the #define D3D_SHADER_REQUIRES_VIEWPORT_AND_RT_ARRAY_INDEX_FROM_ANY_SHADER_FEEDING_RASTERIZER.
     * @type {BOOL}
     */
    VPAndRTArrayIndexFromAnyShaderFeedingRasterizerSupportedWithoutGSEmulation{
        get {
            if(!this.HasProp("__VPAndRTArrayIndexFromAnyShaderFeedingRasterizerSupportedWithoutGSEmulation"))
                this.__VPAndRTArrayIndexFromAnyShaderFeedingRasterizerSupportedWithoutGSEmulation := BOOL(this.ptr + 52)
            return this.__VPAndRTArrayIndexFromAnyShaderFeedingRasterizerSupportedWithoutGSEmulation
        }
    }

    /**
     * Specifies the level at which the hardware and driver require heap attribution related to resource type.
     *             The runtime sets this member to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_resource_heap_tier">D3D12_RESOURCE_HEAP_TIER</a> enumeration constant.
     * @type {Integer}
     */
    ResourceHeapTier {
        get => NumGet(this, 56, "int")
        set => NumPut("int", value, this, 56)
    }
}
