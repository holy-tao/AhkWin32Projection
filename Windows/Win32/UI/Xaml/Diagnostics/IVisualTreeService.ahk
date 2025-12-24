#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Provides methods to manage a XAML visual tree.
 * @see https://docs.microsoft.com/windows/win32/api//xamlom/nn-xamlom-ivisualtreeservice
 * @namespace Windows.Win32.UI.Xaml.Diagnostics
 * @version v4.0.30319
 */
class IVisualTreeService extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVisualTreeService
     * @type {Guid}
     */
    static IID => Guid("{a593b11a-d17f-48bb-8f66-83910731c8a5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AdviseVisualTreeChange", "UnadviseVisualTreeChange", "GetEnums", "CreateInstance", "GetPropertyValuesChain", "SetProperty", "ClearProperty", "GetCollectionCount", "GetCollectionElements", "AddChild", "RemoveChild", "ClearChildren"]

    /**
     * Starts listening for changes to the visual tree.
     * @param {IVisualTreeServiceCallback} pCallback The callback to register for mutation events.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//xamlom/nf-xamlom-ivisualtreeservice-advisevisualtreechange
     */
    AdviseVisualTreeChange(pCallback) {
        result := ComCall(3, this, "ptr", pCallback, "HRESULT")
        return result
    }

    /**
     * Stops listening for changes to the visual tree.
     * @param {IVisualTreeServiceCallback} pCallback The callback to unregister for mutation events.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//xamlom/nf-xamlom-ivisualtreeservice-unadvisevisualtreechange
     */
    UnadviseVisualTreeChange(pCallback) {
        result := ComCall(4, this, "ptr", pCallback, "HRESULT")
        return result
    }

    /**
     * Gets an array of all the enums defined in the XAML runtime and the total count.
     * @param {Pointer<Integer>} pCount The count of enums in the array.
     * @param {Pointer<Pointer<EnumType>>} ppEnums An array of enums defined in the XAML runtime.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code. This method should not fail in normal conditions.
     * @see https://docs.microsoft.com/windows/win32/api//xamlom/nf-xamlom-ivisualtreeservice-getenums
     */
    GetEnums(pCount, ppEnums) {
        pCountMarshal := pCount is VarRef ? "uint*" : "ptr"
        ppEnumsMarshal := ppEnums is VarRef ? "ptr*" : "ptr"

        result := ComCall(5, this, pCountMarshal, pCount, ppEnumsMarshal, ppEnums, "HRESULT")
        return result
    }

    /**
     * Creates an instance of any XAML runtime, enum, or primitive type.
     * @param {BSTR} typeName The type name. (Should be from <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/xamlom/ns-xamlom-propertychainvalue">PropertyChainValue.Type</a>.)
     * @param {BSTR} value The value to set on a primitive or enum type. <b>null</b> if creating a XAML runtime type.
     * @returns {Integer} An instance handle to newly created instance.
     * @see https://docs.microsoft.com/windows/win32/api//xamlom/nf-xamlom-ivisualtreeservice-createinstance
     */
    CreateInstance(typeName, value) {
        typeName := typeName is String ? BSTR.Alloc(typeName).Value : typeName
        value := value is String ? BSTR.Alloc(value).Value : value

        result := ComCall(6, this, "ptr", typeName, "ptr", value, "uint*", &pInstanceHandle := 0, "HRESULT")
        return pInstanceHandle
    }

    /**
     * Gets an array of all the properties set on the element passed in, and an array of all the styles involved in setting the effective values of the properties.
     * @param {Integer} instanceHandle A handle to the element to query properties on.
     * @param {Pointer<Integer>} pSourceCount The count of the property sources array.
     * @param {Pointer<Pointer<PropertyChainSource>>} ppPropertySources An array of property sources.
     * @param {Pointer<Integer>} pPropertyCount The count of the property values array.
     * @param {Pointer<Pointer<PropertyChainValue>>} ppPropertyValues An array of property values.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code. This 
     *     method should not fail in normal conditions.
     * @see https://docs.microsoft.com/windows/win32/api//xamlom/nf-xamlom-ivisualtreeservice-getpropertyvalueschain
     */
    GetPropertyValuesChain(instanceHandle, pSourceCount, ppPropertySources, pPropertyCount, ppPropertyValues) {
        pSourceCountMarshal := pSourceCount is VarRef ? "uint*" : "ptr"
        ppPropertySourcesMarshal := ppPropertySources is VarRef ? "ptr*" : "ptr"
        pPropertyCountMarshal := pPropertyCount is VarRef ? "uint*" : "ptr"
        ppPropertyValuesMarshal := ppPropertyValues is VarRef ? "ptr*" : "ptr"

        result := ComCall(7, this, "uint", instanceHandle, pSourceCountMarshal, pSourceCount, ppPropertySourcesMarshal, ppPropertySources, pPropertyCountMarshal, pPropertyCount, ppPropertyValuesMarshal, ppPropertyValues, "HRESULT")
        return result
    }

    /**
     * Sets a property value on a XAML element.
     * @param {Integer} instanceHandle A handle to the element to set the property on.
     * @param {Integer} value A handle to the value to set on the element property.
     * @param {Integer} propertyIndex The index (in the XAML runtime cache) of the property to set.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//xamlom/nf-xamlom-ivisualtreeservice-setproperty
     */
    SetProperty(instanceHandle, value, propertyIndex) {
        result := ComCall(8, this, "uint", instanceHandle, "uint", value, "uint", propertyIndex, "HRESULT")
        return result
    }

    /**
     * Clears the specified property on a XAML element.
     * @param {Integer} instanceHandle A handle to the element to set the property on.
     * @param {Integer} propertyIndex The index (in the XAML runtime cache) of the property to clear.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//xamlom/nf-xamlom-ivisualtreeservice-clearproperty
     */
    ClearProperty(instanceHandle, propertyIndex) {
        result := ComCall(9, this, "uint", instanceHandle, "uint", propertyIndex, "HRESULT")
        return result
    }

    /**
     * Gets the count of a collection.
     * @param {Integer} instanceHandle A handle to the collection object.
     * @returns {Integer} The number of elements in the collection.
     * @see https://docs.microsoft.com/windows/win32/api//xamlom/nf-xamlom-ivisualtreeservice-getcollectioncount
     */
    GetCollectionCount(instanceHandle) {
        result := ComCall(10, this, "uint", instanceHandle, "uint*", &pCollectionSize := 0, "HRESULT")
        return pCollectionSize
    }

    /**
     * Gets the elements in a collection.
     * @param {Integer} instanceHandle A handle to the collection object.
     * @param {Integer} startIndex The index in the  collection to start getting elements from.
     * @param {Pointer<Integer>} pElementCount The count of elements in the returned array.
     * @returns {Pointer<CollectionElementValue>} An array of elements returned from the collection.
     * @see https://docs.microsoft.com/windows/win32/api//xamlom/nf-xamlom-ivisualtreeservice-getcollectionelements
     */
    GetCollectionElements(instanceHandle, startIndex, pElementCount) {
        pElementCountMarshal := pElementCount is VarRef ? "uint*" : "ptr"

        result := ComCall(11, this, "uint", instanceHandle, "uint", startIndex, pElementCountMarshal, pElementCount, "ptr*", &ppElementValues := 0, "HRESULT")
        return ppElementValues
    }

    /**
     * Adds a child element to the collection at the specified index.
     * @param {Integer} parent A handle to the collection object.
     * @param {Integer} child A handle to the element to place into the collection. This can be newly created through <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/xamlom/nf-xamlom-ivisualtreeservice-createinstance">CreateInstance</a> or shared, such as <b>SolidColorBrush</b>.
     * @param {Integer} index Location in <i>parent</i> collection at which to insert <i>child</i> element.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//xamlom/nf-xamlom-ivisualtreeservice-addchild
     */
    AddChild(parent, child, index) {
        result := ComCall(12, this, "uint", parent, "uint", child, "uint", index, "HRESULT")
        return result
    }

    /**
     * Removes the child element from the specified index.
     * @param {Integer} parent A handle to the collection object.
     * @param {Integer} index Location in <i>parent</i> collection at which to remove the child element.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code. The method will fail if index is outside
     *     of the collection range.
     * @see https://docs.microsoft.com/windows/win32/api//xamlom/nf-xamlom-ivisualtreeservice-removechild
     */
    RemoveChild(parent, index) {
        result := ComCall(13, this, "uint", parent, "uint", index, "HRESULT")
        return result
    }

    /**
     * Clears all child elements from the parent collection.
     * @param {Integer} parent A handle to the collection object.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//xamlom/nf-xamlom-ivisualtreeservice-clearchildren
     */
    ClearChildren(parent) {
        result := ComCall(14, this, "uint", parent, "HRESULT")
        return result
    }
}
