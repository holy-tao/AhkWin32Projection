#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\BSTR.ahk

/**
 * Represents an element in a collection.
 * @see https://docs.microsoft.com/windows/win32/api//xamlom/ns-xamlom-collectionelementvalue
 * @namespace Windows.Win32.UI.Xaml.Diagnostics
 * @version v4.0.30319
 */
class CollectionElementValue extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The collection index where the element was found.
     * @type {Integer}
     */
    Index {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The type of the element object.
     * @type {BSTR}
     */
    ValueType{
        get {
            if(!this.HasProp("__ValueType"))
                this.__ValueType := BSTR(this.ptr + 8)
            return this.__ValueType
        }
    }

    /**
     * The value of the element.
     * @type {BSTR}
     */
    Value{
        get {
            if(!this.HasProp("__Value"))
                this.__Value := BSTR(this.ptr + 16)
            return this.__Value
        }
    }

    /**
     * A bit field representing <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/xamlom/ne-xamlom-metadatabit">MetadataBit</a>s.
     * @type {Integer}
     */
    MetadataBits {
        get => NumGet(this, 24, "int64")
        set => NumPut("int64", value, this, 24)
    }
}
