#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IAudioSystemEffects2.ahk

/**
 * @namespace Windows.Win32.Media.Audio.Apo
 * @version v4.0.30319
 */
class IAudioSystemEffects3 extends IAudioSystemEffects2{
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
     * 
     * @param {Pointer<AUDIO_SYSTEMEFFECT>} effects 
     * @param {Pointer<UInt32>} numEffects 
     * @param {HANDLE} event 
     * @returns {HRESULT} 
     */
    GetControllableSystemEffectsList(effects, numEffects, event) {
        event := event is Win32Handle ? NumGet(event, "ptr") : event

        result := ComCall(4, this, "ptr", effects, "uint*", numEffects, "ptr", event, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} effectId 
     * @param {Integer} state 
     * @returns {HRESULT} 
     */
    SetAudioSystemEffectState(effectId, state) {
        result := ComCall(5, this, "ptr", effectId, "int", state, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
