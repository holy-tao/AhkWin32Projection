#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * Describes a plane (a flat, two-dimensional surface).
  * 
  * In C++, **Plane** is projected as the [plane structure](/windows/win32/numerics_h/plane-structure).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.foundation.numerics.plane
 * @namespace Windows.Foundation.Numerics
 * @version WindowsRuntime 1.4
 */
class Plane extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * A vector of three floating-point components on the plane.
     * @type {Pointer<Vector3>}
     */
    Normal {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * A floating-point value for a point on the plane but not on the **Normal** vector.
     * @type {Float}
     */
    D {
        get => NumGet(this, 8, "float")
        set => NumPut("float", value, this, 8)
    }
}
