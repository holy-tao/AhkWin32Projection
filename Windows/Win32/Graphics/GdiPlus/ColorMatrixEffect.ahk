#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\Effect.ahk

/**
 * The ColorMatrixEffect class enables you to apply an affine transformation to a bitmap.
 * @see https://docs.microsoft.com/windows/win32/api//gdipluseffects/nl-gdipluseffects-colormatrixeffect
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class ColorMatrixEffect extends Win32Struct
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
