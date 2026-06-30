#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\Effect.ahk
#Include .\CGpEffect.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
class ColorBalance extends Win32Struct {
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {Effect}
     */
    Base {
        get {
            if(!this.HasProp("__Base"))
                this.__Base := Effect(0, this)
            return this.__Base
        }
    }
}
