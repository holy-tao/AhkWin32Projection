#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\PROPERTYKEY.ahk" { PROPERTYKEY }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IPortableDeviceKeyCollection interface holds a collection of PROPERTYKEY values. This interface can be retrieved from a method or, if a new object is required, call CoCreate with CLSID\_PortableDeviceKeyCollection.
 * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iportabledevicekeycollection
 * @namespace Windows.Win32.Devices.PortableDevices
 */
export default struct IPortableDeviceKeyCollection extends IUnknown {
    /**
     * The interface identifier for IPortableDeviceKeyCollection
     * @type {Guid}
     */
    static IID := Guid("{dada2357-e0ad-492e-98db-dd61c53ba353}")

    /**
     * The class identifier for PortableDeviceKeyCollection
     * @type {Guid}
     */
    static CLSID := Guid("{de2d022d-2480-43be-97f0-d1fa2cf98f4f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPortableDeviceKeyCollection interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetCount : IntPtr
        GetAt    : IntPtr
        Add      : IntPtr
        Clear    : IntPtr
        RemoveAt : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPortableDeviceKeyCollection.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The GetCount method retrieves the number of keys in this collection.
     * @param {Pointer<Integer>} pcElems Pointer to a **DWORD** that contains the number of keys in the collection.
     * @returns {HRESULT} The method returns an **HRESULT**. Possible values include, but are not limited to, those in the following table.
     * 
     * 
     * 
     * | Return code                                                                               | Description                                          |
     * |-------------------------------------------------------------------------------------------|------------------------------------------------------|
     * | <dl> <dt>**S\_OK**</dt> </dl>      | The method succeeded.<br/>                     |
     * | <dl> <dt>**E\_POINTER**</dt> </dl> | A required pointer argument was **NULL**.<br/> |
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iportabledevicekeycollection-getcount
     */
    GetCount(pcElems) {
        pcElemsMarshal := pcElems is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pcElemsMarshal, pcElems, "HRESULT")
        return result
    }

    /**
     * The GetAt method retrieves a PROPERTYKEY from the collection by index.
     * @param {Integer} dwIndex 
     * @param {Pointer<PROPERTYKEY>} pKey Pointer to a **PROPERTYKEY** object.
     * @returns {HRESULT} The method returns an **HRESULT**. Possible values include, but are not limited to, those in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                          |
     * |----------------------------------------------------------------------------------------------|------------------------------------------------------|
     * | <dl> <dt>**S\_OK**</dt> </dl>         | The method succeeded.<br/>                     |
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The index passed in was out of range.<br/>     |
     * | <dl> <dt>**E\_POINTER**</dt> </dl>    | A required pointer argument was **NULL**.<br/> |
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iportabledevicekeycollection-getat
     */
    GetAt(dwIndex, pKey) {
        result := ComCall(4, this, "uint", dwIndex, PROPERTYKEY.Ptr, pKey, "HRESULT")
        return result
    }

    /**
     * The Add method adds a property key to the collection.
     * @param {Pointer<PROPERTYKEY>} Key A **REFPROPERTYKEY** to add to the collection. This method copies the key to the collection, so you can release the local variable after calling this method.
     * @returns {HRESULT} The method returns an **HRESULT**. Possible values include, but are not limited to, those in the following table.
     * 
     * 
     * 
     * | Return code                                                                                   | Description                                                                       |
     * |-----------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------|
     * | <dl> <dt>**S\_OK**</dt> </dl>          | The method succeeded.<br/>                                                  |
     * | <dl> <dt>**E\_OUTOFMEMORY**</dt> </dl> | There is not enough memory available to add the key to the collection.<br/> |
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iportabledevicekeycollection-add
     */
    Add(Key) {
        result := ComCall(5, this, PROPERTYKEY.Ptr, Key, "HRESULT")
        return result
    }

    /**
     * IPortableDeviceKeyCollection::Clear method - The Clear method deletes all items from the collection.
     * @returns {HRESULT} This method has no parameters.
     * 
     * 
     * The method returns an **HRESULT**. Possible values include, but are not limited to, those in the following table.
     * 
     * 
     * 
     * | Return code                                                                          | Description                      |
     * |--------------------------------------------------------------------------------------|----------------------------------|
     * | <dl> <dt>**S\_OK**</dt> </dl> | The method succeeded.<br/> |
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iportabledevicekeycollection-clear
     */
    Clear() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * IPortableDeviceKeyCollection::RemoveAt method - The RemoveAt method removes the element stored at the location specified by the given index.
     * @remarks
     * You must specify a zero-based index.
     * @param {Integer} dwIndex Specifies the index of the element to be removed.
     * @returns {HRESULT} The method returns an **HRESULT**. Possible values include, but are not limited to, those in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**S\_OK**</dt> </dl>         | The method succeeded.<br/>                 |
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The specified index was out of range.<br/> |
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iportabledevicekeycollection-removeat
     */
    RemoveAt(dwIndex) {
        result := ComCall(7, this, "uint", dwIndex, "HRESULT")
        return result
    }

    Query(iid) {
        if (IPortableDeviceKeyCollection.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetCount := CallbackCreate(GetMethod(implObj, "GetCount"), flags, 2)
        this.vtbl.GetAt := CallbackCreate(GetMethod(implObj, "GetAt"), flags, 3)
        this.vtbl.Add := CallbackCreate(GetMethod(implObj, "Add"), flags, 2)
        this.vtbl.Clear := CallbackCreate(GetMethod(implObj, "Clear"), flags, 1)
        this.vtbl.RemoveAt := CallbackCreate(GetMethod(implObj, "RemoveAt"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetCount)
        CallbackFree(this.vtbl.GetAt)
        CallbackFree(this.vtbl.Add)
        CallbackFree(this.vtbl.Clear)
        CallbackFree(this.vtbl.RemoveAt)
    }
}
