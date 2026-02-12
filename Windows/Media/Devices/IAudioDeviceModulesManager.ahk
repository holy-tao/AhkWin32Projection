#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\AudioDeviceModule.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Devices
 * @version WindowsRuntime 1.4
 */
class IAudioDeviceModulesManager extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAudioDeviceModulesManager
     * @type {Guid}
     */
    static IID => Guid("{6aa40c4d-960a-4d1c-b318-0022604547ed}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["add_ModuleNotificationReceived", "remove_ModuleNotificationReceived", "FindAllById", "FindAll"]

    /**
     * 
     * @param {TypedEventHandler<AudioDeviceModulesManager, AudioDeviceModuleNotificationEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ModuleNotificationReceived(handler) {
        token := EventRegistrationToken()
        result := ComCall(6, this, "ptr", handler, "ptr", token, "int")
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
    remove_ModuleNotificationReceived(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(7, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} moduleId 
     * @returns {IVectorView<AudioDeviceModule>} 
     */
    FindAllById(moduleId) {
        if(moduleId is String) {
            pin := HSTRING.Create(moduleId)
            moduleId := pin.Value
        }
        moduleId := moduleId is Win32Handle ? NumGet(moduleId, "ptr") : moduleId

        result := ComCall(8, this, "ptr", moduleId, "ptr*", &modules := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(AudioDeviceModule, modules)
    }

    /**
     * 
     * @returns {IVectorView<AudioDeviceModule>} 
     */
    FindAll() {
        result := ComCall(9, this, "ptr*", &modules := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(AudioDeviceModule, modules)
    }
}
