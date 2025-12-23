#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines texture filtering modes for a texture stage.
 * @remarks
 * D3DTEXTUREFILTERTYPE is used by [**IDirect3DDevice9::SetSamplerState**](/windows/win32/api/d3d9helper/nf-d3d9helper-idirect3ddevice9-setsamplerstate) along with [**D3DSAMPLERSTATETYPE**](./d3dsamplerstatetype.md) to define texture filtering modes for a texture stage.
 * 
 * To check if a format supports texture filter types other than D3DTEXF\_POINT (which is always supported), call [**IDirect3D9::CheckDeviceFormat**](/windows/win32/api/d3d9/nf-d3d9-idirect3d9-checkdeviceformat) with D3DUSAGE\_QUERY\_FILTER.
 * 
 * Set a texture stage's magnification filter by calling [**IDirect3DDevice9::SetSamplerState**](/windows/win32/api/d3d9helper/nf-d3d9helper-idirect3ddevice9-setsamplerstate) with the D3DSAMP\_MAGFILTER value as the second parameter and one member of this enumeration as the third parameter.
 * 
 * Set a texture stage's minification filter by calling [**IDirect3DDevice9::SetSamplerState**](/windows/win32/api/d3d9helper/nf-d3d9helper-idirect3ddevice9-setsamplerstate) with the D3DSAMP\_MINFILTER value as the second parameter and one member of this enumeration as the third parameter.
 * 
 * Set the texture filter to use between-mipmap levels by calling [**IDirect3DDevice9::SetSamplerState**](/windows/win32/api/d3d9helper/nf-d3d9helper-idirect3ddevice9-setsamplerstate) with the D3DSAMP\_MIPFILTER value as the second parameter and one member of this enumeration as the third parameter.
 * 
 * Not all valid filtering modes for a device will apply to volume maps. In general, D3DTEXF\_POINT and D3DTEXF\_LINEAR magnification filters will be supported for volume maps. If D3DPTEXTURECAPS\_MIPVOLUMEMAP is set, then the D3DTEXF\_POINT mipmap filter and D3DTEXF\_POINT and D3DTEXF\_LINEAR minification filters will be supported for volume maps. The device may or may not support the D3DTEXF\_LINEAR mipmap filter for volume maps. Devices that support anisotropic filtering for 2D maps do not necessarily support anisotropic filtering for volume maps. However, applications that enable anisotropic filtering will receive the best available filtering (probably linear) if anisotropic filtering is not supported.
 * @see https://learn.microsoft.com/windows/win32/direct3d9/d3dtexturefiltertype
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class D3DTEXTUREFILTERTYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static D3DTEXF_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DTEXF_POINT => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DTEXF_LINEAR => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DTEXF_ANISOTROPIC => 3

    /**
     * @type {Integer (Int32)}
     */
    static D3DTEXF_PYRAMIDALQUAD => 6

    /**
     * @type {Integer (Int32)}
     */
    static D3DTEXF_GAUSSIANQUAD => 7

    /**
     * @type {Integer (Int32)}
     */
    static D3DTEXF_CONVOLUTIONMONO => 8
}
