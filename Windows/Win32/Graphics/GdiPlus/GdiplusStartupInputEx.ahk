#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\GdiplusStartupInput.ahk

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class GdiplusStartupInputEx extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {GdiplusStartupInput}
     */
    Base{
        get {
            if(!this.HasProp("__Base"))
                this.__Base := GdiplusStartupInput(this.ptr + 0)
            return this.__Base
        }
    }

    /**
     * @type {Integer}
     */
    StartupParameters {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }
}
