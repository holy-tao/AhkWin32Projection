#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IPortableDeviceKeyCollection interface holds a collection of PROPERTYKEY values. This interface can be retrieved from a method or, if a new object is required, call CoCreate with CLSID\_PortableDeviceKeyCollection.
 * @see https://learn.microsoft.com/windows/win32/ktop-src/wpd_sdk/iportabledevicekeycollection
 * @namespace Windows.Win32.Devices.PortableDevices
 * @version v4.0.30319
 */
class IPortableDeviceKeyCollection extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPortableDeviceKeyCollection
     * @type {Guid}
     */
    static IID => Guid("{dada2357-e0ad-492e-98db-dd61c53ba353}")

    /**
     * The class identifier for PortableDeviceKeyCollection
     * @type {Guid}
     */
    static CLSID => Guid("{de2d022d-2480-43be-97f0-d1fa2cf98f4f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCount", "GetAt", "Add", "Clear", "RemoveAt"]

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
     * @see https://learn.microsoft.com/windows/win32/ktop-src/wpd_sdk/iportabledevicekeycollection-getcount
     */
    GetCount(pcElems) {
        pcElemsMarshal := pcElems is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pcElemsMarshal, pcElems, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/ktop-src/wpd_sdk/iportabledevicekeycollection-getat
     */
    GetAt(dwIndex, pKey) {
        result := ComCall(4, this, "uint", dwIndex, "ptr", pKey, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/ktop-src/wpd_sdk/iportabledevicekeycollection-add
     */
    Add(Key) {
        result := ComCall(5, this, "ptr", Key, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/ktop-src/wpd_sdk/iportabledevicekeycollection-clear
     */
    Clear() {
        result := ComCall(6, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/ktop-src/wpd_sdk/iportabledevicekeycollection-removeat
     */
    RemoveAt(dwIndex) {
        result := ComCall(7, this, "uint", dwIndex, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
