#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * Describes a 4*4 floating point matrix.
  * 
  * In C++, **Matrix4x4** is projected as the [float4x4 structure](/windows/win32/numerics_h/float4x4-structure).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.foundation.numerics.matrix4x4
 * @namespace Windows.Foundation.Numerics
 * @version WindowsRuntime 1.4
 */
class Matrix4x4 extends Win32Struct
{
    static sizeof => 64

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
     * The row one and column three element of the matrix.
     * @type {Float}
     */
    M13 {
        get => NumGet(this, 8, "float")
        set => NumPut("float", value, this, 8)
    }

    /**
     * The row one and column four element of the matrix.
     * @type {Float}
     */
    M14 {
        get => NumGet(this, 12, "float")
        set => NumPut("float", value, this, 12)
    }

    /**
     * The row two and column one element of the matrix.
     * @type {Float}
     */
    M21 {
        get => NumGet(this, 16, "float")
        set => NumPut("float", value, this, 16)
    }

    /**
     * The row two and column two element of the matrix.
     * @type {Float}
     */
    M22 {
        get => NumGet(this, 20, "float")
        set => NumPut("float", value, this, 20)
    }

    /**
     * The row two and column three element of the matrix.
     * @type {Float}
     */
    M23 {
        get => NumGet(this, 24, "float")
        set => NumPut("float", value, this, 24)
    }

    /**
     * The row two and column four element of the matrix.
     * @type {Float}
     */
    M24 {
        get => NumGet(this, 28, "float")
        set => NumPut("float", value, this, 28)
    }

    /**
     * The row three and column one element of the matrix.
     * @type {Float}
     */
    M31 {
        get => NumGet(this, 32, "float")
        set => NumPut("float", value, this, 32)
    }

    /**
     * The row three and column two element of the matrix.
     * @type {Float}
     */
    M32 {
        get => NumGet(this, 36, "float")
        set => NumPut("float", value, this, 36)
    }

    /**
     * The row three and column three element of the matrix.
     * @type {Float}
     */
    M33 {
        get => NumGet(this, 40, "float")
        set => NumPut("float", value, this, 40)
    }

    /**
     * The row three and column four element of the matrix.
     * @type {Float}
     */
    M34 {
        get => NumGet(this, 44, "float")
        set => NumPut("float", value, this, 44)
    }

    /**
     * The row four and column one element of the matrix.
     * @type {Float}
     */
    M41 {
        get => NumGet(this, 48, "float")
        set => NumPut("float", value, this, 48)
    }

    /**
     * The row four and column two element of the matrix.
     * @type {Float}
     */
    M42 {
        get => NumGet(this, 52, "float")
        set => NumPut("float", value, this, 52)
    }

    /**
     * The row four and column three element of the matrix.
     * @type {Float}
     */
    M43 {
        get => NumGet(this, 56, "float")
        set => NumPut("float", value, this, 56)
    }

    /**
     * The row four and column four element of the matrix.
     * @type {Float}
     */
    M44 {
        get => NumGet(this, 60, "float")
        set => NumPut("float", value, this, 60)
    }
}
