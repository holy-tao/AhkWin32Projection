#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The ENHMETARECORD structure contains data that describes a graphics device interface (GDI) function used to create part of a picture in an enhanced-format metafile.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-enhmetarecord
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class ENHMETARECORD extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * The record type.
     * @type {Integer}
     */
    iType {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The size of the record, in bytes.
     * @type {Integer}
     */
    nSize {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * An array of parameters passed to the GDI function identified by the record.
     * @type {Array<UInt32>}
     */
    dParm{
        get {
            if(!this.HasProp("__dParmProxyArray"))
                this.__dParmProxyArray := Win32FixedArray(this.ptr + 8, 1, Primitive, "uint")
            return this.__dParmProxyArray
        }
    }
}
