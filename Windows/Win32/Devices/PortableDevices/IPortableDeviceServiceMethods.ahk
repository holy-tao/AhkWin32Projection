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
     * 
     * @param {Pointer<Guid>} Method 
     * @param {Pointer<IPortableDeviceValues>} pParameters 
     * @param {Pointer<IPortableDeviceValues>} ppResults 
     * @returns {HRESULT} 
     */
    Invoke(Method, pParameters, ppResults) {
        result := ComCall(3, this, "ptr", Method, "ptr", pParameters, "ptr", ppResults, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} Method 
     * @param {Pointer<IPortableDeviceValues>} pParameters 
     * @param {Pointer<IPortableDeviceServiceMethodCallback>} pCallback 
     * @returns {HRESULT} 
     */
    InvokeAsync(Method, pParameters, pCallback) {
        result := ComCall(4, this, "ptr", Method, "ptr", pParameters, "ptr", pCallback, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IPortableDeviceServiceMethodCallback>} pCallback 
     * @returns {HRESULT} 
     */
    Cancel(pCallback) {
        result := ComCall(5, this, "ptr", pCallback, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
