#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\HumanPresenceSensor.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class IHumanPresenceSensorStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHumanPresenceSensorStatics
     * @type {Guid}
     */
    static IID => Guid("{2ae89842-dba9-56b2-9f27-eac69d621004}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDeviceSelector", "FromIdAsync", "GetDefaultAsync"]

    /**
     * 
     * @returns {HSTRING} 
     */
    GetDeviceSelector() {
        result_ := HSTRING()
        result := ComCall(6, this, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {HSTRING} sensorId 
     * @returns {IAsyncOperation<HumanPresenceSensor>} 
     */
    FromIdAsync(sensorId) {
        if(sensorId is String) {
            pin := HSTRING.Create(sensorId)
            sensorId := pin.Value
        }
        sensorId := sensorId is Win32Handle ? NumGet(sensorId, "ptr") : sensorId

        result := ComCall(7, this, "ptr", sensorId, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(HumanPresenceSensor, operation)
    }

    /**
     * 
     * @returns {IAsyncOperation<HumanPresenceSensor>} 
     */
    GetDefaultAsync() {
        result := ComCall(8, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(HumanPresenceSensor, operation)
    }
}
