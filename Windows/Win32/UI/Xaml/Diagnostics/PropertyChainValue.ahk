#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Represents a property defined on an element.
 * @see https://docs.microsoft.com/windows/win32/api//xamlom/ns-xamlom-propertychainvalue
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
     * @type {Pointer<Char>}
     */
    Type {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The base type of the object.
     * @type {Pointer<Char>}
     */
    DeclaringType {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * The type of the current value of the property.
     * @type {Pointer<Char>}
     */
    ValueType {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Collection item type, or <b>null</b> if not a collection.
     * @type {Pointer<Char>}
     */
    ItemType {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * The value of the property.  (Represents an <b>InstanceHandle</b> if <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/xamlom/ne-xamlom-metadatabit">MetadataBit</a> is set.)
     * @type {Pointer<Char>}
     */
    Value {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Indicates whether the property is overridden by some property in the value chain.
     * @type {Integer}
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
     * @type {Pointer<Char>}
     */
    PropertyName {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
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
