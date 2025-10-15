#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * Describes Direct3D 11.3 feature options in the current graphics driver.
 * @remarks
 * 
  * If <b>MapOnDefaultTextures</b> is TRUE, applications may create textures using D3D11_USAGE_DEFAULT in combination with non-zero a D3D11_CPU_ACCESS_FLAG value.
  *         For performance reasons it is typically undesirable to create a default texture with CPU access flags unless the <b>UnifiedMemoryArchitecture</b> option is TRUE, or CPU / GPU usage of the texture is tightly interleaved.
  *       
  * 
  * Default textures may not be in a mapped state while either bound to the pipeline to referenced by an operation issued to a context.
  *         Default textures may not be mapped by a deferred context.
  *         Default textures may not be created shareable.
  *       
  * 
  * See <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_3/ne-d3d11_3-d3d11_texture_layout">D3D11_TEXTURE_LAYOUT</a> for texture swizzle options and restrictions.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d11/ns-d3d11-d3d11_feature_data_d3d11_options2
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_FEATURE_DATA_D3D11_OPTIONS2 extends Win32Struct
{
    static sizeof => 32

    static packingSize => 4

    /**
     * Specifies whether the hardware and driver support <b>PSSpecifiedStencilRef</b>.
     *             The runtime sets this member to <b>TRUE</b> if the hardware and driver support this option.
     * @type {BOOL}
     */
    PSSpecifiedStencilRefSupported{
        get {
            if(!this.HasProp("__PSSpecifiedStencilRefSupported"))
                this.__PSSpecifiedStencilRefSupported := BOOL(this.ptr + 0)
            return this.__PSSpecifiedStencilRefSupported
        }
    }

    /**
     * Specifies whether the hardware and driver support <b>TypedUAVLoadAdditionalFormats</b>.
     *             The runtime sets this member to <b>TRUE</b> if the hardware and driver support this option.
     * @type {BOOL}
     */
    TypedUAVLoadAdditionalFormats{
        get {
            if(!this.HasProp("__TypedUAVLoadAdditionalFormats"))
                this.__TypedUAVLoadAdditionalFormats := BOOL(this.ptr + 4)
            return this.__TypedUAVLoadAdditionalFormats
        }
    }

    /**
     * Specifies whether the hardware and driver support ROVs.
     *             The runtime sets this member to <b>TRUE</b> if the hardware and driver support this option.
     * @type {BOOL}
     */
    ROVsSupported{
        get {
            if(!this.HasProp("__ROVsSupported"))
                this.__ROVsSupported := BOOL(this.ptr + 8)
            return this.__ROVsSupported
        }
    }

    /**
     * Specifies whether the hardware and driver support conservative rasterization.
     *             The runtime sets this member to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_conservative_rasterization_tier">D3D11_CONSERVATIVE_RASTERIZATION_TIER</a>-typed value that indicates if the hardware and driver support conservative rasterization and at what tier level.
     * @type {Integer}
     */
    ConservativeRasterizationTier {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * Specifies whether the hardware and driver support tiled resources.
     *             The runtime sets this member to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_tiled_resources_tier">D3D11_TILED_RESOURCES_TIER</a>-typed value that indicates if the hardware and driver support tiled resources and at what tier level.
     * @type {Integer}
     */
    TiledResourcesTier {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * Specifies whether the hardware and driver support mapping on default textures.
     *             The runtime sets this member to <b>TRUE</b> if the hardware and driver support this option.
     * @type {BOOL}
     */
    MapOnDefaultTextures{
        get {
            if(!this.HasProp("__MapOnDefaultTextures"))
                this.__MapOnDefaultTextures := BOOL(this.ptr + 20)
            return this.__MapOnDefaultTextures
        }
    }

    /**
     * Specifies whether the hardware and driver support standard swizzle.
     *             The runtime sets this member to <b>TRUE</b> if the hardware and driver support this option.
     * @type {BOOL}
     */
    StandardSwizzle{
        get {
            if(!this.HasProp("__StandardSwizzle"))
                this.__StandardSwizzle := BOOL(this.ptr + 24)
            return this.__StandardSwizzle
        }
    }

    /**
     * Specifies whether the hardware and driver support Unified Memory Architecture.
     *             The runtime sets this member to <b>TRUE</b> if the hardware and driver support this option.
     * @type {BOOL}
     */
    UnifiedMemoryArchitecture{
        get {
            if(!this.HasProp("__UnifiedMemoryArchitecture"))
                this.__UnifiedMemoryArchitecture := BOOL(this.ptr + 28)
            return this.__UnifiedMemoryArchitecture
        }
    }
}
