#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Identifies unordered-access view options.
 * @remarks
 * Specify one of the values in this enumeration in the <b>ViewDimension</b> member of a <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_unordered_access_view_desc">D3D12_UNORDERED_ACCESS_VIEW_DESC</a> structure.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_uav_dimension
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
class D3D12_UAV_DIMENSION extends Win32Enum {

    /**
     * The view type is unknown.
     * Native name: D3D12_UAV_DIMENSION_UNKNOWN
     * @type {Integer (Int32)}
     */
    static UNKNOWN => 0

    /**
     * View the resource as a buffer.
     * Native name: D3D12_UAV_DIMENSION_BUFFER
     * @type {Integer (Int32)}
     */
    static BUFFER => 1

    /**
     * View the resource as a 1D texture.
     * Native name: D3D12_UAV_DIMENSION_TEXTURE1D
     * @type {Integer (Int32)}
     */
    static TEXTURE1D => 2

    /**
     * View the resource as a 1D texture array.
     * Native name: D3D12_UAV_DIMENSION_TEXTURE1DARRAY
     * @type {Integer (Int32)}
     */
    static TEXTURE1DARRAY => 3

    /**
     * View the resource as a 2D texture.
     * Native name: D3D12_UAV_DIMENSION_TEXTURE2D
     * @type {Integer (Int32)}
     */
    static TEXTURE2D => 4

    /**
     * View the resource as a 2D texture array.
     * Native name: D3D12_UAV_DIMENSION_TEXTURE2DARRAY
     * @type {Integer (Int32)}
     */
    static TEXTURE2DARRAY => 5

    /**
     * Native name: D3D12_UAV_DIMENSION_TEXTURE2DMS
     * @type {Integer (Int32)}
     */
    static TEXTURE2DMS => 6

    /**
     * Native name: D3D12_UAV_DIMENSION_TEXTURE2DMSARRAY
     * @type {Integer (Int32)}
     */
    static TEXTURE2DMSARRAY => 7

    /**
     * View the resource as a 3D texture array.
     * Native name: D3D12_UAV_DIMENSION_TEXTURE3D
     * @type {Integer (Int32)}
     */
    static TEXTURE3D => 8

    /**
     * Native name: D3D12_UAV_DIMENSION_BUFFER_BYTE_OFFSET
     * @type {Integer (Int32)}
     */
    static BUFFER_BYTE_OFFSET => 9
}
