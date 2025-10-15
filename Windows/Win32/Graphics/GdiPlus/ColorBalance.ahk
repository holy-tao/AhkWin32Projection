#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk
#Include .\Effect.ahk

/**
 * The ColorBalance class enables you to change the color balance (relative amounts of red, green, and blue) of a bitmap.
 * @see https://docs.microsoft.com/windows/win32/api//gdipluseffects/nl-gdipluseffects-colorbalance
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class ColorBalance extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {Effect}
     */
    Base{
        get {
            if(!this.HasProp("__Base"))
                this.__Base := Effect(this.ptr + 0)
            return this.__Base
        }
    }
}
