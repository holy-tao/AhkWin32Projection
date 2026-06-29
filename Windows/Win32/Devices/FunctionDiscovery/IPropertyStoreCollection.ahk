#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\UI\Shell\PropertiesSystem\IPropertyStore.ahk" { IPropertyStore }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Devices.FunctionDiscovery
 */
export default struct IPropertyStoreCollection extends IUnknown {
    /**
     * The interface identifier for IPropertyStoreCollection
     * @type {Guid}
     */
    static IID := Guid("{d14d9c30-12d2-42d8-bce4-c60c2bb226fa}")

    /**
     * The class identifier for PropertyStoreCollection
     * @type {Guid}
     */
    static CLSID := Guid("{edd36029-d753-4862-aa5b-5bccad2a4d29}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPropertyStoreCollection interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetCount  : IntPtr
        Get       : IntPtr
        Item      : IntPtr
        Add       : IntPtr
        Remove    : IntPtr
        Delete    : IntPtr
        DeleteAll : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPropertyStoreCollection.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetCount() {
        result := ComCall(3, this, "uint*", &pdwCount := 0, "HRESULT")
        return pdwCount
    }

    /**
     * Get started learning the basics of building great desktop apps in this section.
     * @param {PWSTR} pszInstanceIdentity 
     * @param {Pointer<Integer>} pdwIndex 
     * @returns {IPropertyStore} 
     * @see https://learn.microsoft.com/windows/win32/desktop-programming
     */
    Get(pszInstanceIdentity, pdwIndex) {
        pszInstanceIdentity := pszInstanceIdentity is String ? StrPtr(pszInstanceIdentity) : pszInstanceIdentity

        pdwIndexMarshal := pdwIndex is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "ptr", pszInstanceIdentity, pdwIndexMarshal, pdwIndex, "ptr*", &ppIPropertyStore := 0, "HRESULT")
        return IPropertyStore(ppIPropertyStore)
    }

    /**
     * Windows Image Acquisition (WIA) hardware devices are represented as hierarchical trees of Item objects. The root item in this tree represents the device itself, while child items represent images, folders, or scanning beds.
     * @remarks
     * The **Item** object has these types of members:
     * 
     * -   [Methods](#methods)
     * -   [Properties](#properties)
     * @param {Integer} dwIndex 
     * @returns {IPropertyStore} 
     * @see https://learn.microsoft.com/windows/win32/wia/-wia-item
     */
    Item(dwIndex) {
        result := ComCall(5, this, "uint", dwIndex, "ptr*", &ppIPropertyStore := 0, "HRESULT")
        return IPropertyStore(ppIPropertyStore)
    }

    /**
     * 
     * @param {IPropertyStore} pIPropertyStore 
     * @returns {HRESULT} 
     */
    Add(pIPropertyStore) {
        result := ComCall(6, this, "ptr", pIPropertyStore, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwIndex 
     * @returns {IPropertyStore} 
     */
    Remove(dwIndex) {
        result := ComCall(7, this, "uint", dwIndex, "ptr*", &pIPropertyStore := 0, "HRESULT")
        return IPropertyStore(pIPropertyStore)
    }

    /**
     * 
     * @param {Integer} dwIndex 
     * @returns {HRESULT} 
     */
    Delete(dwIndex) {
        result := ComCall(8, this, "uint", dwIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    DeleteAll() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IPropertyStoreCollection.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetCount := CallbackCreate(GetMethod(implObj, "GetCount"), flags, 2)
        this.vtbl.Get := CallbackCreate(GetMethod(implObj, "Get"), flags, 4)
        this.vtbl.Item := CallbackCreate(GetMethod(implObj, "Item"), flags, 3)
        this.vtbl.Add := CallbackCreate(GetMethod(implObj, "Add"), flags, 2)
        this.vtbl.Remove := CallbackCreate(GetMethod(implObj, "Remove"), flags, 3)
        this.vtbl.Delete := CallbackCreate(GetMethod(implObj, "Delete"), flags, 2)
        this.vtbl.DeleteAll := CallbackCreate(GetMethod(implObj, "DeleteAll"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetCount)
        CallbackFree(this.vtbl.Get)
        CallbackFree(this.vtbl.Item)
        CallbackFree(this.vtbl.Add)
        CallbackFree(this.vtbl.Remove)
        CallbackFree(this.vtbl.Delete)
        CallbackFree(this.vtbl.DeleteAll)
    }
}
