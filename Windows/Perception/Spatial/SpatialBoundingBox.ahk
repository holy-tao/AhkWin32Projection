#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * An axis-aligned bounding box in the user's surroundings, with coordinates expressed in meters.
 * @remarks
 * The SpatialBoundingBox is defined by its center and extents, with its edges aligned to the X, Y, and Z axes. Its coordinates are expressed in meters, and are meaningful in a specific coordinate system usually specified alongside the box.
 * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.spatialboundingbox
 * @namespace Windows.Perception.Spatial
 * @version WindowsRuntime 1.4
 */
class SpatialBoundingBox extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The position of the center of the bounding box.
     * @type {Pointer<Vector3>}
     */
    Center {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The distance from the center of the bounding box to its edges, along each axis.
     * @type {Pointer<Vector3>}
     */
    Extents {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
