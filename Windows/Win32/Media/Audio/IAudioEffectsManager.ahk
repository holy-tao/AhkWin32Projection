#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class IAudioEffectsManager extends IUnknown{
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
     * 
     * @param {Pointer<IAudioEffectsChangedNotificationClient>} client 
     * @returns {HRESULT} 
     */
    RegisterAudioEffectsChangedNotificationCallback(client) {
        result := ComCall(3, this, "ptr", client, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IAudioEffectsChangedNotificationClient>} client 
     * @returns {HRESULT} 
     */
    UnregisterAudioEffectsChangedNotificationCallback(client) {
        result := ComCall(4, this, "ptr", client, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<AUDIO_EFFECT>} effects 
     * @param {Pointer<UInt32>} numEffects 
     * @returns {HRESULT} 
     */
    GetAudioEffects(effects, numEffects) {
        result := ComCall(5, this, "ptr", effects, "uint*", numEffects, "int")
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
    SetAudioEffectState(effectId, state) {
        result := ComCall(6, this, "ptr", effectId, "int", state, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
