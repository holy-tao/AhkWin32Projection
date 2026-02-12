#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * An oriented bounding box in the user's surroundings, with coordinates expressed in meters.
 * @remarks
 * The SpatialBoundingOrientedBox is defined by its center and extents, plus an orientation relative to the coordinate system's axes. Its coordinates are expressed in meters, and are meaningful in a specific coordinate system usually specified alongside the box.
 * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.spatialboundingorientedbox
 * @namespace Windows.Perception.Spatial
 * @version WindowsRuntime 1.4
 */
class SpatialBoundingOrientedBox extends Win32Struct
{
    static sizeof => 24

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
     * The size of the bounding box along each axis, prior to rotation.
     * @type {Pointer<Vector3>}
     */
    Extents {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The rotation of the bounding box, relative to the coordinate system's axes.
     * @type {Pointer<Quaternion>}
     */
    Orientation {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
