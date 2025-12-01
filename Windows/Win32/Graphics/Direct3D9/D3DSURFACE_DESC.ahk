#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes a surface.
 * @see https://learn.microsoft.com/windows/win32/direct3d9/d3dsurface-desc
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class D3DSURFACE_DESC extends Win32Struct
{
    static sizeof => 32

    static packingSize => 4

    /**
     * Type: **[D3DFORMAT](d3dformat.md)**
     * 
     * 
     * Member of the [D3DFORMAT](d3dformat.md) enumerated type, describing the surface format.
     * @type {Integer}
     */
    Format {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: **[**D3DRESOURCETYPE**](./d3dresourcetype.md)**
     * 
     * 
     * Member of the [**D3DRESOURCETYPE**](./d3dresourcetype.md) enumerated type, identifying this resource as a surface.
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Type: **[**DWORD**](../winprog/windows-data-types.md)**
     * 
     * 
     * Either the D3DUSAGE\_DEPTHSTENCIL or D3DUSAGE\_RENDERTARGET values. For more information, see [**D3DUSAGE**](d3dusage.md).
     * @type {Integer}
     */
    Usage {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: **[**D3DPOOL**](./d3dpool.md)**
     * 
     * 
     * Member of the [**D3DPOOL**](./d3dpool.md) enumerated type, specifying the class of memory allocated for this surface.
     * @type {Integer}
     */
    Pool {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * Type: **[**D3DMULTISAMPLE\_TYPE**](./d3dmultisample-type.md)**
     * 
     * 
     * Member of the [**D3DMULTISAMPLE\_TYPE**](./d3dmultisample-type.md) enumerated type, specifying the levels of full-scene multisampling supported by the surface.
     * @type {Integer}
     */
    MultiSampleType {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * Type: **[**DWORD**](../winprog/windows-data-types.md)**
     * 
     * 
     * Quality level. The valid range is between zero and one less than the level returned by pQualityLevels used by [**CheckDeviceMultiSampleType**](/windows/win32/api/d3d9/nf-d3d9-idirect3d9-checkdevicemultisampletype). Passing a larger value returns the error, D3DERR\_INVALIDCALL. The MultisampleQuality values of paired render targets, depth stencil surfaces and the MultiSample type must all match.
     * @type {Integer}
     */
    MultiSampleQuality {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Type: **[**UINT**](../winprog/windows-data-types.md)**
     * 
     * 
     * Width of the surface, in pixels.
     * @type {Integer}
     */
    Width {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Type: **[**UINT**](../winprog/windows-data-types.md)**
     * 
     * 
     * Height of the surface, in pixels.
     * @type {Integer}
     */
    Height {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }
}
