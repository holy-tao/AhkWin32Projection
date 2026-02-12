#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Foundation\IAsyncOperation.ahk
#Include .\CustomSensor.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Sensors.Custom
 * @version WindowsRuntime 1.4
 */
class ICustomSensorStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICustomSensorStatics
     * @type {Guid}
     */
    static IID => Guid("{992052cf-f422-4c7d-836b-e7dc74a7124b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDeviceSelector", "FromIdAsync"]

    /**
     * 
     * @param {Guid} interfaceId 
     * @returns {HSTRING} 
     */
    GetDeviceSelector(interfaceId) {
        result_ := HSTRING()
        result := ComCall(6, this, "ptr", interfaceId, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {HSTRING} sensorId 
     * @returns {IAsyncOperation<CustomSensor>} 
     */
    FromIdAsync(sensorId) {
        if(sensorId is String) {
            pin := HSTRING.Create(sensorId)
            sensorId := pin.Value
        }
        sensorId := sensorId is Win32Handle ? NumGet(sensorId, "ptr") : sensorId

        result := ComCall(7, this, "ptr", sensorId, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(CustomSensor, result_)
    }
}
