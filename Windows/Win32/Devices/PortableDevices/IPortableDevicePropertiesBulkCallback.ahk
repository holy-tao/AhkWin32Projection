#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IPortableDeviceValuesCollection.ahk" { IPortableDeviceValuesCollection }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IPortableDevicePropertiesBulkCallback interface is implemented by the application to track the progress of an asynchronous operation that was begun by using the IPortableDevicePropertiesBulk interface.After the application calls IPortableDevicePropertiesBulk::Start, Windows Portable Devices calls IPortableDevicePropertiesBulkCallback::OnStart first, and then repeatedly calls IPortableDevicePropertiesBulkCallback::OnProgress with information until the operation is completed or the application calls IPortableDevicePropertiesBulk::Cancel or returns an error value for OnProgress. Finally, regardless of whether the operation completed successfully, Windows Portable Devices calls IPortableDevicePropertiesBulkCallback::OnEnd.
 * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nn-portabledeviceapi-iportabledevicepropertiesbulkcallback
 * @namespace Windows.Win32.Devices.PortableDevices
 */
export default struct IPortableDevicePropertiesBulkCallback extends IUnknown {
    /**
     * The interface identifier for IPortableDevicePropertiesBulkCallback
     * @type {Guid}
     */
    static IID := Guid("{9deacb80-11e8-40e3-a9f3-f557986a7845}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPortableDevicePropertiesBulkCallback interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnStart    : IntPtr
        OnProgress : IntPtr
        OnEnd      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPortableDevicePropertiesBulkCallback.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The OnStart method is called by the SDK when a bulk operation started by IPortableDevicePropertiesBulk::Start is about to begin.
     * @param {Pointer<Guid>} pContext Pointer to a GUID that identifies which operation has started. This value is produced by a <b>Queue</b>... method of the <a href="https://docs.microsoft.com/windows/desktop/api/portabledeviceapi/nn-portabledeviceapi-iportabledevicepropertiesbulk">IPortableDevicePropertiesBulk</a> interface.
     * @returns {HRESULT} The application should return either S_OK or an error code to abandon the operation. The application should handle all error codes in the same manner.
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledevicepropertiesbulkcallback-onstart
     */
    OnStart(pContext) {
        result := ComCall(3, this, Guid.Ptr, pContext, "HRESULT")
        return result
    }

    /**
     * The OnProgress method is called by the SDK when a bulk operation started by IPortableDevicePropertiesBulk::Start has sent data to the device and received some information back.
     * @remarks
     * This method can be called once or multiple times, depending on how large the operation is.
     * 
     * This method does not necessarily retrieve all properties at once, nor does it return the properties in a particular order.
     * 
     * If this method is called multiple times, it may return properties for the same object identifier each time.
     * @param {Pointer<Guid>} pContext Pointer to a GUID that identifies which operation is in progress. This value is produced by a <b>Queue</b>... method of the <a href="https://docs.microsoft.com/windows/desktop/api/portabledeviceapi/nn-portabledeviceapi-iportabledevicepropertiesbulk">IPortableDevicePropertiesBulk</a> interface.
     * @param {IPortableDeviceValuesCollection} pResults Pointer to an <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/iportabledevicevaluescollection">IPortableDeviceValuesCollection</a> interface that contains the results retrieved from the device. This interface will hold one or more <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/iportabledevicevalues">IPortableDeviceValues</a> interfaces. Each of these interfaces will hold one <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/object-properties">WPD_OBJECT_ID</a> property with a string value (VT_LPSTR) specifying the object ID of the object that these values pertain to. The rest of the values in each <b>IPortableDeviceValues</b> interface vary, depending on the bulk operation being reported. For the <b>QueueGetValuesByObjectFormat</b> and <b>QueueGetValuesByObjectList</b> methods, they will be retrieved values of varying types. For <a href="https://docs.microsoft.com/windows/desktop/api/portabledeviceapi/nf-portabledeviceapi-iportabledevicepropertiesbulk-queuesetvaluesbyobjectlist">QueueSetValuesByObjectList</a>, they will be <b>VT_ERROR</b><b>HRESULT</b> values for any errors encountered when setting values.
     * @returns {HRESULT} The application should return either S_OK, or an error code to abandon the operation. All error codes are handled the same way.
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledevicepropertiesbulkcallback-onprogress
     */
    OnProgress(pContext, pResults) {
        result := ComCall(4, this, Guid.Ptr, pContext, "ptr", pResults, "HRESULT")
        return result
    }

    /**
     * The OnEnd method is called by the SDK when a bulk operation that is started by IPortableDevicePropertiesBulk::Start is completed.
     * @param {Pointer<Guid>} pContext Pointer to a GUID that identifies which operation has finished. This value is produced by a <b>Queue</b>... method of the <a href="https://docs.microsoft.com/windows/desktop/api/portabledeviceapi/nn-portabledeviceapi-iportabledevicepropertiesbulk">IPortableDevicePropertiesBulk</a> interface.
     * @param {HRESULT} hrStatus Contains any errors returned by the driver after the bulk operation has completed.
     * @returns {HRESULT} The method's return value is ignored.
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledevicepropertiesbulkcallback-onend
     */
    OnEnd(pContext, hrStatus) {
        result := ComCall(5, this, Guid.Ptr, pContext, "int", hrStatus, "HRESULT")
        return result
    }

    Query(iid) {
        if (IPortableDevicePropertiesBulkCallback.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnStart := CallbackCreate(GetMethod(implObj, "OnStart"), flags, 2)
        this.vtbl.OnProgress := CallbackCreate(GetMethod(implObj, "OnProgress"), flags, 3)
        this.vtbl.OnEnd := CallbackCreate(GetMethod(implObj, "OnEnd"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnStart)
        CallbackFree(this.vtbl.OnProgress)
        CallbackFree(this.vtbl.OnEnd)
    }
}
