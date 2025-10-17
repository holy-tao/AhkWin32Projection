#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * The PROPSPEC structure is used by many of the methods of IPropertyStorage to specify a property either by its property identifier (ID) or the associated string name.
 * @remarks
 * 
  * String names are optional and can be assigned to a set of properties when the property is created with a call to <a href="https://docs.microsoft.com/windows/desktop/api/propidl/nf-propidl-ipropertystorage-writemultiple">IPropertyStorage::WriteMultiple</a> or later with a call to <a href="https://docs.microsoft.com/windows/desktop/api/propidl/nf-propidl-ipropertystorage-writepropertynames">IPropertyStorage::WritePropertyNames</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//propidlbase/ns-propidlbase-propspec
 * @namespace Windows.Win32.System.Com.StructuredStorage
 * @version v4.0.30319
 */
class PROPSPEC extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * 
     * @type {Integer}
     */
    ulKind {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    propid {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {PWSTR}
     */
    lpwstr {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
