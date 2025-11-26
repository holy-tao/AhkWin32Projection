#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IPortableDevicePropertiesBulkCallback interface is implemented by the application to track the progress of an asynchronous operation that was begun by using the IPortableDevicePropertiesBulk interface.After the application calls IPortableDevicePropertiesBulk::Start, Windows Portable Devices calls IPortableDevicePropertiesBulkCallback::OnStart first, and then repeatedly calls IPortableDevicePropertiesBulkCallback::OnProgress with information until the operation is completed or the application calls IPortableDevicePropertiesBulk::Cancel or returns an error value for OnProgress. Finally, regardless of whether the operation completed successfully, Windows Portable Devices calls IPortableDevicePropertiesBulkCallback::OnEnd.
 * @see https://docs.microsoft.com/windows/win32/api//portabledeviceapi/nn-portabledeviceapi-iportabledevicepropertiesbulkcallback
 * @namespace Windows.Win32.Devices.PortableDevices
 * @version v4.0.30319
 */
class IPortableDevicePropertiesBulkCallback extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPortableDevicePropertiesBulkCallback
     * @type {Guid}
     */
    static IID => Guid("{9deacb80-11e8-40e3-a9f3-f557986a7845}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnStart", "OnProgress", "OnEnd"]

    /**
     * The OnStart method is called by the SDK when a bulk operation started by IPortableDevicePropertiesBulk::Start is about to begin.
     * @param {Pointer<Guid>} pContext Pointer to a GUID that identifies which operation has started. This value is produced by a <b>Queue</b>... method of the <a href="https://docs.microsoft.com/windows/desktop/api/portabledeviceapi/nn-portabledeviceapi-iportabledevicepropertiesbulk">IPortableDevicePropertiesBulk</a> interface.
     * @returns {HRESULT} The application should return either S_OK or an error code to abandon the operation. The application should handle all error codes in the same manner.
     * @see https://docs.microsoft.com/windows/win32/api//portabledeviceapi/nf-portabledeviceapi-iportabledevicepropertiesbulkcallback-onstart
     */
    OnStart(pContext) {
        result := ComCall(3, this, "ptr", pContext, "HRESULT")
        return result
    }

    /**
     * The OnProgress method is called by the SDK when a bulk operation started by IPortableDevicePropertiesBulk::Start has sent data to the device and received some information back.
     * @param {Pointer<Guid>} pContext Pointer to a GUID that identifies which operation is in progress. This value is produced by a <b>Queue</b>... method of the <a href="https://docs.microsoft.com/windows/desktop/api/portabledeviceapi/nn-portabledeviceapi-iportabledevicepropertiesbulk">IPortableDevicePropertiesBulk</a> interface.
     * @param {IPortableDeviceValuesCollection} pResults Pointer to an <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/iportabledevicevaluescollection">IPortableDeviceValuesCollection</a> interface that contains the results retrieved from the device. This interface will hold one or more <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/iportabledevicevalues">IPortableDeviceValues</a> interfaces. Each of these interfaces will hold one <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/object-properties">WPD_OBJECT_ID</a> property with a string value (VT_LPSTR) specifying the object ID of the object that these values pertain to. The rest of the values in each <b>IPortableDeviceValues</b> interface vary, depending on the bulk operation being reported. For the <b>QueueGetValuesByObjectFormat</b> and <b>QueueGetValuesByObjectList</b> methods, they will be retrieved values of varying types. For <a href="https://docs.microsoft.com/windows/desktop/api/portabledeviceapi/nf-portabledeviceapi-iportabledevicepropertiesbulk-queuesetvaluesbyobjectlist">QueueSetValuesByObjectList</a>, they will be <b>VT_ERROR</b><b>HRESULT</b> values for any errors encountered when setting values.
     * @returns {HRESULT} The application should return either S_OK, or an error code to abandon the operation. All error codes are handled the same way.
     * @see https://docs.microsoft.com/windows/win32/api//portabledeviceapi/nf-portabledeviceapi-iportabledevicepropertiesbulkcallback-onprogress
     */
    OnProgress(pContext, pResults) {
        result := ComCall(4, this, "ptr", pContext, "ptr", pResults, "HRESULT")
        return result
    }

    /**
     * The OnEnd method is called by the SDK when a bulk operation that is started by IPortableDevicePropertiesBulk::Start is completed.
     * @param {Pointer<Guid>} pContext Pointer to a GUID that identifies which operation has finished. This value is produced by a <b>Queue</b>... method of the <a href="https://docs.microsoft.com/windows/desktop/api/portabledeviceapi/nn-portabledeviceapi-iportabledevicepropertiesbulk">IPortableDevicePropertiesBulk</a> interface.
     * @param {HRESULT} hrStatus Contains any errors returned by the driver after the bulk operation has completed.
     * @returns {HRESULT} The method's return value is ignored.
     * @see https://docs.microsoft.com/windows/win32/api//portabledeviceapi/nf-portabledeviceapi-iportabledevicepropertiesbulkcallback-onend
     */
    OnEnd(pContext, hrStatus) {
        result := ComCall(5, this, "ptr", pContext, "int", hrStatus, "HRESULT")
        return result
    }
}
