#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IStream.ahk" { IStream }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The IPortableDeviceDataStream interface exposes additional methods on an IStream that is used for data transfers.
 * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nn-portabledeviceapi-iportabledevicedatastream
 * @namespace Windows.Win32.Devices.PortableDevices
 */
export default struct IPortableDeviceDataStream extends IStream {
    /**
     * The interface identifier for IPortableDeviceDataStream
     * @type {Guid}
     */
    static IID := Guid("{88e04db3-1012-4d64-9996-f703a950d3f4}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPortableDeviceDataStream interfaces
    */
    struct Vtbl extends IStream.Vtbl {
        GetObjectID : IntPtr
        Cancel      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPortableDeviceDataStream.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The GetObjectID method retrieves the object ID of the resource that was written to the device. This method is only valid after calling IStream::Commit on the data stream.
     * @remarks
     * An object ID is created after the object is created on the device. Therefore, a new object that is created by calling <a href="https://docs.microsoft.com/windows/desktop/api/portabledeviceapi/nf-portabledeviceapi-iportabledevicecontent-createobjectwithpropertiesanddata">IPortableDeviceContent::CreateObjectWithPropertiesAndData</a> will not have an ID assigned until the application calls <b>Commit</b> on the data transfer stream.
     * @returns {PWSTR} The ID of the object just transferred to the device.
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledevicedatastream-getobjectid
     */
    GetObjectID() {
        result := ComCall(14, this, PWSTR.Ptr, &ppszObjectID := 0, "HRESULT")
        return ppszObjectID
    }

    /**
     * The Cancel method cancels a call in progress on this interface.
     * @remarks
     * This method cancels all pending operations on the current device handle, which corresponds to a session associated with an <a href="https://docs.microsoft.com/windows/desktop/api/portabledeviceapi/nn-portabledeviceapi-iportabledevice">IPortableDevice</a> interface. The Windows Portable Devices (WPD) API does not support targeted cancellation of specific operations.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledevicedatastream-cancel
     */
    Cancel() {
        result := ComCall(15, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IPortableDeviceDataStream.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetObjectID := CallbackCreate(GetMethod(implObj, "GetObjectID"), flags, 2)
        this.vtbl.Cancel := CallbackCreate(GetMethod(implObj, "Cancel"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetObjectID)
        CallbackFree(this.vtbl.Cancel)
    }
}
