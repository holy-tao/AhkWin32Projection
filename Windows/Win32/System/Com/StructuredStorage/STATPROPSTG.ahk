#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * The STATPROPSTG structure contains data about a single property in a property set. This data is the property ID and type tag, and the optional string name that may be associated with the property.
 * @see https://learn.microsoft.com/windows/win32/api/propidlbase/ns-propidlbase-statpropstg
 * @namespace Windows.Win32.System.Com.StructuredStorage
 * @version v4.0.30319
 */
class STATPROPSTG extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * A wide-character null-terminated Unicode string that contains the optional string name associated with the property. May be <b>NULL</b>. This member must be freed using 
     * <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.
     * @type {Pointer<PWSTR>}
     */
    lpwstrName {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * A 32-bit identifier that uniquely identifies the property within the property set. All properties within property sets must have unique property identifiers.
     * @type {Integer}
     */
    propid {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The property type.
     * @type {Integer}
     */
    vt {
        get => NumGet(this, 12, "ushort")
        set => NumPut("ushort", value, this, 12)
    }
}
