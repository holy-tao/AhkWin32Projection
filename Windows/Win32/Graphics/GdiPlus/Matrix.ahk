#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * A Matrix object represents a 3 �3 matrix that, in turn, represents an affine transformation.
 * @see https://docs.microsoft.com/windows/win32/api//gdiplusmatrix/nl-gdiplusmatrix-matrix
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class Matrix extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * @type {Pointer}
     */
    Value {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }
}
