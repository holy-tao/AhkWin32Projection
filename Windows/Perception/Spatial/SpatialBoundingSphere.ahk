#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * A bounding sphere in the user's surroundings, with coordinates expressed in meters.
 * @remarks
 * The SpatialBoundingSphere is defined by its center and radius. Its coordinates are expressed in meters, and are meaningful in a specific coordinate system usually specified alongside the sphere.
 * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.spatialboundingsphere
 * @namespace Windows.Perception.Spatial
 * @version WindowsRuntime 1.4
 */
class SpatialBoundingSphere extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The position of the center of the sphere.
     * @type {Pointer<Vector3>}
     */
    Center {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The radius of the sphere.
     * @type {Float}
     */
    Radius {
        get => NumGet(this, 8, "float")
        set => NumPut("float", value, this, 8)
    }
}
