#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IVisualTreeService2.ahk

/**
 * Represents additional capabilities of an IVisualTreeService2 object.
 * @see https://docs.microsoft.com/windows/win32/api//xamlom/nn-xamlom-ivisualtreeservice3
 * @namespace Windows.Win32.UI.Xaml.Diagnostics
 * @version v4.0.30319
 */
class IVisualTreeService3 extends IVisualTreeService2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVisualTreeService3
     * @type {Guid}
     */
    static IID => Guid("{0e79c6e0-85a0-4be8-b41a-655cf1fd19bd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 19

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ResolveResource", "GetDictionaryItem", "AddDictionaryItem", "RemoveDictionaryItem"]

    /**
     * Resolves a resource for an element in the tree and applies the resource to the property provided by the specified property index.
     * @param {Integer} resourceContext The context of the resource.
     * @param {PWSTR} resourceName The name of the resource.
     * @param {Integer} resourceType The type of the resource.
     * @param {Integer} propertyIndex The index of the property to apply the resource to.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//xamlom/nf-xamlom-ivisualtreeservice3-resolveresource
     */
    ResolveResource(resourceContext, resourceName, resourceType, propertyIndex) {
        resourceName := resourceName is String ? StrPtr(resourceName) : resourceName

        result := ComCall(19, this, "uint", resourceContext, "ptr", resourceName, "int", resourceType, "uint", propertyIndex, "HRESULT")
        return result
    }

    /**
     * Gets an item from a ResourceDictionary.
     * @param {Integer} dictionaryHandle The dictionary to get the resource from.
     * @param {PWSTR} resourceName The name of the resource to get.
     * @param {BOOL} resourceIsImplicitStyle <b>true</b> if the resource is an implicit style; otherwise, <b>false</b>.
     * @returns {Integer} The resource that was retrieved.
     * @see https://docs.microsoft.com/windows/win32/api//xamlom/nf-xamlom-ivisualtreeservice3-getdictionaryitem
     */
    GetDictionaryItem(dictionaryHandle, resourceName, resourceIsImplicitStyle) {
        resourceName := resourceName is String ? StrPtr(resourceName) : resourceName

        result := ComCall(20, this, "uint", dictionaryHandle, "ptr", resourceName, "int", resourceIsImplicitStyle, "uint*", &resourceHandle := 0, "HRESULT")
        return resourceHandle
    }

    /**
     * Adds an item to a ResourceDictionary, and re-resolves all elements in the tree that reference a resource with the specified key.
     * @param {Integer} dictionaryHandle The dictionary to add the resource to.
     * @param {Integer} resourceKey The key of the resource to add.
     * @param {Integer} resourceHandle The resource to add.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//xamlom/nf-xamlom-ivisualtreeservice3-adddictionaryitem
     */
    AddDictionaryItem(dictionaryHandle, resourceKey, resourceHandle) {
        result := ComCall(21, this, "uint", dictionaryHandle, "uint", resourceKey, "uint", resourceHandle, "HRESULT")
        return result
    }

    /**
     * Removes an item from a ResourceDictionary, and re-resolves all elements in the tree that reference a resource with the specified key.
     * @param {Integer} dictionaryHandle The dictionary to remove the resource from.
     * @param {Integer} resourceKey The key of the resource to remove.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//xamlom/nf-xamlom-ivisualtreeservice3-removedictionaryitem
     */
    RemoveDictionaryItem(dictionaryHandle, resourceKey) {
        result := ComCall(22, this, "uint", dictionaryHandle, "uint", resourceKey, "HRESULT")
        return result
    }
}
