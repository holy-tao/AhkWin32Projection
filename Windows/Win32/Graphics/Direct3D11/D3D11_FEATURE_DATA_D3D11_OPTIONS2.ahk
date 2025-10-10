#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

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
     * @type {Integer}
     */
    PSSpecifiedStencilRefSupported {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Specifies whether the hardware and driver support <b>TypedUAVLoadAdditionalFormats</b>.
     *             The runtime sets this member to <b>TRUE</b> if the hardware and driver support this option.
     * @type {Integer}
     */
    TypedUAVLoadAdditionalFormats {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Specifies whether the hardware and driver support ROVs.
     *             The runtime sets this member to <b>TRUE</b> if the hardware and driver support this option.
     * @type {Integer}
     */
    ROVsSupported {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
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
     * @type {Integer}
     */
    MapOnDefaultTextures {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * Specifies whether the hardware and driver support standard swizzle.
     *             The runtime sets this member to <b>TRUE</b> if the hardware and driver support this option.
     * @type {Integer}
     */
    StandardSwizzle {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * Specifies whether the hardware and driver support Unified Memory Architecture.
     *             The runtime sets this member to <b>TRUE</b> if the hardware and driver support this option.
     * @type {Integer}
     */
    UnifiedMemoryArchitecture {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }
}
