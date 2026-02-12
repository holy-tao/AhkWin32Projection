#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Foundation\IAsyncAction.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Authentication.Identity.Provider
 * @version WindowsRuntime 1.4
 */
class ISecondaryAuthenticationFactorDevicePresenceMonitoringRegistrationStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISecondaryAuthenticationFactorDevicePresenceMonitoringRegistrationStatics
     * @type {Guid}
     */
    static IID => Guid("{90499a19-7ef2-4523-951c-a417a24acf93}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RegisterDevicePresenceMonitoringAsync", "RegisterDevicePresenceMonitoringWithNewDeviceAsync", "UnregisterDevicePresenceMonitoringAsync", "IsDevicePresenceMonitoringSupported"]

    /**
     * 
     * @param {HSTRING} deviceId 
     * @param {HSTRING} deviceInstancePath 
     * @param {Integer} monitoringMode 
     * @returns {IAsyncOperation<Integer>} 
     */
    RegisterDevicePresenceMonitoringAsync(deviceId, deviceInstancePath, monitoringMode) {
        if(deviceId is String) {
            pin := HSTRING.Create(deviceId)
            deviceId := pin.Value
        }
        deviceId := deviceId is Win32Handle ? NumGet(deviceId, "ptr") : deviceId
        if(deviceInstancePath is String) {
            pin := HSTRING.Create(deviceInstancePath)
            deviceInstancePath := pin.Value
        }
        deviceInstancePath := deviceInstancePath is Win32Handle ? NumGet(deviceInstancePath, "ptr") : deviceInstancePath

        result := ComCall(6, this, "ptr", deviceId, "ptr", deviceInstancePath, "int", monitoringMode, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), operation)
    }

    /**
     * 
     * @param {HSTRING} deviceId 
     * @param {HSTRING} deviceInstancePath 
     * @param {Integer} monitoringMode 
     * @param {HSTRING} deviceFriendlyName 
     * @param {HSTRING} deviceModelNumber 
     * @param {IBuffer} deviceConfigurationData 
     * @returns {IAsyncOperation<Integer>} 
     */
    RegisterDevicePresenceMonitoringWithNewDeviceAsync(deviceId, deviceInstancePath, monitoringMode, deviceFriendlyName, deviceModelNumber, deviceConfigurationData) {
        if(deviceId is String) {
            pin := HSTRING.Create(deviceId)
            deviceId := pin.Value
        }
        deviceId := deviceId is Win32Handle ? NumGet(deviceId, "ptr") : deviceId
        if(deviceInstancePath is String) {
            pin := HSTRING.Create(deviceInstancePath)
            deviceInstancePath := pin.Value
        }
        deviceInstancePath := deviceInstancePath is Win32Handle ? NumGet(deviceInstancePath, "ptr") : deviceInstancePath
        if(deviceFriendlyName is String) {
            pin := HSTRING.Create(deviceFriendlyName)
            deviceFriendlyName := pin.Value
        }
        deviceFriendlyName := deviceFriendlyName is Win32Handle ? NumGet(deviceFriendlyName, "ptr") : deviceFriendlyName
        if(deviceModelNumber is String) {
            pin := HSTRING.Create(deviceModelNumber)
            deviceModelNumber := pin.Value
        }
        deviceModelNumber := deviceModelNumber is Win32Handle ? NumGet(deviceModelNumber, "ptr") : deviceModelNumber

        result := ComCall(7, this, "ptr", deviceId, "ptr", deviceInstancePath, "int", monitoringMode, "ptr", deviceFriendlyName, "ptr", deviceModelNumber, "ptr", deviceConfigurationData, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), operation)
    }

    /**
     * 
     * @param {HSTRING} deviceId 
     * @returns {IAsyncAction} 
     */
    UnregisterDevicePresenceMonitoringAsync(deviceId) {
        if(deviceId is String) {
            pin := HSTRING.Create(deviceId)
            deviceId := pin.Value
        }
        deviceId := deviceId is Win32Handle ? NumGet(deviceId, "ptr") : deviceId

        result := ComCall(8, this, "ptr", deviceId, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(result_)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    IsDevicePresenceMonitoringSupported() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
