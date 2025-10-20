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
     * 
     * @param {Pointer<Guid>} pContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledevicepropertiesbulkcallback-onstart
     */
    OnStart(pContext) {
        result := ComCall(3, this, "ptr", pContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pContext 
     * @param {IPortableDeviceValuesCollection} pResults 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledevicepropertiesbulkcallback-onprogress
     */
    OnProgress(pContext, pResults) {
        result := ComCall(4, this, "ptr", pContext, "ptr", pResults, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pContext 
     * @param {HRESULT} hrStatus 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledevicepropertiesbulkcallback-onend
     */
    OnEnd(pContext, hrStatus) {
        result := ComCall(5, this, "ptr", pContext, "int", hrStatus, "HRESULT")
        return result
    }
}
