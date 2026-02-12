#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * Describes a quaternion, which is an abstract representation of an orientation in space that is based on complex numbers.
  * 
  * In C++, **Quaternion** is projected as the [quaternion structure](/windows/win32/numerics_h/quaternion-structure).
 * @remarks
 * The identity quaternion is (0, 0, 0, 1), where the quaternion values are listed in the order (*x*, *y*, *z*, *w*).
 * 
 * These quaternion values do not directly indicate an angle of rotation and an axis.
 * 
 * For more information about quaternions, see [Quaternion]( https://en.wikipedia.org/wiki/Quaternion), [Quaternions and spatial rotation](https://go.microsoft.com/fwlink/p/?LinkId=730456), and [Introducing the Quaternions](https://go.microsoft.com/fwlink/p/?LinkId=730457).
 * @see https://learn.microsoft.com/uwp/api/windows.foundation.numerics.quaternion
 * @namespace Windows.Foundation.Numerics
 * @version WindowsRuntime 1.4
 */
class Quaternion extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * The *x* component of the quaternion, which is the coefficient of the **i** unit vector in the quaternion.
     * @type {Float}
     */
    X {
        get => NumGet(this, 0, "float")
        set => NumPut("float", value, this, 0)
    }

    /**
     * The *y* component of the quaternion, which is the coefficient of the **j** unit vector in the quaternion.
     * @type {Float}
     */
    Y {
        get => NumGet(this, 4, "float")
        set => NumPut("float", value, this, 4)
    }

    /**
     * The *z* component of the quaternion, which is the coefficient of the **k** unit vector in the quaternion.
     * @type {Float}
     */
    Z {
        get => NumGet(this, 8, "float")
        set => NumPut("float", value, this, 8)
    }

    /**
     * The *w* component of the quaternion, which is the real number part of the quaternion.
     * @type {Float}
     */
    W {
        get => NumGet(this, 12, "float")
        set => NumPut("float", value, this, 12)
    }
}
