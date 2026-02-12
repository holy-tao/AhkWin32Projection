#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\AudioRenderEffectsManager.ahk
#Include .\AudioCaptureEffectsManager.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Effects
 * @version WindowsRuntime 1.4
 */
class IAudioEffectsManagerStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAudioEffectsManagerStatics
     * @type {Guid}
     */
    static IID => Guid("{66406c04-86fa-47cc-a315-f489d8c3fe10}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateAudioRenderEffectsManager", "CreateAudioRenderEffectsManagerWithMode", "CreateAudioCaptureEffectsManager", "CreateAudioCaptureEffectsManagerWithMode"]

    /**
     * 
     * @param {HSTRING} deviceId 
     * @param {Integer} category 
     * @returns {AudioRenderEffectsManager} 
     */
    CreateAudioRenderEffectsManager(deviceId, category) {
        if(deviceId is String) {
            pin := HSTRING.Create(deviceId)
            deviceId := pin.Value
        }
        deviceId := deviceId is Win32Handle ? NumGet(deviceId, "ptr") : deviceId

        result := ComCall(6, this, "ptr", deviceId, "int", category, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AudioRenderEffectsManager(value)
    }

    /**
     * 
     * @param {HSTRING} deviceId 
     * @param {Integer} category 
     * @param {Integer} mode_ 
     * @returns {AudioRenderEffectsManager} 
     */
    CreateAudioRenderEffectsManagerWithMode(deviceId, category, mode_) {
        if(deviceId is String) {
            pin := HSTRING.Create(deviceId)
            deviceId := pin.Value
        }
        deviceId := deviceId is Win32Handle ? NumGet(deviceId, "ptr") : deviceId

        result := ComCall(7, this, "ptr", deviceId, "int", category, "int", mode_, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AudioRenderEffectsManager(value)
    }

    /**
     * 
     * @param {HSTRING} deviceId 
     * @param {Integer} category 
     * @returns {AudioCaptureEffectsManager} 
     */
    CreateAudioCaptureEffectsManager(deviceId, category) {
        if(deviceId is String) {
            pin := HSTRING.Create(deviceId)
            deviceId := pin.Value
        }
        deviceId := deviceId is Win32Handle ? NumGet(deviceId, "ptr") : deviceId

        result := ComCall(8, this, "ptr", deviceId, "int", category, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AudioCaptureEffectsManager(value)
    }

    /**
     * 
     * @param {HSTRING} deviceId 
     * @param {Integer} category 
     * @param {Integer} mode_ 
     * @returns {AudioCaptureEffectsManager} 
     */
    CreateAudioCaptureEffectsManagerWithMode(deviceId, category, mode_) {
        if(deviceId is String) {
            pin := HSTRING.Create(deviceId)
            deviceId := pin.Value
        }
        deviceId := deviceId is Win32Handle ? NumGet(deviceId, "ptr") : deviceId

        result := ComCall(9, this, "ptr", deviceId, "int", category, "int", mode_, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AudioCaptureEffectsManager(value)
    }
}
