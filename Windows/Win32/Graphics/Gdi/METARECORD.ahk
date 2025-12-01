#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The METARECORD structure contains a Windows-format metafile record.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-metarecord
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class METARECORD extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The size, in words, of the record.
     * @type {Integer}
     */
    rdSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The function number.
     * @type {Integer}
     */
    rdFunction {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * An array of words containing the function parameters, in reverse of the order they are passed to the function.
     * @type {Array<UInt16>}
     */
    rdParm{
        get {
            if(!this.HasProp("__rdParmProxyArray"))
                this.__rdParmProxyArray := Win32FixedArray(this.ptr + 6, 1, Primitive, "ushort")
            return this.__rdParmProxyArray
        }
    }
}
