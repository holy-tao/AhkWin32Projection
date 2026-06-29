#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IEnumPortableDeviceObjectIDs interface enumerates the objects on a portable device. Get this interface initially by calling IPortableDeviceContent::EnumObjects on a device.
 * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nn-portabledeviceapi-ienumportabledeviceobjectids
 * @namespace Windows.Win32.Devices.PortableDevices
 */
export default struct IEnumPortableDeviceObjectIDs extends IUnknown {
    /**
     * The interface identifier for IEnumPortableDeviceObjectIDs
     * @type {Guid}
     */
    static IID := Guid("{10ece955-cf41-4728-bfa0-41eedf1bbf19}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IEnumPortableDeviceObjectIDs interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Next   : IntPtr
        Skip   : IntPtr
        Reset  : IntPtr
        Clone  : IntPtr
        Cancel : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IEnumPortableDeviceObjectIDs.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The Next method retrieves the next one or more object IDs in the enumeration sequence.
     * @remarks
     * If fewer than the requested number of elements remain in the sequence, this method retrieves the remaining elements. The number of elements that are actually retrieved is returned through <i>pcFetched</i> (unless the caller passed in NULL for that parameter). Enumerated objects are all peers—that is, enumerating children of an object will enumerate only direct children, not grandchild or deeper objects.
     * @param {Integer} cObjects A count of the objects requested.
     * @param {Pointer<Integer>} pcFetched On input, this parameter is ignored. On output, the number of IDs actually retrieved. If no object IDs are released and the return value is S_FALSE, there are no more objects to enumerate.
     * @returns {PWSTR} An array of <b>LPWSTR</b> pointers, each specifying a retrieved object ID. The caller must allocate an array of <i>cObjects</i> LPWSTR elements. The caller must free both the array and the returned strings. The strings are freed by calling <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-ienumportabledeviceobjectids-next
     */
    Next(cObjects, pcFetched) {
        pcFetchedMarshal := pcFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", cObjects, PWSTR.Ptr, &pObjIDs := 0, pcFetchedMarshal, pcFetched, Int32)
        return pObjIDs
    }

    /**
     * The Skip method skips a specified number of objects in the enumeration sequence.
     * @param {Integer} cObjects The number of objects to skip.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     *           
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified number of objects could not be skipped (for instance, if fewer than <i>cObjects</i> remained in the enumeration sequence).
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-ienumportabledeviceobjectids-skip
     */
    Skip(cObjects) {
        result := ComCall(4, this, "uint", cObjects, Int32)
        return result
    }

    /**
     * The Reset method resets the enumeration sequence to the beginning. (IEnumPortableDeviceObjectIDs.Reset)
     * @remarks
     * There is no guarantee that the same objects will be enumerated after this method is called. This is because objects that were enumerated previously might have been deleted or new objects might have been added.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     *           
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-ienumportabledeviceobjectids-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * The Clone method duplicates the current IEnumPortableDeviceObjectIDs interface.
     * @returns {IEnumPortableDeviceObjectIDs} Address of a variable that receives a pointer to an enumeration interface. The caller must release this interface when it is finished with the interface.
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-ienumportabledeviceobjectids-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumPortableDeviceObjectIDs(ppEnum)
    }

    /**
     * The Cancel method cancels a pending operation. (IEnumPortableDeviceObjectIDs.Cancel)
     * @remarks
     * This method cancels all pending operations on the current device handle, which corresponds to a session associated with an <a href="https://docs.microsoft.com/windows/desktop/api/portabledeviceapi/nn-portabledeviceapi-iportabledevice">IPortableDevice</a> interface. The Windows Portable Devices (WPD) API does not support targeted cancellation of specific operations.
     * @returns {HRESULT} The method returns an 
     * <b>HRESULT</b>
     * . Possible values include, but are not limited to, those in the following table.
     *           
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was canceled successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_WPD_DEVICE_NOT_OPEN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device is not opened.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-ienumportabledeviceobjectids-cancel
     */
    Cancel() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IEnumPortableDeviceObjectIDs.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Next := CallbackCreate(GetMethod(implObj, "Next"), flags, 4)
        this.vtbl.Skip := CallbackCreate(GetMethod(implObj, "Skip"), flags, 2)
        this.vtbl.Reset := CallbackCreate(GetMethod(implObj, "Reset"), flags, 1)
        this.vtbl.Clone := CallbackCreate(GetMethod(implObj, "Clone"), flags, 2)
        this.vtbl.Cancel := CallbackCreate(GetMethod(implObj, "Cancel"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Next)
        CallbackFree(this.vtbl.Skip)
        CallbackFree(this.vtbl.Reset)
        CallbackFree(this.vtbl.Clone)
        CallbackFree(this.vtbl.Cancel)
    }
}
