#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IAudioSystemEffects2.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/audioengineextensionapo/nn-audioengineextensionapo-iaudiosystemeffects3
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
     * 
     * @param {Pointer<Pointer<AUDIO_SYSTEMEFFECT>>} effects 
     * @param {Pointer<Integer>} numEffects 
     * @param {HANDLE} event 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/audioengineextensionapo/nf-audioengineextensionapo-iaudiosystemeffects3-getcontrollablesystemeffectslist
     */
    GetControllableSystemEffectsList(effects, numEffects, event) {
        event := event is Win32Handle ? NumGet(event, "ptr") : event

        result := ComCall(4, this, "ptr*", effects, "uint*", numEffects, "ptr", event, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Guid} effectId 
     * @param {Integer} state 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/audioengineextensionapo/nf-audioengineextensionapo-iaudiosystemeffects3-setaudiosystemeffectstate
     */
    SetAudioSystemEffectState(effectId, state) {
        result := ComCall(5, this, "ptr", effectId, "int", state, "HRESULT")
        return result
    }
}
