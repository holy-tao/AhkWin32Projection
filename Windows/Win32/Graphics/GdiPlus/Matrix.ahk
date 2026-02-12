#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Win32Handle.ahk

/**
 * A matrix is a special data type that contains between one and sixteen components. Every component of a matrix must be of the same type.
 * @see https://learn.microsoft.com/windows/win32/ktop-src/direct3dhlsl/dx-graphics-hlsl-matrix
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class Matrix extends Win32Handle
{
    static sizeof => 8

    static packingSize => 8

    /**
     * The list of values which indicate that the handle is invalid
     * @type {Array<Integer>}
     */
    static invalidValues => []

    /**
     * @type {Pointer}
     */
    Value {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }
}
