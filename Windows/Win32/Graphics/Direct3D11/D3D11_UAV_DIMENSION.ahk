#Requires AutoHotkey v2.0.0 64-bit

/**
 * Unordered-access view options.
 * @remarks
 * 
  * This enumeration is used by a unordered access-view description (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_unordered_access_view_desc">D3D11_UNORDERED_ACCESS_VIEW_DESC</a>).
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d11/ne-d3d11-d3d11_uav_dimension
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_UAV_DIMENSION{

    /**
     * The view type is unknown.
     * @type {Integer (Int32)}
     */
    static D3D11_UAV_DIMENSION_UNKNOWN => 0

    /**
     * View the resource as a buffer.
     * @type {Integer (Int32)}
     */
    static D3D11_UAV_DIMENSION_BUFFER => 1

    /**
     * View the resource as a 1D texture.
     * @type {Integer (Int32)}
     */
    static D3D11_UAV_DIMENSION_TEXTURE1D => 2

    /**
     * View the resource as a 1D texture array.
     * @type {Integer (Int32)}
     */
    static D3D11_UAV_DIMENSION_TEXTURE1DARRAY => 3

    /**
     * View the resource as a 2D texture.
     * @type {Integer (Int32)}
     */
    static D3D11_UAV_DIMENSION_TEXTURE2D => 4

    /**
     * View the resource as a 2D texture array.
     * @type {Integer (Int32)}
     */
    static D3D11_UAV_DIMENSION_TEXTURE2DARRAY => 5

    /**
     * View the resource as a 3D texture array.
     * @type {Integer (Int32)}
     */
    static D3D11_UAV_DIMENSION_TEXTURE3D => 8
}
