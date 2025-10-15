#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk
#Include .\Effect.ahk

/**
 * The Tint class enables you to apply a tint to a bitmap.
 * @see https://docs.microsoft.com/windows/win32/api//gdipluseffects/nl-gdipluseffects-tint
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class Tint extends Win32Struct
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
