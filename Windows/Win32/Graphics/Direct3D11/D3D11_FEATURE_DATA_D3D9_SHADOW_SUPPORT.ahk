#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * Describes Direct3D 9 shadow support in the current graphics driver.
 * @remarks
 * 
  * Shadows are an important element in realistic 3D scenes.  You can use the shadow buffer technique to render shadows.  The basic principle of the technique is to use a depth buffer to store the scene depth info from the perspective of the light source, and then compare each point rendered in the scene with that buffer to determine if it is in shadow.
  * 
  * To render objects into the scene with shadows on them, you create <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/dx-graphics-hlsl-sampler">sampler state objects</a> with comparison filtering set and  the comparison mode (ComparisonFunc) to LessEqual.  You can also set BorderColor addressing on this depth sampler, even though BorderColor isn't typically allowed on <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-devices-downlevel-intro">feature levels</a> 9.1 and 9.2.  By using the border color and picking 0.0 or 1.0 as the border color value, you can control whether the regions off the edge of the shadow map appear to be always in shadow or never in shadow respectively.
  * You can control the shadow filter quality by the Mag and Min filter settings in the comparison sampler.  Point sampling will produce shadows with non-anti-aliased edges.  Linear filter sampler settings will result in higher quality shadow edges, but might affect performance on some power-optimized devices.
  * 
  * <div class="alert"><b>Note</b>  If you use a separate setting for Mag versus Min filter options, you produce an undefined result.  Anisotropic filtering is not supported. The Mip filter choice is not relevant because <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-devices-downlevel-intro">feature level</a> 9.x does not allow mipmapped depth buffers.</div>
  * <div> </div>
  * <div class="alert"><b>Note</b>  On <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-devices-downlevel-intro">feature level</a> 9.x, you can't compile a shader with the <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/dx-graphics-hlsl-to-samplecmp">SampleCmp</a> and <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/dx-graphics-hlsl-to-samplecmplevelzero">SampleCmpLevelZero</a> intrinsic functions by using older versions of the compiler. For example,  you can't use the <a href="https://docs.microsoft.com/windows/desktop/direct3dtools/fxc">fxc.exe</a> compiler that ships with the DirectX SDK or use the <b>D3DCompile**</b> functions (like <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/d3dcompilefromfile">D3DCompileFromFile</a>) that are implemented in D3DCompiler_43.dll and earlier. These intrinsic functions on feature level 9.x are only supported in the fxc.exe compiler that ships with the Windows 8 SDK and later and with the <b>D3DCompile**</b> functions that are implemented in D3DCompiler_44.dll and later.
  * But these intrinsic functions are present in shader models for feature levels higher than 9.x.</div>
  * <div> </div>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d11/ns-d3d11-d3d11_feature_data_d3d9_shadow_support
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_FEATURE_DATA_D3D9_SHADOW_SUPPORT extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * Specifies whether the driver supports the shadowing feature with the comparison-filtering mode set to less than or equal to. The runtime sets this member to <b>TRUE</b> for hardware at Direct3D 10 and higher <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-devices-downlevel-intro">feature levels</a>.  For hardware at Direct3D 9.3 and lower feature levels, the runtime sets this member to <b>TRUE</b> only if the hardware and driver support the shadowing feature; otherwise <b>FALSE</b>.
     * @type {BOOL}
     */
    SupportsDepthAsTextureWithLessEqualComparisonFilter{
        get {
            if(!this.HasProp("__SupportsDepthAsTextureWithLessEqualComparisonFilter"))
                this.__SupportsDepthAsTextureWithLessEqualComparisonFilter := BOOL(this.ptr + 0)
            return this.__SupportsDepthAsTextureWithLessEqualComparisonFilter
        }
    }
}
