#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents an arbitrary affine 2D transformation defined by a 3-by-2 matrix. (PresentationTransform)
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/presentationtypes/ns-presentationtypes-presentationtransform
 * @namespace Windows.Win32.Graphics.CompositionSwapchain
 * @version v4.0.30319
 */
class PresentationTransform extends Win32Struct
{
    static sizeof => 24

    static packingSize => 4

    /**
     * Type: **[FLOAT](/windows/win32/winprog/windows-data-types)**
     * 
     * The value of the first row and first column of this transform matrix structure.
     * @type {Float}
     */
    M11 {
        get => NumGet(this, 0, "float")
        set => NumPut("float", value, this, 0)
    }

    /**
     * Type: **[FLOAT](/windows/win32/winprog/windows-data-types)**
     * 
     * The value of the first row and second column of this transform matrix structure.
     * @type {Float}
     */
    M12 {
        get => NumGet(this, 4, "float")
        set => NumPut("float", value, this, 4)
    }

    /**
     * Type: **[FLOAT](/windows/win32/winprog/windows-data-types)**
     * 
     * The value of the second row and first column of this transform matrix structure.
     * @type {Float}
     */
    M21 {
        get => NumGet(this, 8, "float")
        set => NumPut("float", value, this, 8)
    }

    /**
     * Type: **[FLOAT](/windows/win32/winprog/windows-data-types)**
     * 
     * The value of the second row and second column of this transform matrix structure.
     * @type {Float}
     */
    M22 {
        get => NumGet(this, 12, "float")
        set => NumPut("float", value, this, 12)
    }

    /**
     * Type: **[FLOAT](/windows/win32/winprog/windows-data-types)**
     * 
     * The value of the third row and first column of this transform matrix structure.
     * @type {Float}
     */
    M31 {
        get => NumGet(this, 16, "float")
        set => NumPut("float", value, this, 16)
    }

    /**
     * Type: **[FLOAT](/windows/win32/winprog/windows-data-types)**
     * 
     * The value of the third row and second column of this transform matrix structure.
     * @type {Float}
     */
    M32 {
        get => NumGet(this, 20, "float")
        set => NumPut("float", value, this, 20)
    }
}
