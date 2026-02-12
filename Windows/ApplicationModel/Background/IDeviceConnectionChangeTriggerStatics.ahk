#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\DeviceConnectionChangeTrigger.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class IDeviceConnectionChangeTriggerStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDeviceConnectionChangeTriggerStatics
     * @type {Guid}
     */
    static IID => Guid("{c3ea246a-4efd-4498-aa60-a4e4e3b17ab9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["FromIdAsync"]

    /**
     * 
     * @param {HSTRING} deviceId 
     * @returns {IAsyncOperation<DeviceConnectionChangeTrigger>} 
     */
    FromIdAsync(deviceId) {
        if(deviceId is String) {
            pin := HSTRING.Create(deviceId)
            deviceId := pin.Value
        }
        deviceId := deviceId is Win32Handle ? NumGet(deviceId, "ptr") : deviceId

        result := ComCall(6, this, "ptr", deviceId, "ptr*", &deviceChangeTrigger := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(DeviceConnectionChangeTrigger, deviceChangeTrigger)
    }
}
