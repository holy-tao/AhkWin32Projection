#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * Specifies how to parse data in the buffer.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.printing3dbufferdescription
 * @namespace Windows.Graphics.Printing3D
 * @version WindowsRuntime 1.4
 */
class Printing3DBufferDescription extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Specifies the format used by the buffer.
     * @type {Integer}
     */
    Format {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Specifies how far to move the pointer forward to find the next unit of data.
     * @type {Integer}
     */
    Stride {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
