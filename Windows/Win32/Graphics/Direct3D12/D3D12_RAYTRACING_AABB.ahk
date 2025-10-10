#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents an axis-aligned bounding box (AABB) used as raytracing geometry.
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ns-d3d12-d3d12_raytracing_aabb
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_RAYTRACING_AABB extends Win32Struct
{
    static sizeof => 24

    static packingSize => 4

    /**
     * The minimum X coordinate of the box.
     * @type {Float}
     */
    MinX {
        get => NumGet(this, 0, "float")
        set => NumPut("float", value, this, 0)
    }

    /**
     * The minimum Y coordinate of the box.
     * @type {Float}
     */
    MinY {
        get => NumGet(this, 4, "float")
        set => NumPut("float", value, this, 4)
    }

    /**
     * The minimum Z coordinate of the box.
     * @type {Float}
     */
    MinZ {
        get => NumGet(this, 8, "float")
        set => NumPut("float", value, this, 8)
    }

    /**
     * The maximum X coordinate of the box.
     * @type {Float}
     */
    MaxX {
        get => NumGet(this, 12, "float")
        set => NumPut("float", value, this, 12)
    }

    /**
     * The maximum Y coordinate of the box.
     * @type {Float}
     */
    MaxY {
        get => NumGet(this, 16, "float")
        set => NumPut("float", value, this, 16)
    }

    /**
     * The maximum Z coordinate of the box.
     * @type {Float}
     */
    MaxZ {
        get => NumGet(this, 20, "float")
        set => NumPut("float", value, this, 20)
    }
}
