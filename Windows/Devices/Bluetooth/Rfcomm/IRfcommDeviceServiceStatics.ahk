#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\IAsyncOperation.ahk
#Include .\RfcommDeviceService.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Bluetooth.Rfcomm
 * @version WindowsRuntime 1.4
 */
class IRfcommDeviceServiceStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRfcommDeviceServiceStatics
     * @type {Guid}
     */
    static IID => Guid("{a4a149ef-626d-41ac-b253-87ac5c27e28a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["FromIdAsync", "GetDeviceSelector"]

    /**
     * 
     * @param {HSTRING} deviceId 
     * @returns {IAsyncOperation<RfcommDeviceService>} 
     */
    FromIdAsync(deviceId) {
        if(deviceId is String) {
            pin := HSTRING.Create(deviceId)
            deviceId := pin.Value
        }
        deviceId := deviceId is Win32Handle ? NumGet(deviceId, "ptr") : deviceId

        result := ComCall(6, this, "ptr", deviceId, "ptr*", &asyncOp := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(RfcommDeviceService, asyncOp)
    }

    /**
     * 
     * @param {RfcommServiceId} serviceId 
     * @returns {HSTRING} 
     */
    GetDeviceSelector(serviceId) {
        selector_ := HSTRING()
        result := ComCall(7, this, "ptr", serviceId, "ptr", selector_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return selector_
    }
}
