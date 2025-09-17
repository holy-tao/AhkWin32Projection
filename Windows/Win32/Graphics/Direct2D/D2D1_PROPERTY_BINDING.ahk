#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines a property binding to a pair of functions which get and set the corresponding property.
 * @remarks
 * The <b>propertyName</b> is used to cross-correlate the property binding with the registration XML. The <b>propertyName</b> must be present in the XML call or the registration will fail.
  * 
  * 
  * 
  * All properties must be bound.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/ns-d2d1effectauthor-d2d1_property_binding
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_PROPERTY_BINDING extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The name of the property.
     * @type {Pointer<Char>}
     */
    propertyName {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The function that will receive the data to set.
     * @type {Pointer<PD2D1_PROPERTY_SET_FUNCTION>}
     */
    setFunction {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The function that will be asked to write the output data.
     * @type {Pointer<PD2D1_PROPERTY_GET_FUNCTION>}
     */
    getFunction {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
