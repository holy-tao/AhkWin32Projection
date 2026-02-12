#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Foundation\IAsyncOperation.ahk
#Include .\SecondaryAuthenticationFactorRegistrationResult.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Foundation\Collections\IVectorView.ahk
#Include .\SecondaryAuthenticationFactorInfo.ahk
#Include ..\..\..\..\Foundation\IAsyncAction.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Authentication.Identity.Provider
 * @version WindowsRuntime 1.4
 */
class ISecondaryAuthenticationFactorRegistrationStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISecondaryAuthenticationFactorRegistrationStatics
     * @type {Guid}
     */
    static IID => Guid("{1adf0f65-e3b7-4155-997f-b756ef65beba}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RequestStartRegisteringDeviceAsync", "FindAllRegisteredDeviceInfoAsync", "UnregisterDeviceAsync", "UpdateDeviceConfigurationDataAsync"]

    /**
     * 
     * @param {HSTRING} deviceId 
     * @param {Integer} capabilities 
     * @param {HSTRING} deviceFriendlyName 
     * @param {HSTRING} deviceModelNumber 
     * @param {IBuffer} deviceKey 
     * @param {IBuffer} mutualAuthenticationKey 
     * @returns {IAsyncOperation<SecondaryAuthenticationFactorRegistrationResult>} 
     */
    RequestStartRegisteringDeviceAsync(deviceId, capabilities, deviceFriendlyName, deviceModelNumber, deviceKey, mutualAuthenticationKey) {
        if(deviceId is String) {
            pin := HSTRING.Create(deviceId)
            deviceId := pin.Value
        }
        deviceId := deviceId is Win32Handle ? NumGet(deviceId, "ptr") : deviceId
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

        result := ComCall(6, this, "ptr", deviceId, "uint", capabilities, "ptr", deviceFriendlyName, "ptr", deviceModelNumber, "ptr", deviceKey, "ptr", mutualAuthenticationKey, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(SecondaryAuthenticationFactorRegistrationResult, operation)
    }

    /**
     * 
     * @param {Integer} queryType 
     * @returns {IAsyncOperation<IVectorView<SecondaryAuthenticationFactorInfo>>} 
     */
    FindAllRegisteredDeviceInfoAsync(queryType) {
        result := ComCall(7, this, "int", queryType, "ptr*", &deviceInfoList := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, SecondaryAuthenticationFactorInfo), deviceInfoList)
    }

    /**
     * 
     * @param {HSTRING} deviceId 
     * @returns {IAsyncAction} 
     */
    UnregisterDeviceAsync(deviceId) {
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
     * @param {HSTRING} deviceId 
     * @param {IBuffer} deviceConfigurationData 
     * @returns {IAsyncAction} 
     */
    UpdateDeviceConfigurationDataAsync(deviceId, deviceConfigurationData) {
        if(deviceId is String) {
            pin := HSTRING.Create(deviceId)
            deviceId := pin.Value
        }
        deviceId := deviceId is Win32Handle ? NumGet(deviceId, "ptr") : deviceId

        result := ComCall(9, this, "ptr", deviceId, "ptr", deviceConfigurationData, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(result_)
    }
}
