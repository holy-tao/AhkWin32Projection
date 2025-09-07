#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes the coordinates of a resource.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_resource_coordinate
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_RESOURCE_COORDINATE extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The x-coordinate of the resource.
     * @type {Integer}
     */
    X {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The y-coordinate of the resource.
     * @type {Integer}
     */
    Y {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The z-coordinate of the resource.
     * @type {Integer}
     */
    Z {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * The index of the subresource for the resource.
     * @type {Integer}
     */
    SubresourceIndex {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
