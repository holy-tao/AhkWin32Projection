#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * A range of memory of arbitrary type that represents a serialized PROPVARIANT structure.
 * @see https://docs.microsoft.com/windows/win32/api//propidl/ns-propidl-serializedpropertyvalue
 * @namespace Windows.Win32.System.Com.StructuredStorage
 * @version v4.0.30319
 */
class SERIALIZEDPROPERTYVALUE extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Type: <b>DWORD</b>
     * 
     * Encodes type information about the serialized <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure. Programs should not inspect this member directly; instead, they should use the <a href="https://docs.microsoft.com/windows/desktop/api/propvarutil/nf-propvarutil-stgdeserializepropvariant">StgDeserializePropVariant</a> function and inspect the <b>vt</b>  member of the resulting <b>PROPVARIANT</b> structure.
     * @type {Integer}
     */
    dwType {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>BYTE[1]</b>
     * 
     * A variable-length additional data that depends on the type passed in <b>dwType</b>.
     * @type {Array<Byte>}
     */
    rgb{
        get {
            if(!this.HasProp("__rgbProxyArray"))
                this.__rgbProxyArray := Win32FixedArray(this.ptr + 4, 1, Primitive, "char")
            return this.__rgbProxyArray
        }
    }
}
