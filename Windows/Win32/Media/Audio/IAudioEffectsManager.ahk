#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\AUDIO_EFFECT.ahk" { AUDIO_EFFECT }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\AUDIO_EFFECT_STATE.ahk" { AUDIO_EFFECT_STATE }
#Import ".\IAudioEffectsChangedNotificationClient.ahk" { IAudioEffectsChangedNotificationClient }

/**
 * Provides management functionality for the audio effects pipeline
 * @remarks
 * Get an instance of this interface by calling [IAudioClient::GetService](nf-audioclient-iaudioclient-getservice.md) passing in the interface pointer of the **IAudioEffectsManager** interface.
 * 
 * ```cpp
 * wil::com_ptr_nothrow<IAudioEffectsManager> audioEffectsManager;
 * RETURN_IF_FAILED(client->GetService(IID_PPV_ARGS(&audioEffectsManager)));
 * ```
 * @see https://learn.microsoft.com/windows/win32/api/audioclient/nn-audioclient-iaudioeffectsmanager
 * @namespace Windows.Win32.Media.Audio
 */
export default struct IAudioEffectsManager extends IUnknown {
    /**
     * The interface identifier for IAudioEffectsManager
     * @type {Guid}
     */
    static IID := Guid("{4460b3ae-4b44-4527-8676-7548a8acd260}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAudioEffectsManager interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        RegisterAudioEffectsChangedNotificationCallback   : IntPtr
        UnregisterAudioEffectsChangedNotificationCallback : IntPtr
        GetAudioEffects                                   : IntPtr
        SetAudioEffectState                               : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAudioEffectsManager.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Registers an AudioEffectsChangedNotificationClient interface.
     * @remarks
     * Unregister the callback interface by calling [UnregisterAudioEffectsChangedNotificationCallback](nf-audioclient-iaudioeffectsmanager-unregisteraudioeffectschangednotificationcallback.md).
     * @param {IAudioEffectsChangedNotificationClient} client The **IAudioEffectsChangedNotificationClient** interface to register.
     * @returns {HRESULT} | Value | Description |
     * |-------|-------------|
     * | S_OK  | Success     |
     * | AUDCLNT_E_DEVICE_INVALIDATED | The associated audio stream has been destroyed. |
     * @see https://learn.microsoft.com/windows/win32/api/audioclient/nf-audioclient-iaudioeffectsmanager-registeraudioeffectschangednotificationcallback
     */
    RegisterAudioEffectsChangedNotificationCallback(client) {
        result := ComCall(3, this, "ptr", client, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/audioclient/nf-audioclient-iaudioeffectsmanager-unregisteraudioeffectschangednotificationcallback
     */
    UnregisterAudioEffectsChangedNotificationCallback(client) {
        result := ComCall(4, this, "ptr", client, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/audioclient/nf-audioclient-iaudioeffectsmanager-getaudioeffects
     */
    GetAudioEffects(numEffects) {
        numEffectsMarshal := numEffects is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "ptr*", &effects := 0, numEffectsMarshal, numEffects, "HRESULT")
        return effects
    }

    /**
     * The IAudioEffectsManager::SetAudioEffectState method (audioclient.h) sets the state of the specified audio effect.
     * @remarks
     * Get the current list of audio effects for the associated audio stream by calling [GetAudioEffects](nf-audioclient-iaudioeffectsmanager-setaudioeffectstate.md).
     * @param {Guid} effectId The GUID identifier of the effect for which the state is being changed. Audio effect GUIDs are defined in [ksmedia.h](/windows-hardware/drivers/audio/ksmedia-h).
     * @param {AUDIO_EFFECT_STATE} state A value from the [AUDIO_EFFECT_STATE](ne-audioclient-audio_effect_state.md) enumerating specifying the state to set.
     * @returns {HRESULT} Returns an HRESULT including but not limited to the following.
     * 
     * | Value | Description |
     * |-------|-------------|
     * | S_OK  | Success     |
     * | AUDCLNT_E_EFFECT_NOT_AVAILABLE | The specifed effect is not available |
     * | AUDCLNT_E_EFFECT_STATE_READ_ONLY | The specified effect has a state that is read-only |
     * | AUDCLNT_E_DEVICE_INVALIDATED | The associated audio stream has been destroyed. |
     * @see https://learn.microsoft.com/windows/win32/api/audioclient/nf-audioclient-iaudioeffectsmanager-setaudioeffectstate
     */
    SetAudioEffectState(effectId, state) {
        result := ComCall(6, this, Guid, effectId, AUDIO_EFFECT_STATE, state, "HRESULT")
        return result
    }

    Query(iid) {
        if (IAudioEffectsManager.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.RegisterAudioEffectsChangedNotificationCallback := CallbackCreate(GetMethod(implObj, "RegisterAudioEffectsChangedNotificationCallback"), flags, 2)
        this.vtbl.UnregisterAudioEffectsChangedNotificationCallback := CallbackCreate(GetMethod(implObj, "UnregisterAudioEffectsChangedNotificationCallback"), flags, 2)
        this.vtbl.GetAudioEffects := CallbackCreate(GetMethod(implObj, "GetAudioEffects"), flags, 3)
        this.vtbl.SetAudioEffectState := CallbackCreate(GetMethod(implObj, "SetAudioEffectState"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.RegisterAudioEffectsChangedNotificationCallback)
        CallbackFree(this.vtbl.UnregisterAudioEffectsChangedNotificationCallback)
        CallbackFree(this.vtbl.GetAudioEffects)
        CallbackFree(this.vtbl.SetAudioEffectState)
    }
}
