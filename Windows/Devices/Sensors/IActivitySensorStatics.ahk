#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\ActivitySensor.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\ActivitySensorReading.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class IActivitySensorStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IActivitySensorStatics
     * @type {Guid}
     */
    static IID => Guid("{a71e0e9d-ee8b-45d1-b25b-08cc0df92ab6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDefaultAsync", "GetDeviceSelector", "FromIdAsync", "GetSystemHistoryAsync", "GetSystemHistoryWithDurationAsync"]

    /**
     * 
     * @returns {IAsyncOperation<ActivitySensor>} 
     */
    GetDefaultAsync() {
        result := ComCall(6, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(ActivitySensor, result_)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    GetDeviceSelector() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} deviceId 
     * @returns {IAsyncOperation<ActivitySensor>} 
     */
    FromIdAsync(deviceId) {
        if(deviceId is String) {
            pin := HSTRING.Create(deviceId)
            deviceId := pin.Value
        }
        deviceId := deviceId is Win32Handle ? NumGet(deviceId, "ptr") : deviceId

        result := ComCall(8, this, "ptr", deviceId, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(ActivitySensor, result_)
    }

    /**
     * 
     * @param {DateTime} fromTime 
     * @returns {IAsyncOperation<IVectorView<ActivitySensorReading>>} 
     */
    GetSystemHistoryAsync(fromTime) {
        result := ComCall(9, this, "ptr", fromTime, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, ActivitySensorReading), result_)
    }

    /**
     * 
     * @param {DateTime} fromTime 
     * @param {TimeSpan} duration_ 
     * @returns {IAsyncOperation<IVectorView<ActivitySensorReading>>} 
     */
    GetSystemHistoryWithDurationAsync(fromTime, duration_) {
        result := ComCall(10, this, "ptr", fromTime, "ptr", duration_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, ActivitySensorReading), result_)
    }
}
