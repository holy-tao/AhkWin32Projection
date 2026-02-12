#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IAudioSystemEffects2.ahk

/**
 * Implemented by clients that require an APOInitSystemEffects3 structure to be passed into the IAudioProcessingObject::Initialize method.
 * @remarks
 * For more information on the Windows 11 APIs for the Audio Processing Objects (APOs) that can ship with audio drivers, see [Windows 11 APIs for Audio Processing Objects](/windows-hardware/drivers/audio/windows-11-apis-for-audio-processing-objects).
 * @see https://learn.microsoft.com/windows/win32/api//content/audioengineextensionapo/nn-audioengineextensionapo-iaudiosystemeffects3
 * @namespace Windows.Win32.Media.Audio.Apo
 * @version v4.0.30319
 */
class IAudioSystemEffects3 extends IAudioSystemEffects2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAudioSystemEffects3
     * @type {Guid}
     */
    static IID => Guid("{c58b31cd-fc6a-4255-bc1f-ad29bb0a4a17}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetControllableSystemEffectsList", "SetAudioSystemEffectState"]

    /**
     * Implemented by System Effects Audio Processing Object (sAPO) audio effects to allow the caller to get the current list of effects.
     * @remarks
     * For more information on the Windows 11 APIs for the Audio Processing Objects (APOs) that can ship with audio drivers, see [Windows 11 APIs for Audio Processing Objects](/windows-hardware/drivers/audio/windows-11-apis-for-audio-processing-objects).
     * @param {Pointer<Pointer<AUDIO_SYSTEMEFFECT>>} effects Receives a pointer to an array of [AUDIO_SYSTEMEFFECT_STATE](ns-audioengineextensionapo-audio_systemeffect.md) structures representing the current list of audio effects.
     * @param {Pointer<Integer>} numEffects Receives the number of **AUDIO_EFFECT** structures returned in *effects*.
     * @param {HANDLE} event The HANDLE of the event that will be signaled if the list changes.
     * @returns {HRESULT} An HRESULT.
     * @see https://learn.microsoft.com/windows/win32/api//content/audioengineextensionapo/nf-audioengineextensionapo-iaudiosystemeffects3-getcontrollablesystemeffectslist
     */
    GetControllableSystemEffectsList(effects, numEffects, event) {
        event := event is Win32Handle ? NumGet(event, "ptr") : event

        effectsMarshal := effects is VarRef ? "ptr*" : "ptr"
        numEffectsMarshal := numEffects is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, effectsMarshal, effects, numEffectsMarshal, numEffects, "ptr", event, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Implemented by System Effects Audio Processing Object (sAPO) audio effects to allow the caller to set the state of effects.
     * @remarks
     * For more information on the Windows 11 APIs for the Audio Processing Objects (APOs) that can ship with audio drivers, see [Windows 11 APIs for Audio Processing Objects](/windows-hardware/drivers/audio/windows-11-apis-for-audio-processing-objects).
     * @param {Guid} effectId The GUID identifier for an audio effect. Audio effect GUIDs are defined in [ksmedia.h](/windows-hardware/drivers/audio/ksmedia-h).
     * @param {Integer} state A value from the [AUDIO_SYSTEMEFFECT_STATE](ne-audioengineextensionapo-audio_systemeffect_state.md) enumerating specifying the state to set.
     * @returns {HRESULT} An HRESULT.
     * @see https://learn.microsoft.com/windows/win32/api//content/audioengineextensionapo/nf-audioengineextensionapo-iaudiosystemeffects3-setaudiosystemeffectstate
     */
    SetAudioSystemEffectState(effectId, state) {
        result := ComCall(5, this, "ptr", effectId, "int", state, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
