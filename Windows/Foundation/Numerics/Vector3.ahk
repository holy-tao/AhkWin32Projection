#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * Describes a vector of three floating-point components.
  * 
  * In C++, **Vector3** is projected as the [float3 structure](/windows/win32/numerics_h/float3-structure).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.foundation.numerics.vector3
 * @namespace Windows.Foundation.Numerics
 * @version WindowsRuntime 1.4
 */
class Vector3 extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * The x component of the vector.
     * @type {Float}
     */
    X {
        get => NumGet(this, 0, "float")
        set => NumPut("float", value, this, 0)
    }

    /**
     * The y component of the vector.
     * @type {Float}
     */
    Y {
        get => NumGet(this, 4, "float")
        set => NumPut("float", value, this, 4)
    }

    /**
     * The z component of the vector.
     * @type {Float}
     */
    Z {
        get => NumGet(this, 8, "float")
        set => NumPut("float", value, this, 8)
    }
}
