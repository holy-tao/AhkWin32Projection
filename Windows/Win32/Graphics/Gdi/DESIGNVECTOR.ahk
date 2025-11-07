#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DESIGNVECTOR structure is used by an application to specify values for the axes of a multiple master font.
 * @remarks
 * 
 * The <b>dvNumAxes</b> member determines the actual size of <b>dvValues</b>, and thus, of <b>DESIGNVECTOR</b>. The constant MM_MAX_NUMAXES, which is 16, specifies the maximum allowed size of the <b>dvValues</b> array.
 * 
 * The PostScript Open Type Font does not support multiple master functionality.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wingdi/ns-wingdi-designvector
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class DESIGNVECTOR extends Win32Struct
{
    static sizeof => 72

    static packingSize => 4

    /**
     * Reserved. Must be STAMP_DESIGNVECTOR.
     * @type {Integer}
     */
    dvReserved {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Number of values in the <b>dvValues</b> array.
     * @type {Integer}
     */
    dvNumAxes {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * An array specifying the values of the axes of a multiple master OpenType font. This array corresponds to the <b>axlAxisInfo</b> array in the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-axeslista">AXESLIST</a> structure.
     * @type {Array<Int32>}
     */
    dvValues{
        get {
            if(!this.HasProp("__dvValuesProxyArray"))
                this.__dvValuesProxyArray := Win32FixedArray(this.ptr + 8, 16, Primitive, "int")
            return this.__dvValuesProxyArray
        }
    }
}
