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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnEvent"]

    /**
     * 
     * @param {IPortableDeviceValues} pEventParameters 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledeviceeventcallback-onevent
     */
    OnEvent(pEventParameters) {
        result := ComCall(3, this, "ptr", pEventParameters, "HRESULT")
        return result
    }
}
