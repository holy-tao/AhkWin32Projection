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
     * 
     * @param {IVisualTreeServiceCallback} pCallback 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xamlom/nf-xamlom-ivisualtreeservice-advisevisualtreechange
     */
    AdviseVisualTreeChange(pCallback) {
        result := ComCall(3, this, "ptr", pCallback, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IVisualTreeServiceCallback} pCallback 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xamlom/nf-xamlom-ivisualtreeservice-unadvisevisualtreechange
     */
    UnadviseVisualTreeChange(pCallback) {
        result := ComCall(4, this, "ptr", pCallback, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pCount 
     * @param {Pointer<Pointer<EnumType>>} ppEnums 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xamlom/nf-xamlom-ivisualtreeservice-getenums
     */
    GetEnums(pCount, ppEnums) {
        pCountMarshal := pCount is VarRef ? "uint*" : "ptr"
        ppEnumsMarshal := ppEnums is VarRef ? "ptr*" : "ptr"

        result := ComCall(5, this, pCountMarshal, pCount, ppEnumsMarshal, ppEnums, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} typeName 
     * @param {BSTR} value 
     * @param {Pointer<Integer>} pInstanceHandle 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xamlom/nf-xamlom-ivisualtreeservice-createinstance
     */
    CreateInstance(typeName, value, pInstanceHandle) {
        typeName := typeName is String ? BSTR.Alloc(typeName).Value : typeName
        value := value is String ? BSTR.Alloc(value).Value : value

        pInstanceHandleMarshal := pInstanceHandle is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, "ptr", typeName, "ptr", value, pInstanceHandleMarshal, pInstanceHandle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} instanceHandle 
     * @param {Pointer<Integer>} pSourceCount 
     * @param {Pointer<Pointer<PropertyChainSource>>} ppPropertySources 
     * @param {Pointer<Integer>} pPropertyCount 
     * @param {Pointer<Pointer<PropertyChainValue>>} ppPropertyValues 
     * @returns {HRESULT} 
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
     * 
     * @param {Integer} instanceHandle 
     * @param {Integer} value 
     * @param {Integer} propertyIndex 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xamlom/nf-xamlom-ivisualtreeservice-setproperty
     */
    SetProperty(instanceHandle, value, propertyIndex) {
        result := ComCall(8, this, "uint", instanceHandle, "uint", value, "uint", propertyIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} instanceHandle 
     * @param {Integer} propertyIndex 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xamlom/nf-xamlom-ivisualtreeservice-clearproperty
     */
    ClearProperty(instanceHandle, propertyIndex) {
        result := ComCall(9, this, "uint", instanceHandle, "uint", propertyIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} instanceHandle 
     * @param {Pointer<Integer>} pCollectionSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xamlom/nf-xamlom-ivisualtreeservice-getcollectioncount
     */
    GetCollectionCount(instanceHandle, pCollectionSize) {
        pCollectionSizeMarshal := pCollectionSize is VarRef ? "uint*" : "ptr"

        result := ComCall(10, this, "uint", instanceHandle, pCollectionSizeMarshal, pCollectionSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} instanceHandle 
     * @param {Integer} startIndex 
     * @param {Pointer<Integer>} pElementCount 
     * @param {Pointer<Pointer<CollectionElementValue>>} ppElementValues 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xamlom/nf-xamlom-ivisualtreeservice-getcollectionelements
     */
    GetCollectionElements(instanceHandle, startIndex, pElementCount, ppElementValues) {
        pElementCountMarshal := pElementCount is VarRef ? "uint*" : "ptr"
        ppElementValuesMarshal := ppElementValues is VarRef ? "ptr*" : "ptr"

        result := ComCall(11, this, "uint", instanceHandle, "uint", startIndex, pElementCountMarshal, pElementCount, ppElementValuesMarshal, ppElementValues, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} parent 
     * @param {Integer} child 
     * @param {Integer} index 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xamlom/nf-xamlom-ivisualtreeservice-addchild
     */
    AddChild(parent, child, index) {
        result := ComCall(12, this, "uint", parent, "uint", child, "uint", index, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} parent 
     * @param {Integer} index 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xamlom/nf-xamlom-ivisualtreeservice-removechild
     */
    RemoveChild(parent, index) {
        result := ComCall(13, this, "uint", parent, "uint", index, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} parent 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xamlom/nf-xamlom-ivisualtreeservice-clearchildren
     */
    ClearChildren(parent) {
        result := ComCall(14, this, "uint", parent, "HRESULT")
        return result
    }
}
