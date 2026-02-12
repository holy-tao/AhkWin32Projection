#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * Describes a vector of four floating-point components.
  * 
  * In C++, **Vector4** is projected as the [float4 structure](/windows/win32/numerics_h/float4-structure).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.foundation.numerics.vector4
 * @namespace Windows.Foundation.Numerics
 * @version WindowsRuntime 1.4
 */
class Vector4 extends Win32Struct
{
    static sizeof => 16

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

    /**
     * The w component of the vector.
     * @type {Float}
     */
    W {
        get => NumGet(this, 12, "float")
        set => NumPut("float", value, this, 12)
    }
}
