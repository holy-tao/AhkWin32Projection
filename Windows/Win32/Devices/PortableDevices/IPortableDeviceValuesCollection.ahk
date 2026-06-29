#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IPortableDeviceValues.ahk" { IPortableDeviceValues }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IPortableDeviceValuesCollection interface holds a collection of zero-based indexed IPortableDeviceValues interfaces.
 * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iportabledevicevaluescollection
 * @namespace Windows.Win32.Devices.PortableDevices
 */
export default struct IPortableDeviceValuesCollection extends IUnknown {
    /**
     * The interface identifier for IPortableDeviceValuesCollection
     * @type {Guid}
     */
    static IID := Guid("{6e3f2d79-4e07-48c4-8208-d8c2e5af4a99}")

    /**
     * The class identifier for PortableDeviceValuesCollection
     * @type {Guid}
     */
    static CLSID := Guid("{3882134d-14cf-4220-9cb4-435f86d83f60}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPortableDeviceValuesCollection interfaces
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
            this.vtbl := IPortableDeviceValuesCollection.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * IPortableDeviceValuesCollection::GetCount method - The GetCount method retrieves the number of items in the collection.
     * @param {Pointer<Integer>} pcElems Pointer to a **DWORD** that contains the number of **IPortableDeviceValues** interfaces in the collection.
     * @returns {HRESULT} The method returns an **HRESULT**. Possible values include, but are not limited to, those in the following table.
     * 
     * 
     * 
     * | Return code                                                                               | Description                                          |
     * |-------------------------------------------------------------------------------------------|------------------------------------------------------|
     * | <dl> <dt>**S\_OK**</dt> </dl>      | The method succeeded.<br/>                     |
     * | <dl> <dt>**E\_POINTER**</dt> </dl> | A required pointer argument was **NULL**.<br/> |
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iportabledevicevaluescollection-getcount
     */
    GetCount(pcElems) {
        pcElemsMarshal := pcElems is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pcElemsMarshal, pcElems, "HRESULT")
        return result
    }

    /**
     * IPortableDeviceValuesCollection::GetAt method - The GetAt method retrieves an item from the collection by a zero-based index.
     * @remarks
     * Any changes that are made to values in the retrieved interface will be made to the version stored in the collection.
     * @param {Integer} dwIndex 
     * @returns {IPortableDeviceValues} Address of a variable that receives a pointer to an [**IPortableDeviceValues**](iportabledevicevalues.md) interface from the collection. The caller is responsible for calling **Release** on this interface when done with it.
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iportabledevicevaluescollection-getat
     */
    GetAt(dwIndex) {
        result := ComCall(4, this, "uint", dwIndex, "ptr*", &ppValues := 0, "HRESULT")
        return IPortableDeviceValues(ppValues)
    }

    /**
     * IPortableDeviceValuesCollection::Add method - The Add method adds an item to the collection.
     * @param {IPortableDeviceValues} pValues Pointer to an **IPortableDeviceValues** interface to add to the collection. The interface is not actually copied, but **AddRef** is called on it.
     * @returns {HRESULT} The method returns an **HRESULT**. Possible values include, but are not limited to, those in the following table.
     * 
     * 
     * 
     * | Return code                                                                                   | Description                                                                         |
     * |-----------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------|
     * | <dl> <dt>**S\_OK**</dt> </dl>          | The method succeeded.<br/>                                                    |
     * | <dl> <dt>**E\_OUTOFMEMORY**</dt> </dl> | There is not enough memory available to add the value to the collection.<br/> |
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iportabledevicevaluescollection-add
     */
    Add(pValues) {
        result := ComCall(5, this, "ptr", pValues, "HRESULT")
        return result
    }

    /**
     * The Clear method releases all items from the collection.
     * @remarks
     * The method releases all memory that is allocated for the items in the collection.
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
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iportabledevicevaluescollection-clear
     */
    Clear() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * IPortableDeviceValuesCollection::RemoveAt method - The RemoveAt method removes the element stored at the location specified by the given index.
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
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iportabledevicevaluescollection-removeat
     */
    RemoveAt(dwIndex) {
        result := ComCall(7, this, "uint", dwIndex, "HRESULT")
        return result
    }

    Query(iid) {
        if (IPortableDeviceValuesCollection.IID.Equals(iid)) {
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
