#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Invokes, or cancels invocation of, a method on a service.
 * @see https://docs.microsoft.com/windows/win32/api//portabledeviceapi/nn-portabledeviceapi-iportabledeviceservicemethods
 * @namespace Windows.Win32.Devices.PortableDevices
 * @version v4.0.30319
 */
class IPortableDeviceServiceMethods extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPortableDeviceServiceMethods
     * @type {Guid}
     */
    static IID => Guid("{e20333c9-fd34-412d-a381-cc6f2d820df7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke", "InvokeAsync", "Cancel"]

    /**
     * Synchronously invokes a method.
     * @param {Pointer<Guid>} Method The method to invoke.
     * @param {IPortableDeviceValues} pParameters A pointer to an <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/iportabledevicevalues">IPortableDeviceValues</a> interface that contains the parameters of the invoked method, or <b>NULL</b> to indicate that the method has no parameters.
     * @param {Pointer<IPortableDeviceValues>} ppResults The address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/iportabledevicevalues">IPortableDeviceValues</a> interface that receives the method results, or <b>NULL</b> to ignore the method results.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Any other <b>HRESULT</b> value indicates that the call failed.
     * @see https://docs.microsoft.com/windows/win32/api//portabledeviceapi/nf-portabledeviceapi-iportabledeviceservicemethods-invoke
     */
    Invoke(Method, pParameters, ppResults) {
        result := ComCall(3, this, "ptr", Method, "ptr", pParameters, "ptr*", ppResults, "HRESULT")
        return result
    }

    /**
     * Asynchronously invokes a method.
     * @param {Pointer<Guid>} Method The method to invoke.
     * @param {IPortableDeviceValues} pParameters A pointer to an <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/iportabledevicevalues">IPortableDeviceValues</a> interface that contains the parameters of the invoked method, or <b>NULL</b> to indicate that the method has no parameters.
     * @param {IPortableDeviceServiceMethodCallback} pCallback A pointer to an application-supplied <a href="https://docs.microsoft.com/windows/desktop/api/portabledeviceapi/nn-portabledeviceapi-iportabledeviceservicemethodcallback">IPortableDeviceServiceMethodCallback</a> callback object that  receives the method results, or <b>NULL</b> to ignore the method results.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Any other <b>HRESULT</b> value indicates that the call failed.
     * @see https://docs.microsoft.com/windows/win32/api//portabledeviceapi/nf-portabledeviceapi-iportabledeviceservicemethods-invokeasync
     */
    InvokeAsync(Method, pParameters, pCallback) {
        result := ComCall(4, this, "ptr", Method, "ptr", pParameters, "ptr", pCallback, "HRESULT")
        return result
    }

    /**
     * Cancels a pending method invocation.
     * @param {IPortableDeviceServiceMethodCallback} pCallback A pointer to the callback object whose method invocation is to be canceled, or <b>NULL</b> to cancel all pending method invocations.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Any other <b>HRESULT</b> value indicates that the call failed.
     * @see https://docs.microsoft.com/windows/win32/api//portabledeviceapi/nf-portabledeviceapi-iportabledeviceservicemethods-cancel
     */
    Cancel(pCallback) {
        result := ComCall(5, this, "ptr", pCallback, "HRESULT")
        return result
    }
}
