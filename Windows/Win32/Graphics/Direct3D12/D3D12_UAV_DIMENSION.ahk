#Requires AutoHotkey v2.0.0 64-bit

/**
 * Identifies unordered-access view options.
 * @remarks
 * Specify one of the values in this enumeration in the <b>ViewDimension</b> member of a <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_unordered_access_view_desc">D3D12_UNORDERED_ACCESS_VIEW_DESC</a> structure.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_uav_dimension
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_UAV_DIMENSION{

    /**
     * The view type is unknown.
     * @type {Integer (Int32)}
     */
    static D3D12_UAV_DIMENSION_UNKNOWN => 0

    /**
     * View the resource as a buffer.
     * @type {Integer (Int32)}
     */
    static D3D12_UAV_DIMENSION_BUFFER => 1

    /**
     * View the resource as a 1D texture.
     * @type {Integer (Int32)}
     */
    static D3D12_UAV_DIMENSION_TEXTURE1D => 2

    /**
     * View the resource as a 1D texture array.
     * @type {Integer (Int32)}
     */
    static D3D12_UAV_DIMENSION_TEXTURE1DARRAY => 3

    /**
     * View the resource as a 2D texture.
     * @type {Integer (Int32)}
     */
    static D3D12_UAV_DIMENSION_TEXTURE2D => 4

    /**
     * View the resource as a 2D texture array.
     * @type {Integer (Int32)}
     */
    static D3D12_UAV_DIMENSION_TEXTURE2DARRAY => 5

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_UAV_DIMENSION_TEXTURE2DMS => 6

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_UAV_DIMENSION_TEXTURE2DMSARRAY => 7

    /**
     * View the resource as a 3D texture array.
     * @type {Integer (Int32)}
     */
    static D3D12_UAV_DIMENSION_TEXTURE3D => 8
}
