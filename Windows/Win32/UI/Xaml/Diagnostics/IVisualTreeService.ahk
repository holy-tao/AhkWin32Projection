#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\PropertyChainSource.ahk" { PropertyChainSource }
#Import ".\EnumType.ahk" { EnumType }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\PropertyChainValue.ahk" { PropertyChainValue }
#Import ".\CollectionElementValue.ahk" { CollectionElementValue }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IVisualTreeServiceCallback.ahk" { IVisualTreeServiceCallback }

/**
 * Provides methods to manage a XAML visual tree.
 * @see https://learn.microsoft.com/windows/win32/api/xamlom/nn-xamlom-ivisualtreeservice
 * @namespace Windows.Win32.UI.Xaml.Diagnostics
 */
export default struct IVisualTreeService extends IUnknown {
    /**
     * The interface identifier for IVisualTreeService
     * @type {Guid}
     */
    static IID := Guid("{a593b11a-d17f-48bb-8f66-83910731c8a5}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IVisualTreeService interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        AdviseVisualTreeChange   : IntPtr
        UnadviseVisualTreeChange : IntPtr
        GetEnums                 : IntPtr
        CreateInstance           : IntPtr
        GetPropertyValuesChain   : IntPtr
        SetProperty              : IntPtr
        ClearProperty            : IntPtr
        GetCollectionCount       : IntPtr
        GetCollectionElements    : IntPtr
        AddChild                 : IntPtr
        RemoveChild              : IntPtr
        ClearChildren            : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IVisualTreeService.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Starts listening for changes to the visual tree.
     * @remarks
     * <b>AdviseVisualTreeChange</b> should be called when the caller wants to start
     *     listening for mutation events (changes to the visual tree). The callback will start receiving events once 
     *     the visual tree is constructed. If already constructed, the caller will immediately receive mutation events.
     * @param {IVisualTreeServiceCallback} pCallback The callback to register for mutation events.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/xamlom/nf-xamlom-ivisualtreeservice-advisevisualtreechange
     */
    AdviseVisualTreeChange(pCallback) {
        result := ComCall(3, this, "ptr", pCallback, "HRESULT")
        return result
    }

    /**
     * Stops listening for changes to the visual tree.
     * @remarks
     * <b>UnadviseVisualTreeChange</b> should be called when the caller no longer wants to listen for
     *     mutation events.
     * @param {IVisualTreeServiceCallback} pCallback The callback to unregister for mutation events.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/xamlom/nf-xamlom-ivisualtreeservice-unadvisevisualtreechange
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
     * @see https://learn.microsoft.com/windows/win32/api/xamlom/nf-xamlom-ivisualtreeservice-getenums
     */
    GetEnums(pCount, ppEnums) {
        pCountMarshal := pCount is VarRef ? "uint*" : "ptr"
        ppEnumsMarshal := ppEnums is VarRef ? "ptr*" : "ptr"

        result := ComCall(5, this, pCountMarshal, pCount, ppEnumsMarshal, ppEnums, "HRESULT")
        return result
    }

    /**
     * Creates an instance of any XAML runtime, enum, or primitive type.
     * @remarks
     * For primitives and enums, <i>value</i> should be 
     *     set to desired value. For XAML runtime types, <i>value</i> should be <b>null</b>.
     * @param {BSTR} typeName The type name. (Should be from <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/xamlom/ns-xamlom-propertychainvalue">PropertyChainValue.Type</a>.)
     * @param {BSTR} value The value to set on a primitive or enum type. <b>null</b> if creating a XAML runtime type.
     * @returns {Integer} An instance handle to newly created instance.
     * @see https://learn.microsoft.com/windows/win32/api/xamlom/nf-xamlom-ivisualtreeservice-createinstance
     */
    CreateInstance(typeName, value) {
        typeName := typeName is String ? BSTR.Alloc(typeName).Value : typeName
        value := value is String ? BSTR.Alloc(value).Value : value

        result := ComCall(6, this, BSTR, typeName, BSTR, value, "uint*", &pInstanceHandle := 0, "HRESULT")
        return pInstanceHandle
    }

    /**
     * Gets an array of all the properties set on the element passed in, and an array of all the styles involved in setting the effective values of the properties.
     * @remarks
     * <b>GetPropertyValuesChain</b> returns an array of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/xamlom/ns-xamlom-propertychainvalue">PropertyChainValue</a> structs that represents all the
     *     properties set on the element passed in. It also returns an array of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/xamlom/ns-xamlom-propertychainsource">PropertyChainSource</a> structs that represents all the styles involved in setting the effective value of each property.
     * @param {Integer} instanceHandle A handle to the element to query properties on.
     * @param {Pointer<Integer>} pSourceCount The count of the property sources array.
     * @param {Pointer<Pointer<PropertyChainSource>>} ppPropertySources An array of property sources.
     * @param {Pointer<Integer>} pPropertyCount The count of the property values array.
     * @param {Pointer<Pointer<PropertyChainValue>>} ppPropertyValues An array of property values.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code. This 
     *     method should not fail in normal conditions.
     * @see https://learn.microsoft.com/windows/win32/api/xamlom/nf-xamlom-ivisualtreeservice-getpropertyvalueschain
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
     * @remarks
     * The caller of <b>SetProperty</b> must know the index of the property to be set by first calling
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/xamlom/nf-xamlom-ivisualtreeservice-getpropertyvalueschain">GetPropertyValuesChain</a> and finding the property they want to set and retrieving its index.
     *     They must also have an <b>InstanceHandle</b> to a value, either by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/xamlom/nf-xamlom-ivisualtreeservice-createinstance">CreateInstance</a>, or caching
     *     an earlier instance of some shared property, such as <b>SolidColorBrush</b>.
     * @param {Integer} instanceHandle A handle to the element to set the property on.
     * @param {Integer} value A handle to the value to set on the element property.
     * @param {Integer} propertyIndex The index (in the XAML runtime cache) of the property to set.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/xamlom/nf-xamlom-ivisualtreeservice-setproperty
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
     * @see https://learn.microsoft.com/windows/win32/api/xamlom/nf-xamlom-ivisualtreeservice-clearproperty
     */
    ClearProperty(instanceHandle, propertyIndex) {
        result := ComCall(9, this, "uint", instanceHandle, "uint", propertyIndex, "HRESULT")
        return result
    }

    /**
     * Gets the count of a collection.
     * @remarks
     * For any collection method, the caller should query the properties of a known element
     *     and should only call this method if the property has <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/xamlom/ne-xamlom-metadatabit">MetadataBit::IsValueCollection</a>set.
     * @param {Integer} instanceHandle A handle to the collection object.
     * @returns {Integer} The number of elements in the collection.
     * @see https://learn.microsoft.com/windows/win32/api/xamlom/nf-xamlom-ivisualtreeservice-getcollectioncount
     */
    GetCollectionCount(instanceHandle) {
        result := ComCall(10, this, "uint", instanceHandle, "uint*", &pCollectionSize := 0, "HRESULT")
        return pCollectionSize
    }

    /**
     * Gets the elements in a collection.
     * @remarks
     * For any collection method, the caller should query the properties of a known element
     *     and should only call this method if the property has <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/xamlom/ne-xamlom-metadatabit">MetadataBit::IsValueCollection</a>set.
     * @param {Integer} instanceHandle A handle to the collection object.
     * @param {Integer} startIndex The index in the  collection to start getting elements from.
     * @param {Pointer<Integer>} pElementCount The count of elements in the returned array.
     * @returns {Pointer<CollectionElementValue>} An array of elements returned from the collection.
     * @see https://learn.microsoft.com/windows/win32/api/xamlom/nf-xamlom-ivisualtreeservice-getcollectionelements
     */
    GetCollectionElements(instanceHandle, startIndex, pElementCount) {
        pElementCountMarshal := pElementCount is VarRef ? "uint*" : "ptr"

        result := ComCall(11, this, "uint", instanceHandle, "uint", startIndex, pElementCountMarshal, pElementCount, "ptr*", &ppElementValues := 0, "HRESULT")
        return ppElementValues
    }

    /**
     * Adds a child element to the collection at the specified index.
     * @remarks
     * For any collection method, the caller should query the properties of a known element
     *     and should only call this method if the property has <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/xamlom/ne-xamlom-metadatabit">MetadataBit::IsValueCollection</a>set.
     * @param {Integer} parent A handle to the collection object.
     * @param {Integer} child A handle to the element to place into the collection. This can be newly created through <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/xamlom/nf-xamlom-ivisualtreeservice-createinstance">CreateInstance</a> or shared, such as <b>SolidColorBrush</b>.
     * @param {Integer} index Location in <i>parent</i> collection at which to insert <i>child</i> element.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/xamlom/nf-xamlom-ivisualtreeservice-addchild
     */
    AddChild(parent, child, index) {
        result := ComCall(12, this, "uint", parent, "uint", child, "uint", index, "HRESULT")
        return result
    }

    /**
     * Removes the child element from the specified index.
     * @remarks
     * For any collection method, the caller should query the properties of a known element
     *     and should only call this method if the property has <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/xamlom/ne-xamlom-metadatabit">MetadataBit::IsValueCollection</a>set.
     * @param {Integer} parent A handle to the collection object.
     * @param {Integer} index Location in <i>parent</i> collection at which to remove the child element.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code. The method will fail if index is outside
     *     of the collection range.
     * @see https://learn.microsoft.com/windows/win32/api/xamlom/nf-xamlom-ivisualtreeservice-removechild
     */
    RemoveChild(parent, index) {
        result := ComCall(13, this, "uint", parent, "uint", index, "HRESULT")
        return result
    }

    /**
     * Clears all child elements from the parent collection.
     * @remarks
     * For any collection method, the caller should query the properties of a known element
     *     and should only call this method if the property has <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/xamlom/ne-xamlom-metadatabit">MetadataBit::IsValueCollection</a>set.
     * @param {Integer} parent A handle to the collection object.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/xamlom/nf-xamlom-ivisualtreeservice-clearchildren
     */
    ClearChildren(parent) {
        result := ComCall(14, this, "uint", parent, "HRESULT")
        return result
    }

    Query(iid) {
        if (IVisualTreeService.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AdviseVisualTreeChange := CallbackCreate(GetMethod(implObj, "AdviseVisualTreeChange"), flags, 2)
        this.vtbl.UnadviseVisualTreeChange := CallbackCreate(GetMethod(implObj, "UnadviseVisualTreeChange"), flags, 2)
        this.vtbl.GetEnums := CallbackCreate(GetMethod(implObj, "GetEnums"), flags, 3)
        this.vtbl.CreateInstance := CallbackCreate(GetMethod(implObj, "CreateInstance"), flags, 4)
        this.vtbl.GetPropertyValuesChain := CallbackCreate(GetMethod(implObj, "GetPropertyValuesChain"), flags, 6)
        this.vtbl.SetProperty := CallbackCreate(GetMethod(implObj, "SetProperty"), flags, 4)
        this.vtbl.ClearProperty := CallbackCreate(GetMethod(implObj, "ClearProperty"), flags, 3)
        this.vtbl.GetCollectionCount := CallbackCreate(GetMethod(implObj, "GetCollectionCount"), flags, 3)
        this.vtbl.GetCollectionElements := CallbackCreate(GetMethod(implObj, "GetCollectionElements"), flags, 5)
        this.vtbl.AddChild := CallbackCreate(GetMethod(implObj, "AddChild"), flags, 4)
        this.vtbl.RemoveChild := CallbackCreate(GetMethod(implObj, "RemoveChild"), flags, 3)
        this.vtbl.ClearChildren := CallbackCreate(GetMethod(implObj, "ClearChildren"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AdviseVisualTreeChange)
        CallbackFree(this.vtbl.UnadviseVisualTreeChange)
        CallbackFree(this.vtbl.GetEnums)
        CallbackFree(this.vtbl.CreateInstance)
        CallbackFree(this.vtbl.GetPropertyValuesChain)
        CallbackFree(this.vtbl.SetProperty)
        CallbackFree(this.vtbl.ClearProperty)
        CallbackFree(this.vtbl.GetCollectionCount)
        CallbackFree(this.vtbl.GetCollectionElements)
        CallbackFree(this.vtbl.AddChild)
        CallbackFree(this.vtbl.RemoveChild)
        CallbackFree(this.vtbl.ClearChildren)
    }
}
