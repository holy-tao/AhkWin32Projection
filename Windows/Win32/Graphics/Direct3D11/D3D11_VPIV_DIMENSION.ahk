#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies how to access a resource that is used in a video processor input view.
 * @remarks
 * 
 * This enumeration is used with the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_video_processor_input_view_desc">D3D11_VIDEO_PROCESSOR_INPUT_VIEW_DESC</a> structure.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d11/ne-d3d11-d3d11_vpiv_dimension
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_VPIV_DIMENSION{

    /**
     * Not a valid value.
     * @type {Integer (Int32)}
     */
    static D3D11_VPIV_DIMENSION_UNKNOWN => 0

    /**
     * The resource will be accessed as a 2D texture.
     * @type {Integer (Int32)}
     */
    static D3D11_VPIV_DIMENSION_TEXTURE2D => 1
}
