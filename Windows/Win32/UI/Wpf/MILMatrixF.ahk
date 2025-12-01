#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents a 4x4 affine transformation matrix.
 * @see https://learn.microsoft.com/windows/win32/api/mileffects/ns-mileffects-milmatrixf
 * @namespace Windows.Win32.UI.Wpf
 * @version v4.0.30319
 */
class MILMatrixF extends Win32Struct
{
    static sizeof => 128

    static packingSize => 8

    /**
     * Type: <b>DOUBLE</b>
     * 
     * The value of the first row and first column of the matrix.
     * @type {Float}
     */
    _11 {
        get => NumGet(this, 0, "double")
        set => NumPut("double", value, this, 0)
    }

    /**
     * Type: <b>DOUBLE</b>
     * 
     * The value of the first row and second column of the matrix.
     * @type {Float}
     */
    _12 {
        get => NumGet(this, 8, "double")
        set => NumPut("double", value, this, 8)
    }

    /**
     * Type: <b>DOUBLE</b>
     * 
     * The value of the first row and third column of the matrix.
     * @type {Float}
     */
    _13 {
        get => NumGet(this, 16, "double")
        set => NumPut("double", value, this, 16)
    }

    /**
     * Type: <b>DOUBLE</b>
     * 
     * The value of the first row and forth column of the matrix.
     * @type {Float}
     */
    _14 {
        get => NumGet(this, 24, "double")
        set => NumPut("double", value, this, 24)
    }

    /**
     * Type: <b>DOUBLE</b>
     * 
     * The value of the second row and first column of the matrix.
     * @type {Float}
     */
    _21 {
        get => NumGet(this, 32, "double")
        set => NumPut("double", value, this, 32)
    }

    /**
     * Type: <b>DOUBLE</b>
     * 
     * The value of the second row and second column of the matrix.
     * @type {Float}
     */
    _22 {
        get => NumGet(this, 40, "double")
        set => NumPut("double", value, this, 40)
    }

    /**
     * Type: <b>DOUBLE</b>
     * 
     * The value of the fisecondrst row and third column of the matrix.
     * @type {Float}
     */
    _23 {
        get => NumGet(this, 48, "double")
        set => NumPut("double", value, this, 48)
    }

    /**
     * Type: <b>DOUBLE</b>
     * 
     * The value of the second row and forth column of the matrix.
     * @type {Float}
     */
    _24 {
        get => NumGet(this, 56, "double")
        set => NumPut("double", value, this, 56)
    }

    /**
     * Type: <b>DOUBLE</b>
     * 
     * The value of the third row and first column of the matrix.
     * @type {Float}
     */
    _31 {
        get => NumGet(this, 64, "double")
        set => NumPut("double", value, this, 64)
    }

    /**
     * Type: <b>DOUBLE</b>
     * 
     * The value of the third row and second column of the matrix.
     * @type {Float}
     */
    _32 {
        get => NumGet(this, 72, "double")
        set => NumPut("double", value, this, 72)
    }

    /**
     * Type: <b>DOUBLE</b>
     * 
     * The value of the third row and third column of the matrix.
     * @type {Float}
     */
    _33 {
        get => NumGet(this, 80, "double")
        set => NumPut("double", value, this, 80)
    }

    /**
     * Type: <b>DOUBLE</b>
     * 
     * The value of the third row and forth column of the matrix.
     * @type {Float}
     */
    _34 {
        get => NumGet(this, 88, "double")
        set => NumPut("double", value, this, 88)
    }

    /**
     * Type: <b>DOUBLE</b>
     * 
     * The value of the forth row and first column of the matrix.
     * @type {Float}
     */
    _41 {
        get => NumGet(this, 96, "double")
        set => NumPut("double", value, this, 96)
    }

    /**
     * Type: <b>DOUBLE</b>
     * 
     * The value of the forth row and second column of the matrix.
     * @type {Float}
     */
    _42 {
        get => NumGet(this, 104, "double")
        set => NumPut("double", value, this, 104)
    }

    /**
     * Type: <b>DOUBLE</b>
     * 
     * The value of the forth row and third column of the matrix.
     * @type {Float}
     */
    _43 {
        get => NumGet(this, 112, "double")
        set => NumPut("double", value, this, 112)
    }

    /**
     * Type: <b>DOUBLE</b>
     * 
     * The value of the forth row and forth column of the matrix.
     * @type {Float}
     */
    _44 {
        get => NumGet(this, 120, "double")
        set => NumPut("double", value, this, 120)
    }
}
