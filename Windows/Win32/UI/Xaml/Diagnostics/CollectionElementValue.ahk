#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }

/**
 * Represents an element in a collection.
 * @see https://learn.microsoft.com/windows/win32/api/xamlom/ns-xamlom-collectionelementvalue
 * @namespace Windows.Win32.UI.Xaml.Diagnostics
 */
export default struct CollectionElementValue {
    #StructPack 8

    /**
     * The collection index where the element was found.
     */
    Index : UInt32

    /**
     * The type of the element object.
     */
    ValueType : BSTR

    /**
     * The value of the element.
     */
    Value : BSTR

    /**
     * A bit field representing <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/xamlom/ne-xamlom-metadatabit">MetadataBit</a>s.
     */
    MetadataBits : Int64

}
