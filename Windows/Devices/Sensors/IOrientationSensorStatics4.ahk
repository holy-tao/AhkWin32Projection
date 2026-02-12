#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\OrientationSensor.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class IOrientationSensorStatics4 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOrientationSensorStatics4
     * @type {Guid}
     */
    static IID => Guid("{a67feb55-2c85-4b28-a0fe-58c4b20495f5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDeviceSelector", "GetDeviceSelectorWithSensorReadingTypeAndSensorOptimizationGoal", "FromIdAsync"]

    /**
     * 
     * @param {Integer} readingType 
     * @returns {HSTRING} 
     */
    GetDeviceSelector(readingType) {
        result_ := HSTRING()
        result := ComCall(6, this, "int", readingType, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {Integer} readingType 
     * @param {Integer} optimizationGoal 
     * @returns {HSTRING} 
     */
    GetDeviceSelectorWithSensorReadingTypeAndSensorOptimizationGoal(readingType, optimizationGoal) {
        result_ := HSTRING()
        result := ComCall(7, this, "int", readingType, "int", optimizationGoal, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {HSTRING} deviceId 
     * @returns {IAsyncOperation<OrientationSensor>} 
     */
    FromIdAsync(deviceId) {
        if(deviceId is String) {
            pin := HSTRING.Create(deviceId)
            deviceId := pin.Value
        }
        deviceId := deviceId is Win32Handle ? NumGet(deviceId, "ptr") : deviceId

        result := ComCall(8, this, "ptr", deviceId, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(OrientationSensor, operation)
    }
}
