#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Returns a currency value.
 * @remarks
 * To specify a different currency, you must include a valid  *cyID*. For a list, see [About currency constants](about-currency-constants.md).
 *   
 * If  *value* is incompatible with the designated currency type, or if an invalid argument such as "not a number" is specified, a #VALUE! error is returned. If  _value_ is greater than 922,337,203,685,477.5807 or less than -922,337,203,685,477.5808, a #VALUE! error is returned.
 *   
 * For better precision with very large currency values that include fractions of a unit, such as 3.6 trillion, use string arguments for  *value*.
 *   
 * Specifying an invalid  *cyID* returns an error.
 * @see https://learn.microsoft.com/office/client-developer/ocs/docs/visio/cy-function
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class CY extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Lo {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Hi {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    int64 {
        get => NumGet(this, 0, "int64")
        set => NumPut("int64", value, this, 0)
    }
}
