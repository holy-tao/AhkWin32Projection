#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\AudioEffectsPackConfiguration.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Audio
 * @version WindowsRuntime 1.4
 */
class IAudioEffectsPackConfigurationStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAudioEffectsPackConfigurationStatics
     * @type {Guid}
     */
    static IID => Guid("{61c20413-530c-55ff-ba2b-8e68a9b56a04}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetForDeviceId", "IsDeviceIdSupported"]

    /**
     * 
     * @param {HSTRING} effectsPackId 
     * @param {HSTRING} deviceId 
     * @returns {AudioEffectsPackConfiguration} 
     */
    GetForDeviceId(effectsPackId, deviceId) {
        if(effectsPackId is String) {
            pin := HSTRING.Create(effectsPackId)
            effectsPackId := pin.Value
        }
        effectsPackId := effectsPackId is Win32Handle ? NumGet(effectsPackId, "ptr") : effectsPackId
        if(deviceId is String) {
            pin := HSTRING.Create(deviceId)
            deviceId := pin.Value
        }
        deviceId := deviceId is Win32Handle ? NumGet(deviceId, "ptr") : deviceId

        result := ComCall(6, this, "ptr", effectsPackId, "ptr", deviceId, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AudioEffectsPackConfiguration(result_)
    }

    /**
     * 
     * @param {HSTRING} effectsPackId 
     * @param {HSTRING} deviceId 
     * @returns {Boolean} 
     */
    IsDeviceIdSupported(effectsPackId, deviceId) {
        if(effectsPackId is String) {
            pin := HSTRING.Create(effectsPackId)
            effectsPackId := pin.Value
        }
        effectsPackId := effectsPackId is Win32Handle ? NumGet(effectsPackId, "ptr") : effectsPackId
        if(deviceId is String) {
            pin := HSTRING.Create(deviceId)
            deviceId := pin.Value
        }
        deviceId := deviceId is Win32Handle ? NumGet(deviceId, "ptr") : deviceId

        result := ComCall(7, this, "ptr", effectsPackId, "ptr", deviceId, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}
