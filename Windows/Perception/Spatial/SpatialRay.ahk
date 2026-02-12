#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * A ray in the user's surroundings, with coordinates expressed in meters.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.spatialray
 * @namespace Windows.Perception.Spatial
 * @version WindowsRuntime 1.4
 */
class SpatialRay extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The origin of the ray.
     * @type {Pointer<Vector3>}
     */
    Origin {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The unit vector pointing in the direction of the ray.
     * @type {Pointer<Vector3>}
     */
    Direction {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
