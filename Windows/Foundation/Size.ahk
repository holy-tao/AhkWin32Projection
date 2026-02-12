#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32Struct.ahk

/**
 * Represents number values that specify a height and width.
 * @remarks
 * When applied to properties that represent UI information, the width and height values of a Size value represent device-independent pixels.
 * 
 * > **JavaScript**
 * > In JavaScript, a Size is an object with 2 data properties: **width** and **height**. The API listed in the Size member lists don't apply to JavaScript programming.
 * @see https://learn.microsoft.com/uwp/api/windows.foundation.size
 * @namespace Windows.Foundation
 * @version WindowsRuntime 1.4
 */
class Size extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The width.
     * @type {Float}
     */
    Width {
        get => NumGet(this, 0, "float")
        set => NumPut("float", value, this, 0)
    }

    /**
     * The height.
     * @type {Float}
     */
    Height {
        get => NumGet(this, 4, "float")
        set => NumPut("float", value, this, 4)
    }
}
