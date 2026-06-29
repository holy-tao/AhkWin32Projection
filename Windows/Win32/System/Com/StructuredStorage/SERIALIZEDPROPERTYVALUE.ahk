#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * A range of memory of arbitrary type that represents a serialized PROPVARIANT structure.
 * @see https://learn.microsoft.com/windows/win32/api/propidl/ns-propidl-serializedpropertyvalue
 * @namespace Windows.Win32.System.Com.StructuredStorage
 */
export default struct SERIALIZEDPROPERTYVALUE {
    #StructPack 4

    /**
     * Type: <b>DWORD</b>
     * 
     * Encodes type information about the serialized <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure. Programs should not inspect this member directly; instead, they should use the <a href="https://docs.microsoft.com/windows/desktop/api/propvarutil/nf-propvarutil-stgdeserializepropvariant">StgDeserializePropVariant</a> function and inspect the <b>vt</b>  member of the resulting <b>PROPVARIANT</b> structure.
     */
    dwType : UInt32

    /**
     * Type: <b>BYTE[1]</b>
     * 
     * A variable-length additional data that depends on the type passed in <b>dwType</b>.
     */
    rgb : Int8[1]

}
