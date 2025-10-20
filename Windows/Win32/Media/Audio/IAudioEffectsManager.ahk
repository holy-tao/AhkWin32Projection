#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/audioclient/nn-audioclient-iaudioeffectsmanager
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
     * 
     * @param {IAudioEffectsChangedNotificationClient} client 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/audioclient/nf-audioclient-iaudioeffectsmanager-registeraudioeffectschangednotificationcallback
     */
    RegisterAudioEffectsChangedNotificationCallback(client) {
        result := ComCall(3, this, "ptr", client, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IAudioEffectsChangedNotificationClient} client 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/audioclient/nf-audioclient-iaudioeffectsmanager-unregisteraudioeffectschangednotificationcallback
     */
    UnregisterAudioEffectsChangedNotificationCallback(client) {
        result := ComCall(4, this, "ptr", client, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<AUDIO_EFFECT>>} effects 
     * @param {Pointer<Integer>} numEffects 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/audioclient/nf-audioclient-iaudioeffectsmanager-getaudioeffects
     */
    GetAudioEffects(effects, numEffects) {
        result := ComCall(5, this, "ptr*", effects, "uint*", numEffects, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Guid} effectId 
     * @param {Integer} state 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/audioclient/nf-audioclient-iaudioeffectsmanager-setaudioeffectstate
     */
    SetAudioEffectState(effectId, state) {
        result := ComCall(6, this, "ptr", effectId, "int", state, "HRESULT")
        return result
    }
}
