#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3DMULTISAMPLE_TYPE.ahk" { D3DMULTISAMPLE_TYPE }
#Import ".\D3DRESOURCETYPE.ahk" { D3DRESOURCETYPE }
#Import ".\D3DPOOL.ahk" { D3DPOOL }
#Import ".\D3DFORMAT.ahk" { D3DFORMAT }

/**
 * Describes a surface.
 * @see https://learn.microsoft.com/windows/win32/direct3d9/d3dsurface-desc
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
export default struct D3DSURFACE_DESC {
    #StructPack 4

    /**
     * Type: **[D3DFORMAT](d3dformat.md)**
     * 
     * 
     * Member of the [D3DFORMAT](d3dformat.md) enumerated type, describing the surface format.
     */
    Format : D3DFORMAT

    /**
     * Type: **[**D3DRESOURCETYPE**](./d3dresourcetype.md)**
     * 
     * 
     * Member of the [**D3DRESOURCETYPE**](./d3dresourcetype.md) enumerated type, identifying this resource as a surface.
     */
    Type : D3DRESOURCETYPE

    /**
     * Type: **[**DWORD**](../winprog/windows-data-types.md)**
     * 
     * 
     * Either the D3DUSAGE\_DEPTHSTENCIL or D3DUSAGE\_RENDERTARGET values. For more information, see [**D3DUSAGE**](d3dusage.md).
     */
    Usage : UInt32

    /**
     * Type: **[**D3DPOOL**](./d3dpool.md)**
     * 
     * 
     * Member of the [**D3DPOOL**](./d3dpool.md) enumerated type, specifying the class of memory allocated for this surface.
     */
    Pool : D3DPOOL

    /**
     * Type: **[**D3DMULTISAMPLE\_TYPE**](./d3dmultisample-type.md)**
     * 
     * 
     * Member of the [**D3DMULTISAMPLE\_TYPE**](./d3dmultisample-type.md) enumerated type, specifying the levels of full-scene multisampling supported by the surface.
     */
    MultiSampleType : D3DMULTISAMPLE_TYPE

    /**
     * Type: **[**DWORD**](../winprog/windows-data-types.md)**
     * 
     * 
     * Quality level. The valid range is between zero and one less than the level returned by pQualityLevels used by [**CheckDeviceMultiSampleType**](/windows/win32/api/d3d9/nf-d3d9-idirect3d9-checkdevicemultisampletype). Passing a larger value returns the error, D3DERR\_INVALIDCALL. The MultisampleQuality values of paired render targets, depth stencil surfaces and the MultiSample type must all match.
     */
    MultiSampleQuality : UInt32

    /**
     * Type: **[**UINT**](../winprog/windows-data-types.md)**
     * 
     * 
     * Width of the surface, in pixels.
     */
    Width : UInt32

    /**
     * Type: **[**UINT**](../winprog/windows-data-types.md)**
     * 
     * 
     * Height of the surface, in pixels.
     */
    Height : UInt32

}
