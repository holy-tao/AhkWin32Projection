#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies how to access a resource that is used in a video processor output view.
 * @remarks
 * 
 * This enumeration is used with the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_video_processor_output_view_desc">D3D11_VIDEO_PROCESSOR_OUTPUT_VIEW_DESC</a> structure.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d11/ne-d3d11-d3d11_vpov_dimension
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_VPOV_DIMENSION extends Win32Enum{

    /**
     * Not a valid value.
     * @type {Integer (Int32)}
     */
    static D3D11_VPOV_DIMENSION_UNKNOWN => 0

    /**
     * The resource will be accessed as a 2D texture.
     * @type {Integer (Int32)}
     */
    static D3D11_VPOV_DIMENSION_TEXTURE2D => 1

    /**
     * The resource will be accessed as an array of 2D textures.
     * @type {Integer (Int32)}
     */
    static D3D11_VPOV_DIMENSION_TEXTURE2DARRAY => 2
}
