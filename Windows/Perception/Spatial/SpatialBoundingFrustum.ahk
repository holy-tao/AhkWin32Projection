#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * A bounding frustum in the user's surroundings defined as a set of 6 planes, with coordinates expressed in meters.
 * @remarks
 * A frustum is a rectangular pyramid clipped by a near plane and a far plane. When used as a view frustum, the volume within the frustum represents the view of a camera.
 * 
 * The normals for the 6 planes each face out from the frustum, defining its volume. Its coordinates are expressed in meters, and are meaningful in a specific coordinate system usually specified alongside the frustum.
 * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.spatialboundingfrustum
 * @namespace Windows.Perception.Spatial
 * @version WindowsRuntime 1.4
 */
class SpatialBoundingFrustum extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * The near Plane defines the boundary for the closest content within the frustum.
     * @type {Pointer<Plane>}
     */
    Near {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The far Plane defines the boundary for the farthest content within the frustum.
     * @type {Pointer<Plane>}
     */
    Far {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The right Plane defines the boundary for the rightmost content within the frustum.
     * @type {Pointer<Plane>}
     */
    Right {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * The left Plane defines the boundary for the leftmost content within the frustum.
     * @type {Pointer<Plane>}
     */
    Left {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * The top Plane defines the boundary for the topmost content within the frustum.
     * @type {Pointer<Plane>}
     */
    Top {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * The bottom Plane defines the boundary for the bottommost content within the frustum.
     * @type {Pointer<Plane>}
     */
    Bottom {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }
}
