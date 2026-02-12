#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\HingeAngleSensor.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class IHingeAngleSensorStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHingeAngleSensorStatics
     * @type {Guid}
     */
    static IID => Guid("{b7b63910-fbb1-4123-89ce-4ea34eb0dfca}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDeviceSelector", "GetDefaultAsync", "GetRelatedToAdjacentPanelsAsync", "FromIdAsync"]

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
     * @returns {IAsyncOperation<HingeAngleSensor>} 
     */
    GetDefaultAsync() {
        result := ComCall(7, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(HingeAngleSensor, result_)
    }

    /**
     * 
     * @param {HSTRING} firstPanelId 
     * @param {HSTRING} secondPanelId 
     * @returns {IAsyncOperation<HingeAngleSensor>} 
     */
    GetRelatedToAdjacentPanelsAsync(firstPanelId, secondPanelId) {
        if(firstPanelId is String) {
            pin := HSTRING.Create(firstPanelId)
            firstPanelId := pin.Value
        }
        firstPanelId := firstPanelId is Win32Handle ? NumGet(firstPanelId, "ptr") : firstPanelId
        if(secondPanelId is String) {
            pin := HSTRING.Create(secondPanelId)
            secondPanelId := pin.Value
        }
        secondPanelId := secondPanelId is Win32Handle ? NumGet(secondPanelId, "ptr") : secondPanelId

        result := ComCall(8, this, "ptr", firstPanelId, "ptr", secondPanelId, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(HingeAngleSensor, result_)
    }

    /**
     * 
     * @param {HSTRING} deviceId 
     * @returns {IAsyncOperation<HingeAngleSensor>} 
     */
    FromIdAsync(deviceId) {
        if(deviceId is String) {
            pin := HSTRING.Create(deviceId)
            deviceId := pin.Value
        }
        deviceId := deviceId is Win32Handle ? NumGet(deviceId, "ptr") : deviceId

        result := ComCall(9, this, "ptr", deviceId, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(HingeAngleSensor, result_)
    }
}
