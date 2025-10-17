#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\PrintPropertyValue.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class PrintNamedProperty extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {PWSTR}
     */
    propertyName {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {PrintPropertyValue}
     */
    propertyValue{
        get {
            if(!this.HasProp("__propertyValue"))
                this.__propertyValue := PrintPropertyValue(8, this)
            return this.__propertyValue
        }
    }
}
