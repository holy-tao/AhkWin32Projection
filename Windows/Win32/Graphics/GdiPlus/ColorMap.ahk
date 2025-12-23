#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\Color.ahk

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class ColorMap extends Win32Struct
{
    static sizeof => 1200

    static packingSize => 4

    /**
     * @type {Color}
     */
    oldColor{
        get {
            if(!this.HasProp("__oldColor"))
                this.__oldColor := Color(0, this)
            return this.__oldColor
        }
    }

    /**
     * @type {Color}
     */
    newColor{
        get {
            if(!this.HasProp("__newColor"))
                this.__newColor := Color(600, this)
            return this.__newColor
        }
    }
}
