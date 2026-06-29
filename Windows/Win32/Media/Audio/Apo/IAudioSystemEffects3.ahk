#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\AUDIO_SYSTEMEFFECT.ahk" { AUDIO_SYSTEMEFFECT }
#Import "..\..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\AUDIO_SYSTEMEFFECT_STATE.ahk" { AUDIO_SYSTEMEFFECT_STATE }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IAudioSystemEffects2.ahk" { IAudioSystemEffects2 }

/**
 * Implemented by clients that require an APOInitSystemEffects3 structure to be passed into the IAudioProcessingObject::Initialize method.
 * @remarks
 * For more information on the Windows 11 APIs for the Audio Processing Objects (APOs) that can ship with audio drivers, see [Windows 11 APIs for Audio Processing Objects](/windows-hardware/drivers/audio/windows-11-apis-for-audio-processing-objects).
 * @see https://learn.microsoft.com/windows/win32/api/audioengineextensionapo/nn-audioengineextensionapo-iaudiosystemeffects3
 * @namespace Windows.Win32.Media.Audio.Apo
 */
export default struct IAudioSystemEffects3 extends IAudioSystemEffects2 {
    /**
     * The interface identifier for IAudioSystemEffects3
     * @type {Guid}
     */
    static IID := Guid("{c58b31cd-fc6a-4255-bc1f-ad29bb0a4a17}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAudioSystemEffects3 interfaces
    */
    struct Vtbl extends IAudioSystemEffects2.Vtbl {
        GetControllableSystemEffectsList : IntPtr
        SetAudioSystemEffectState        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAudioSystemEffects3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Implemented by System Effects Audio Processing Object (sAPO) audio effects to allow the caller to get the current list of effects.
     * @remarks
     * For more information on the Windows 11 APIs for the Audio Processing Objects (APOs) that can ship with audio drivers, see [Windows 11 APIs for Audio Processing Objects](/windows-hardware/drivers/audio/windows-11-apis-for-audio-processing-objects).
     * @param {Pointer<Pointer<AUDIO_SYSTEMEFFECT>>} effects Receives a pointer to an array of [AUDIO_SYSTEMEFFECT_STATE](ns-audioengineextensionapo-audio_systemeffect.md) structures representing the current list of audio effects.
     * @param {Pointer<Integer>} numEffects Receives the number of **AUDIO_EFFECT** structures returned in *effects*.
     * @param {HANDLE} event The HANDLE of the event that will be signaled if the list changes.
     * @returns {HRESULT} An HRESULT.
     * @see https://learn.microsoft.com/windows/win32/api/audioengineextensionapo/nf-audioengineextensionapo-iaudiosystemeffects3-getcontrollablesystemeffectslist
     */
    GetControllableSystemEffectsList(effects, numEffects, event) {
        effectsMarshal := effects is VarRef ? "ptr*" : "ptr"
        numEffectsMarshal := numEffects is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, effectsMarshal, effects, numEffectsMarshal, numEffects, HANDLE, event, "HRESULT")
        return result
    }

    /**
     * Implemented by System Effects Audio Processing Object (sAPO) audio effects to allow the caller to set the state of effects.
     * @remarks
     * For more information on the Windows 11 APIs for the Audio Processing Objects (APOs) that can ship with audio drivers, see [Windows 11 APIs for Audio Processing Objects](/windows-hardware/drivers/audio/windows-11-apis-for-audio-processing-objects).
     * @param {Guid} effectId The GUID identifier for an audio effect. Audio effect GUIDs are defined in [ksmedia.h](/windows-hardware/drivers/audio/ksmedia-h).
     * @param {AUDIO_SYSTEMEFFECT_STATE} state A value from the [AUDIO_SYSTEMEFFECT_STATE](ne-audioengineextensionapo-audio_systemeffect_state.md) enumerating specifying the state to set.
     * @returns {HRESULT} An HRESULT.
     * @see https://learn.microsoft.com/windows/win32/api/audioengineextensionapo/nf-audioengineextensionapo-iaudiosystemeffects3-setaudiosystemeffectstate
     */
    SetAudioSystemEffectState(effectId, state) {
        result := ComCall(5, this, Guid, effectId, AUDIO_SYSTEMEFFECT_STATE, state, "HRESULT")
        return result
    }

    Query(iid) {
        if (IAudioSystemEffects3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetControllableSystemEffectsList := CallbackCreate(GetMethod(implObj, "GetControllableSystemEffectsList"), flags, 4)
        this.vtbl.SetAudioSystemEffectState := CallbackCreate(GetMethod(implObj, "SetAudioSystemEffectState"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetControllableSystemEffectsList)
        CallbackFree(this.vtbl.SetAudioSystemEffectState)
    }
}
