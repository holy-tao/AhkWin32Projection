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
     * 
     * @param {Pointer<IVisualTreeServiceCallback>} pCallback 
     * @returns {HRESULT} 
     */
    AdviseVisualTreeChange(pCallback) {
        result := ComCall(3, this, "ptr", pCallback, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IVisualTreeServiceCallback>} pCallback 
     * @returns {HRESULT} 
     */
    UnadviseVisualTreeChange(pCallback) {
        result := ComCall(4, this, "ptr", pCallback, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pCount 
     * @param {Pointer<EnumType>} ppEnums 
     * @returns {HRESULT} 
     */
    GetEnums(pCount, ppEnums) {
        result := ComCall(5, this, "uint*", pCount, "ptr", ppEnums, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} typeName 
     * @param {BSTR} value 
     * @param {Pointer<UInt64>} pInstanceHandle 
     * @returns {HRESULT} 
     */
    CreateInstance(typeName, value, pInstanceHandle) {
        typeName := typeName is String ? BSTR.Alloc(typeName).Value : typeName
        value := value is String ? BSTR.Alloc(value).Value : value

        result := ComCall(6, this, "ptr", typeName, "ptr", value, "uint*", pInstanceHandle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} instanceHandle 
     * @param {Pointer<UInt32>} pSourceCount 
     * @param {Pointer<PropertyChainSource>} ppPropertySources 
     * @param {Pointer<UInt32>} pPropertyCount 
     * @param {Pointer<PropertyChainValue>} ppPropertyValues 
     * @returns {HRESULT} 
     */
    GetPropertyValuesChain(instanceHandle, pSourceCount, ppPropertySources, pPropertyCount, ppPropertyValues) {
        result := ComCall(7, this, "uint", instanceHandle, "uint*", pSourceCount, "ptr", ppPropertySources, "uint*", pPropertyCount, "ptr", ppPropertyValues, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} instanceHandle 
     * @param {Integer} value 
     * @param {Integer} propertyIndex 
     * @returns {HRESULT} 
     */
    SetProperty(instanceHandle, value, propertyIndex) {
        result := ComCall(8, this, "uint", instanceHandle, "uint", value, "uint", propertyIndex, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} instanceHandle 
     * @param {Integer} propertyIndex 
     * @returns {HRESULT} 
     */
    ClearProperty(instanceHandle, propertyIndex) {
        result := ComCall(9, this, "uint", instanceHandle, "uint", propertyIndex, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} instanceHandle 
     * @param {Pointer<UInt32>} pCollectionSize 
     * @returns {HRESULT} 
     */
    GetCollectionCount(instanceHandle, pCollectionSize) {
        result := ComCall(10, this, "uint", instanceHandle, "uint*", pCollectionSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} instanceHandle 
     * @param {Integer} startIndex 
     * @param {Pointer<UInt32>} pElementCount 
     * @param {Pointer<CollectionElementValue>} ppElementValues 
     * @returns {HRESULT} 
     */
    GetCollectionElements(instanceHandle, startIndex, pElementCount, ppElementValues) {
        result := ComCall(11, this, "uint", instanceHandle, "uint", startIndex, "uint*", pElementCount, "ptr", ppElementValues, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} parent 
     * @param {Integer} child 
     * @param {Integer} index 
     * @returns {HRESULT} 
     */
    AddChild(parent, child, index) {
        result := ComCall(12, this, "uint", parent, "uint", child, "uint", index, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} parent 
     * @param {Integer} index 
     * @returns {HRESULT} 
     */
    RemoveChild(parent, index) {
        result := ComCall(13, this, "uint", parent, "uint", index, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} parent 
     * @returns {HRESULT} 
     */
    ClearChildren(parent) {
        result := ComCall(14, this, "uint", parent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
