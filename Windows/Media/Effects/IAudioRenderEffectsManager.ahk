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
class IAudioRenderEffectsManager extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAudioRenderEffectsManager
     * @type {Guid}
     */
    static IID => Guid("{4dc98966-8751-42b2-bfcb-39ca7864bd47}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["add_AudioRenderEffectsChanged", "remove_AudioRenderEffectsChanged", "GetAudioRenderEffects"]

    /**
     * 
     * @param {TypedEventHandler<AudioRenderEffectsManager, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_AudioRenderEffectsChanged(handler) {
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
    remove_AudioRenderEffectsChanged(token) {
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
    GetAudioRenderEffects() {
        result := ComCall(8, this, "ptr*", &effects := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(AudioEffect, effects)
    }
}
