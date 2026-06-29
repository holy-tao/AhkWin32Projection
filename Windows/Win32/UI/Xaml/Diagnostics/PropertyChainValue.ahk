#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Represents a property defined on an element.
 * @see https://learn.microsoft.com/windows/win32/api/xamlom/ns-xamlom-propertychainvalue
 * @namespace Windows.Win32.UI.Xaml.Diagnostics
 */
export default struct PropertyChainValue {
    #StructPack 8

    /**
     * The index of property in the XAML runtime.
     */
    Index : UInt32

    /**
     * The type of the object.
     */
    Type : BSTR

    /**
     * The base type of the object.
     */
    DeclaringType : BSTR

    /**
     * The type of the current value of the property.
     */
    ValueType : BSTR

    /**
     * Collection item type, or <b>null</b> if not a collection.
     */
    ItemType : BSTR

    /**
     * The value of the property.  (Represents an <b>InstanceHandle</b> if <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/xamlom/ne-xamlom-metadatabit">MetadataBit</a> is set.)
     */
    Value : BSTR

    /**
     * Indicates whether the property is overridden by some property in the value chain.
     */
    Overridden : BOOL

    /**
     * A bit field that represents <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/xamlom/ne-xamlom-metadatabit">MetadataBit</a>s.
     */
    MetadataBits : Int64

    /**
     * The name of the property.
     */
    PropertyName : BSTR

    /**
     * The index in the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/xamlom/ns-xamlom-propertychainsource">PropertyChainSource</a> returned by GetPropertyValuesChain
     * that represents the source of this property.
     */
    PropertyChainIndex : UInt32

}
