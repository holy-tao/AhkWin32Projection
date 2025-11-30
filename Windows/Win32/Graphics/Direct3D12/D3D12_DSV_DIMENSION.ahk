#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies how to access a resource used in a depth-stencil view.
 * @remarks
 * 
 * Specify one of the values in this enumeration in the <b>ViewDimension</b> member of a <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_depth_stencil_view_desc">D3D12_DEPTH_STENCIL_VIEW_DESC</a> structure.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ne-d3d12-d3d12_dsv_dimension
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_DSV_DIMENSION extends Win32Enum{

    /**
     * <b>D3D12_DSV_DIMENSION_UNKNOWN</b> is not a valid value for <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_depth_stencil_view_desc">D3D12_DEPTH_STENCIL_VIEW_DESC</a> and is not used.
     * @type {Integer (Int32)}
     */
    static D3D12_DSV_DIMENSION_UNKNOWN => 0

    /**
     * The resource will be accessed as a 1D texture.
     * @type {Integer (Int32)}
     */
    static D3D12_DSV_DIMENSION_TEXTURE1D => 1

    /**
     * The resource will be accessed as an array of 1D textures.
     * @type {Integer (Int32)}
     */
    static D3D12_DSV_DIMENSION_TEXTURE1DARRAY => 2

    /**
     * The resource will be accessed as a 2D texture.
     * @type {Integer (Int32)}
     */
    static D3D12_DSV_DIMENSION_TEXTURE2D => 3

    /**
     * The resource will be accessed as an array of 2D textures.
     * @type {Integer (Int32)}
     */
    static D3D12_DSV_DIMENSION_TEXTURE2DARRAY => 4

    /**
     * The resource will be accessed as a 2D texture with multi sampling.
     * @type {Integer (Int32)}
     */
    static D3D12_DSV_DIMENSION_TEXTURE2DMS => 5

    /**
     * The resource will be accessed as an array of 2D textures with multi sampling.
     * @type {Integer (Int32)}
     */
    static D3D12_DSV_DIMENSION_TEXTURE2DMSARRAY => 6
}
