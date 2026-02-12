#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides management functionality for the audio effects pipeline
 * @remarks
 * Get an instance of this interface by calling [IAudioClient::GetService](nf-audioclient-iaudioclient-getservice.md) passing in the interface pointer of the **IAudioEffectsManager** interface.
 * 
 * ```cpp
 * wil::com_ptr_nothrow<IAudioEffectsManager> audioEffectsManager;
 * RETURN_IF_FAILED(client->GetService(IID_PPV_ARGS(&audioEffectsManager)));
 * ```
 * @see https://learn.microsoft.com/windows/win32/api//content/audioclient/nn-audioclient-iaudioeffectsmanager
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class IAudioEffectsManager extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAudioEffectsManager
     * @type {Guid}
     */
    static IID => Guid("{4460b3ae-4b44-4527-8676-7548a8acd260}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RegisterAudioEffectsChangedNotificationCallback", "UnregisterAudioEffectsChangedNotificationCallback", "GetAudioEffects", "SetAudioEffectState"]

    /**
     * Registers an AudioEffectsChangedNotificationClient interface.
     * @remarks
     * Unregister the callback interface by calling [UnregisterAudioEffectsChangedNotificationCallback](nf-audioclient-iaudioeffectsmanager-unregisteraudioeffectschangednotificationcallback.md).
     * @param {IAudioEffectsChangedNotificationClient} client The **IAudioEffectsChangedNotificationClient** interface to register.
     * @returns {HRESULT} | Value | Description |
     * |-------|-------------|
     * | S_OK  | Success     |
     * | AUDCLNT_E_DEVICE_INVALIDATED | The associated audio stream has been destroyed. |
     * @see https://learn.microsoft.com/windows/win32/api//content/audioclient/nf-audioclient-iaudioeffectsmanager-registeraudioeffectschangednotificationcallback
     */
    RegisterAudioEffectsChangedNotificationCallback(client) {
        result := ComCall(3, this, "ptr", client, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Unregisters an IAudioEffectsChangedNotificationClient interface.
     * @remarks
     * Register the callback interface by calling [RegisterAudioEffectsChangedNotificationCallback](nf-audioclient-iaudioeffectsmanager-registeraudioeffectschangednotificationcallback.md).
     * @param {IAudioEffectsChangedNotificationClient} client The **IAudioEffectsChangedNotificationClient** interface to unregister.
     * @returns {HRESULT} | Value | Description |
     * |-------|-------------|
     * | S_OK  | Success     |
     * | AUDCLNT_E_DEVICE_INVALIDATED | The associated audio stream has been destroyed. |
     * @see https://learn.microsoft.com/windows/win32/api//content/audioclient/nf-audioclient-iaudioeffectsmanager-unregisteraudioeffectschangednotificationcallback
     */
    UnregisterAudioEffectsChangedNotificationCallback(client) {
        result := ComCall(4, this, "ptr", client, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets the current list of audio effects for the associated audio stream.
     * @remarks
     * The caller is responsible for freeing the array using [CoTaskMemFree](../combaseapi/nf-combaseapi-cotaskmemfree.md).
     * 
     * Register an [IAudioEffectsChangedNotificationClient](nn-audioclient-iaudioeffectschangednotificationclient.md) to receive notifications when the list of audio effects changes.
     * @param {Pointer<Integer>} numEffects Receives the number of **AUDIO_EFFECT** structures returned in *effects*.
     * @returns {Pointer<AUDIO_EFFECT>} Receives a pointer to an array of [AUDIO_EFFECT](ns-audioclient-audio_effect.md) structures representing the current list of audio effects.
     * @see https://learn.microsoft.com/windows/win32/api//content/audioclient/nf-audioclient-iaudioeffectsmanager-getaudioeffects
     */
    GetAudioEffects(numEffects) {
        numEffectsMarshal := numEffects is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "ptr*", &effects := 0, numEffectsMarshal, numEffects, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return effects
    }

    /**
     * The IAudioEffectsManager::SetAudioEffectState method (audioclient.h) sets the state of the specified audio effect.
     * @remarks
     * Get the current list of audio effects for the associated audio stream by calling [GetAudioEffects](nf-audioclient-iaudioeffectsmanager-setaudioeffectstate.md).
     * @param {Guid} effectId The GUID identifier of the effect for which the state is being changed. Audio effect GUIDs are defined in [ksmedia.h](/windows-hardware/drivers/audio/ksmedia-h).
     * @param {Integer} state A value from the [AUDIO_EFFECT_STATE](ne-audioclient-audio_effect_state.md) enumerating specifying the state to set.
     * @returns {HRESULT} Returns an HRESULT including but not limited to the following.
     * 
     * | Value | Description |
     * |-------|-------------|
     * | S_OK  | Success     |
     * | AUDCLNT_E_EFFECT_NOT_AVAILABLE | The specifed effect is not available |
     * | AUDCLNT_E_EFFECT_STATE_READ_ONLY | The specified effect has a state that is read-only |
     * | AUDCLNT_E_DEVICE_INVALIDATED | The associated audio stream has been destroyed. |
     * @see https://learn.microsoft.com/windows/win32/api//content/audioclient/nf-audioclient-iaudioeffectsmanager-setaudioeffectstate
     */
    SetAudioEffectState(effectId, state) {
        result := ComCall(6, this, "ptr", effectId, "int", state, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
