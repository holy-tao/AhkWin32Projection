#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\BSTR.ahk

/**
 * Represents a property defined on an element.
 * @see https://learn.microsoft.com/windows/win32/api/xamlom/ns-xamlom-propertychainvalue
 * @namespace Windows.Win32.UI.Xaml.Diagnostics
 * @version v4.0.30319
 */
class PropertyChainValue extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    /**
     * The index of property in the XAML runtime.
     * @type {Integer}
     */
    Index {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The type of the object.
     * @type {BSTR}
     */
    Type{
        get {
            if(!this.HasProp("__Type"))
                this.__Type := BSTR(8, this)
            return this.__Type
        }
    }

    /**
     * The base type of the object.
     * @type {BSTR}
     */
    DeclaringType{
        get {
            if(!this.HasProp("__DeclaringType"))
                this.__DeclaringType := BSTR(16, this)
            return this.__DeclaringType
        }
    }

    /**
     * The type of the current value of the property.
     * @type {BSTR}
     */
    ValueType{
        get {
            if(!this.HasProp("__ValueType"))
                this.__ValueType := BSTR(24, this)
            return this.__ValueType
        }
    }

    /**
     * Collection item type, or <b>null</b> if not a collection.
     * @type {BSTR}
     */
    ItemType{
        get {
            if(!this.HasProp("__ItemType"))
                this.__ItemType := BSTR(32, this)
            return this.__ItemType
        }
    }

    /**
     * The value of the property.  (Represents an <b>InstanceHandle</b> if <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/xamlom/ne-xamlom-metadatabit">MetadataBit</a> is set.)
     * @type {BSTR}
     */
    Value{
        get {
            if(!this.HasProp("__Value"))
                this.__Value := BSTR(40, this)
            return this.__Value
        }
    }

    /**
     * Indicates whether the property is overridden by some property in the value chain.
     * @type {BOOL}
     */
    Overridden {
        get => NumGet(this, 48, "int")
        set => NumPut("int", value, this, 48)
    }

    /**
     * A bit field that represents <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/xamlom/ne-xamlom-metadatabit">MetadataBit</a>s.
     * @type {Integer}
     */
    MetadataBits {
        get => NumGet(this, 56, "int64")
        set => NumPut("int64", value, this, 56)
    }

    /**
     * The name of the property.
     * @type {BSTR}
     */
    PropertyName{
        get {
            if(!this.HasProp("__PropertyName"))
                this.__PropertyName := BSTR(64, this)
            return this.__PropertyName
        }
    }

    /**
     * The index in the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/xamlom/ns-xamlom-propertychainsource">PropertyChainSource</a> returned by GetPropertyValuesChain
     * that represents the source of this property.
     * @type {Integer}
     */
    PropertyChainIndex {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }
}
