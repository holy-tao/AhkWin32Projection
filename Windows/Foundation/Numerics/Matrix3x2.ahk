#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * Describes a 3*2 floating point matrix.
  * 
  * In C++, **Matrix3x2** is projected as the [float3x2 structure](/windows/win32/numerics_h/float3x2-structure).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.foundation.numerics.matrix3x2
 * @namespace Windows.Foundation.Numerics
 * @version WindowsRuntime 1.4
 */
class Matrix3x2 extends Win32Struct
{
    static sizeof => 24

    static packingSize => 4

    /**
     * The row one and column one element of the matrix.
     * @type {Float}
     */
    M11 {
        get => NumGet(this, 0, "float")
        set => NumPut("float", value, this, 0)
    }

    /**
     * The row one and column two element of the matrix.
     * @type {Float}
     */
    M12 {
        get => NumGet(this, 4, "float")
        set => NumPut("float", value, this, 4)
    }

    /**
     * The row two and column one element of the matrix.
     * @type {Float}
     */
    M21 {
        get => NumGet(this, 8, "float")
        set => NumPut("float", value, this, 8)
    }

    /**
     * The row two and column two element of the matrix.
     * @type {Float}
     */
    M22 {
        get => NumGet(this, 12, "float")
        set => NumPut("float", value, this, 12)
    }

    /**
     * The row three and column one element of the matrix.
     * @type {Float}
     */
    M31 {
        get => NumGet(this, 16, "float")
        set => NumPut("float", value, this, 16)
    }

    /**
     * The row three and column two element of the matrix.
     * @type {Float}
     */
    M32 {
        get => NumGet(this, 20, "float")
        set => NumPut("float", value, this, 20)
    }
}
