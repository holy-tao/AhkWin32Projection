#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\IVisualTreeService2.ahk" { IVisualTreeService2 }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ResourceType.ahk" { ResourceType }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Represents additional capabilities of an IVisualTreeService2 object.
 * @see https://learn.microsoft.com/windows/win32/api/xamlom/nn-xamlom-ivisualtreeservice3
 * @namespace Windows.Win32.UI.Xaml.Diagnostics
 */
export default struct IVisualTreeService3 extends IVisualTreeService2 {
    /**
     * The interface identifier for IVisualTreeService3
     * @type {Guid}
     */
    static IID := Guid("{0e79c6e0-85a0-4be8-b41a-655cf1fd19bd}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IVisualTreeService3 interfaces
    */
    struct Vtbl extends IVisualTreeService2.Vtbl {
        ResolveResource      : IntPtr
        GetDictionaryItem    : IntPtr
        AddDictionaryItem    : IntPtr
        RemoveDictionaryItem : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IVisualTreeService3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Resolves a resource for an element in the tree and applies the resource to the property provided by the specified property index.
     * @remarks
     * If no resource was found, or the resource type was invalid, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/xamlom/nn-xamlom-ivisualtreeservicecallback2">IVisualTreeServiceCallback2</a>  will be notified.
     * 
     * Call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/xamlom/nf-xamlom-ivisualtreeservice3-getdictionaryitem">GetDictionaryItem</a> to get a <i>resourceContext</i> and give better resolution context for <b>ResolveResource</b>.
     * @param {Integer} resourceContext The context of the resource.
     * @param {PWSTR} resourceName The name of the resource.
     * @param {ResourceType} _resourceType The type of the resource.
     * @param {Integer} propertyIndex The index of the property to apply the resource to.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/xamlom/nf-xamlom-ivisualtreeservice3-resolveresource
     */
    ResolveResource(resourceContext, resourceName, _resourceType, propertyIndex) {
        resourceName := resourceName is String ? StrPtr(resourceName) : resourceName

        result := ComCall(19, this, "uint", resourceContext, "ptr", resourceName, ResourceType, _resourceType, "uint", propertyIndex, "HRESULT")
        return result
    }

    /**
     * Gets an item from a ResourceDictionary.
     * @param {Integer} dictionaryHandle The dictionary to get the resource from.
     * @param {PWSTR} resourceName The name of the resource to get.
     * @param {BOOL} resourceIsImplicitStyle <b>true</b> if the resource is an implicit style; otherwise, <b>false</b>.
     * @returns {Integer} The resource that was retrieved.
     * @see https://learn.microsoft.com/windows/win32/api/xamlom/nf-xamlom-ivisualtreeservice3-getdictionaryitem
     */
    GetDictionaryItem(dictionaryHandle, resourceName, resourceIsImplicitStyle) {
        resourceName := resourceName is String ? StrPtr(resourceName) : resourceName

        result := ComCall(20, this, "uint", dictionaryHandle, "ptr", resourceName, BOOL, resourceIsImplicitStyle, "uint*", &resourceHandle := 0, "HRESULT")
        return resourceHandle
    }

    /**
     * Adds an item to a ResourceDictionary, and re-resolves all elements in the tree that reference a resource with the specified key.
     * @remarks
     * Any invalid resource references will result in the value being cleared, and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/xamlom/nn-xamlom-ivisualtreeservicecallback2">IVisualTreeServiceCallback2</a>  will be notified.
     * @param {Integer} dictionaryHandle The dictionary to add the resource to.
     * @param {Integer} resourceKey The key of the resource to add.
     * @param {Integer} resourceHandle The resource to add.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/xamlom/nf-xamlom-ivisualtreeservice3-adddictionaryitem
     */
    AddDictionaryItem(dictionaryHandle, resourceKey, resourceHandle) {
        result := ComCall(21, this, "uint", dictionaryHandle, "uint", resourceKey, "uint", resourceHandle, "HRESULT")
        return result
    }

    /**
     * Removes an item from a ResourceDictionary, and re-resolves all elements in the tree that reference a resource with the specified key.
     * @remarks
     * Any invalid resource references will result in the value being cleared, and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/xamlom/nn-xamlom-ivisualtreeservicecallback2">IVisualTreeServiceCallback2</a>  will be notified.
     * @param {Integer} dictionaryHandle The dictionary to remove the resource from.
     * @param {Integer} resourceKey The key of the resource to remove.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/xamlom/nf-xamlom-ivisualtreeservice3-removedictionaryitem
     */
    RemoveDictionaryItem(dictionaryHandle, resourceKey) {
        result := ComCall(22, this, "uint", dictionaryHandle, "uint", resourceKey, "HRESULT")
        return result
    }

    Query(iid) {
        if (IVisualTreeService3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ResolveResource := CallbackCreate(GetMethod(implObj, "ResolveResource"), flags, 5)
        this.vtbl.GetDictionaryItem := CallbackCreate(GetMethod(implObj, "GetDictionaryItem"), flags, 5)
        this.vtbl.AddDictionaryItem := CallbackCreate(GetMethod(implObj, "AddDictionaryItem"), flags, 4)
        this.vtbl.RemoveDictionaryItem := CallbackCreate(GetMethod(implObj, "RemoveDictionaryItem"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ResolveResource)
        CallbackFree(this.vtbl.GetDictionaryItem)
        CallbackFree(this.vtbl.AddDictionaryItem)
        CallbackFree(this.vtbl.RemoveDictionaryItem)
    }
}
