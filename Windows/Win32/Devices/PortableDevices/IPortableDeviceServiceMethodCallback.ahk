#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Contains a method that applications use to track the completion of a callback method. Applications that call service methods asynchronously may implement this interface, and supply it as a parameter to IPortableDeviceServiceMethods::InvokeAsync.
 * @see https://docs.microsoft.com/windows/win32/api//portabledeviceapi/nn-portabledeviceapi-iportabledeviceservicemethodcallback
 * @namespace Windows.Win32.Devices.PortableDevices
 * @version v4.0.30319
 */
class IPortableDeviceServiceMethodCallback extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPortableDeviceServiceMethodCallback
     * @type {Guid}
     */
    static IID => Guid("{c424233c-afce-4828-a756-7ed7a2350083}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnComplete"]

    /**
     * Indicates that a callback method has completed execution.
     * @param {HRESULT} hrStatus The overall status of the method.
     * @param {IPortableDeviceValues} pResults An <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/iportabledevicevalues">IPortableDeviceValues</a> interface that contains the method-execution results.  This is empty if the method returns no results.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Any other <b>HRESULT</b> value indicates that the call failed.
     * @see https://docs.microsoft.com/windows/win32/api//portabledeviceapi/nf-portabledeviceapi-iportabledeviceservicemethodcallback-oncomplete
     */
    OnComplete(hrStatus, pResults) {
        result := ComCall(3, this, "int", hrStatus, "ptr", pResults, "HRESULT")
        return result
    }
}
