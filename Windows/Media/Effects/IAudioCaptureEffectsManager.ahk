#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\AudioEffect.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Effects
 * @version WindowsRuntime 1.4
 */
class IAudioCaptureEffectsManager extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAudioCaptureEffectsManager
     * @type {Guid}
     */
    static IID => Guid("{8f85c271-038d-4393-8298-540110608eef}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["add_AudioCaptureEffectsChanged", "remove_AudioCaptureEffectsChanged", "GetAudioCaptureEffects"]

    /**
     * 
     * @param {TypedEventHandler<AudioCaptureEffectsManager, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_AudioCaptureEffectsChanged(handler) {
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
    remove_AudioCaptureEffectsChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(7, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IVectorView<AudioEffect>} 
     */
    GetAudioCaptureEffects() {
        result := ComCall(8, this, "ptr*", &effects := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(AudioEffect, effects)
    }
}
