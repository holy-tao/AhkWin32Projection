#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Describes a 4-by-3 floating point matrix.
 * @remarks
 * 
 * The <b>D2D1_MATRIX_4X3_F</b> structure is type defined from a <b>D2D_MATRIX_4X3_F</b> structure in D2d1_1.h.
 * 
 * ```cpp
 * typedef D2D_MATRIX_4X3_F D2D1_MATRIX_4X3_F;
 * ```
 * 
 * @see https://docs.microsoft.com/windows/win32/api//dcommon/ns-dcommon-d2d_matrix_4x3_f
 * @namespace Windows.Win32.Graphics.Direct2D.Common
 * @version v4.0.30319
 */
class D2D_MATRIX_4X3_F extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {Float}
     */
    _11 {
        get => NumGet(this, 0, "float")
        set => NumPut("float", value, this, 0)
    }

    /**
     * @type {Float}
     */
    _12 {
        get => NumGet(this, 4, "float")
        set => NumPut("float", value, this, 4)
    }

    /**
     * @type {Float}
     */
    _13 {
        get => NumGet(this, 8, "float")
        set => NumPut("float", value, this, 8)
    }

    /**
     * @type {Float}
     */
    _21 {
        get => NumGet(this, 12, "float")
        set => NumPut("float", value, this, 12)
    }

    /**
     * @type {Float}
     */
    _22 {
        get => NumGet(this, 16, "float")
        set => NumPut("float", value, this, 16)
    }

    /**
     * @type {Float}
     */
    _23 {
        get => NumGet(this, 20, "float")
        set => NumPut("float", value, this, 20)
    }

    /**
     * @type {Float}
     */
    _31 {
        get => NumGet(this, 24, "float")
        set => NumPut("float", value, this, 24)
    }

    /**
     * @type {Float}
     */
    _32 {
        get => NumGet(this, 28, "float")
        set => NumPut("float", value, this, 28)
    }

    /**
     * @type {Float}
     */
    _33 {
        get => NumGet(this, 32, "float")
        set => NumPut("float", value, this, 32)
    }

    /**
     * @type {Float}
     */
    _41 {
        get => NumGet(this, 36, "float")
        set => NumPut("float", value, this, 36)
    }

    /**
     * @type {Float}
     */
    _42 {
        get => NumGet(this, 40, "float")
        set => NumPut("float", value, this, 40)
    }

    /**
     * @type {Float}
     */
    _43 {
        get => NumGet(this, 44, "float")
        set => NumPut("float", value, this, 44)
    }

    /**
     * @type {Array<Single>}
     */
    m{
        get {
            if(!this.HasProp("__mProxyArray"))
                this.__mProxyArray := Win32FixedArray(this.ptr + 0, 12, Primitive, "float")
            return this.__mProxyArray
        }
    }
}
