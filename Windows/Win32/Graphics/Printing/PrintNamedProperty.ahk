#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
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
    propertyName{
        get {
            if(!this.HasProp("__propertyName"))
                this.__propertyName := PWSTR(this.ptr + 0)
            return this.__propertyName
        }
    }

    /**
     * @type {PrintPropertyValue}
     */
    propertyValue{
        get {
            if(!this.HasProp("__propertyValue"))
                this.__propertyValue := PrintPropertyValue(this.ptr + 8)
            return this.__propertyValue
        }
    }
}
