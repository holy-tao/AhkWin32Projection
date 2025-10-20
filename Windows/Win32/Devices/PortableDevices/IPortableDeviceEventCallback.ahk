#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IPortableDeviceEventCallback interface implemented by the application to receive asynchronous callbacks if an application has registered to receive them by calling IPortableDevice::Advise.
 * @see https://docs.microsoft.com/windows/win32/api//portabledeviceapi/nn-portabledeviceapi-iportabledeviceeventcallback
 * @namespace Windows.Win32.Devices.PortableDevices
 * @version v4.0.30319
 */
class IPortableDeviceEventCallback extends IUnknown{
    /**
     * The interface identifier for IPortableDeviceEventCallback
     * @type {Guid}
     */
    static IID => Guid("{a8792a31-f385-493c-a893-40f64eb45f6e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IPortableDeviceValues>} pEventParameters 
     * @returns {HRESULT} 
     */
    OnEvent(pEventParameters) {
        result := ComCall(3, this, "ptr", pEventParameters, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
