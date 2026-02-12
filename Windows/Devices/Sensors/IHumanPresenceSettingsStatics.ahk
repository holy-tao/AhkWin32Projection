#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\HumanPresenceSettings.ahk
#Include ..\..\Foundation\IAsyncAction.ahk
#Include .\HumanPresenceFeatures.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class IHumanPresenceSettingsStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHumanPresenceSettingsStatics
     * @type {Guid}
     */
    static IID => Guid("{7f343202-e010-52c4-af0c-04a8f1e033da}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCurrentSettingsAsync", "GetCurrentSettings", "UpdateSettingsAsync", "UpdateSettings", "GetSupportedFeaturesForSensorIdAsync", "GetSupportedFeaturesForSensorId", "GetSupportedLockOnLeaveTimeouts", "add_SettingsChanged", "remove_SettingsChanged"]

    /**
     * 
     * @returns {IAsyncOperation<HumanPresenceSettings>} 
     */
    GetCurrentSettingsAsync() {
        result := ComCall(6, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(HumanPresenceSettings, operation)
    }

    /**
     * 
     * @returns {HumanPresenceSettings} 
     */
    GetCurrentSettings() {
        result := ComCall(7, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HumanPresenceSettings(result_)
    }

    /**
     * 
     * @param {HumanPresenceSettings} settings 
     * @returns {IAsyncAction} 
     */
    UpdateSettingsAsync(settings) {
        result := ComCall(8, this, "ptr", settings, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }

    /**
     * 
     * @param {HumanPresenceSettings} settings 
     * @returns {HRESULT} 
     */
    UpdateSettings(settings) {
        result := ComCall(9, this, "ptr", settings, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} sensorId 
     * @returns {IAsyncOperation<HumanPresenceFeatures>} 
     */
    GetSupportedFeaturesForSensorIdAsync(sensorId) {
        if(sensorId is String) {
            pin := HSTRING.Create(sensorId)
            sensorId := pin.Value
        }
        sensorId := sensorId is Win32Handle ? NumGet(sensorId, "ptr") : sensorId

        result := ComCall(10, this, "ptr", sensorId, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(HumanPresenceFeatures, operation)
    }

    /**
     * 
     * @param {HSTRING} sensorId 
     * @returns {HumanPresenceFeatures} 
     */
    GetSupportedFeaturesForSensorId(sensorId) {
        if(sensorId is String) {
            pin := HSTRING.Create(sensorId)
            sensorId := pin.Value
        }
        sensorId := sensorId is Win32Handle ? NumGet(sensorId, "ptr") : sensorId

        result := ComCall(11, this, "ptr", sensorId, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HumanPresenceFeatures(result_)
    }

    /**
     * 
     * @returns {IVectorView<TimeSpan>} 
     */
    GetSupportedLockOnLeaveTimeouts() {
        result := ComCall(12, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => IPropertyValue(ptr).GetTimeSpan(), result_)
    }

    /**
     * 
     * @param {EventHandler<IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_SettingsChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(13, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_SettingsChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(14, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
