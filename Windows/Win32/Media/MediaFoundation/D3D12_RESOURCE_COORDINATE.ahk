#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes the coordinates of a resource.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_resource_coordinate
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_RESOURCE_COORDINATE {
    #StructPack 8

    /**
     * The x-coordinate of the resource.
     */
    X : Int64

    /**
     * The y-coordinate of the resource.
     */
    Y : UInt32

    /**
     * The z-coordinate of the resource.
     */
    Z : UInt32

    /**
     * The index of the subresource for the resource.
     */
    SubresourceIndex : UInt32

}
