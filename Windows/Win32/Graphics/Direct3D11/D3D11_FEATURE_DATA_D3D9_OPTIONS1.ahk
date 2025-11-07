#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes Direct3D 9 feature options in the current graphics driver.
 * @remarks
 * 
 * You can use the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_feature">D3D11_FEATURE_D3D9_OPTIONS1</a> enumeration value with <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11device-checkfeaturesupport">ID3D11Device::CheckFeatureSupport</a> to query a driver about support for Direct3D 9 feature options rather than making multiple calls to <b>ID3D11Device::CheckFeatureSupport</b> by using <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_feature">D3D11_FEATURE_D3D9_OPTIONS</a>, <b>D3D11_FEATURE_D3D9_SHADOW_SUPPORT</b>, and <b>D3D11_FEATURE_D3D9_SIMPLE_INSTANCING_SUPPORT</b>, which provide identical info about supported Direct3D 9 feature options.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d11/ns-d3d11-d3d11_feature_data_d3d9_options1
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_FEATURE_DATA_D3D9_OPTIONS1 extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * Specifies whether the driver supports the nonpowers-of-2-unconditionally feature. For more info about this feature, see <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-devices-downlevel-intro">feature level</a>. The runtime sets this member to <b>TRUE</b> for hardware at Direct3D 10 and higher feature levels.  For hardware at Direct3D 9.3 and lower feature levels, the runtime sets this member to <b>FALSE</b> if the hardware and driver support the powers-of-2 (2D textures must have widths and heights specified as powers of two) feature or the nonpowers-of-2-conditionally feature.
     * @type {BOOL}
     */
    FullNonPow2TextureSupported {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Specifies whether the driver supports the shadowing feature with the comparison-filtering mode set to less than or equal to. The runtime sets this member to <b>TRUE</b> for hardware at Direct3D 10 and higher <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-devices-downlevel-intro">feature levels</a>.  For hardware at Direct3D 9.3 and lower feature levels, the runtime sets this member to <b>TRUE</b> only if the hardware and driver support the shadowing feature; otherwise <b>FALSE</b>.
     * @type {BOOL}
     */
    DepthAsTextureWithLessEqualComparisonFilterSupported {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Specifies whether the hardware and driver support simple instancing. The runtime sets this member to <b>TRUE</b> if  the hardware and driver support simple instancing.
     * @type {BOOL}
     */
    SimpleInstancingSupported {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * Specifies whether the hardware and driver support setting a single face of a <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/texturecube">TextureCube</a> as a render target while the depth stencil surface that is bound alongside can be a <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/sm5-object-texture2d">Texture2D</a> (as opposed to <b>TextureCube</b>). The runtime sets this member to <b>TRUE</b> if  the hardware and driver support this feature; otherwise <b>FALSE</b>.
     * 
     * If the hardware and driver don't support this feature, the app must match the render target surface type with the depth stencil surface type. Because hardware at Direct3D 9.3 and lower <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-devices-downlevel-intro">feature levels</a> doesn't allow <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/texturecube">TextureCube</a> depth surfaces, the only way to render a scene into a <b>TextureCube</b> while having depth buffering enabled is to render each <b>TextureCube</b> face separately to a <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/sm5-object-texture2d">Texture2D</a> render target first (because that can be matched with a <b>Texture2D</b> depth), and then copy the results into the <b>TextureCube</b>.  If  the hardware and driver support this feature, the app can just render to the <b>TextureCube</b> faces directly while getting depth buffering out of a <b>Texture2D</b> depth buffer.
     * 
     * You only need to query this feature from  hardware at Direct3D 9.3 and lower <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-devices-downlevel-intro">feature levels</a> because hardware at Direct3D 10.0 and higher feature levels allow <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/texturecube">TextureCube</a> depth surfaces.
     * @type {BOOL}
     */
    TextureCubeFaceRenderTargetWithNonCubeDepthStencilSupported {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }
}
