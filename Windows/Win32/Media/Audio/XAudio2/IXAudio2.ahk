#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.Audio.XAudio2
 * @version v4.0.30319
 */
class IXAudio2 extends IUnknown{
    /**
     * The interface identifier for IXAudio2
     * @type {Guid}
     */
    static IID => Guid("{2b02e3cf-2e0b-4ec3-be45-1b2a3fe7210d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IXAudio2EngineCallback>} pCallback 
     * @returns {HRESULT} 
     */
    RegisterForCallbacks(pCallback) {
        result := ComCall(3, this, "ptr", pCallback, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IXAudio2EngineCallback>} pCallback 
     * @returns {String} Nothing - always returns an empty string
     */
    UnregisterForCallbacks(pCallback) {
        ComCall(4, this, "ptr", pCallback)
        return result
    }

    /**
     * 
     * @param {Pointer<IXAudio2SourceVoice>} ppSourceVoice 
     * @param {Pointer<WAVEFORMATEX>} pSourceFormat 
     * @param {Integer} Flags 
     * @param {Float} MaxFrequencyRatio 
     * @param {Pointer<IXAudio2VoiceCallback>} pCallback 
     * @param {Pointer<XAUDIO2_VOICE_SENDS>} pSendList 
     * @param {Pointer<XAUDIO2_EFFECT_CHAIN>} pEffectChain 
     * @returns {HRESULT} 
     */
    CreateSourceVoice(ppSourceVoice, pSourceFormat, Flags, MaxFrequencyRatio, pCallback, pSendList, pEffectChain) {
        result := ComCall(5, this, "ptr", ppSourceVoice, "ptr", pSourceFormat, "uint", Flags, "float", MaxFrequencyRatio, "ptr", pCallback, "ptr", pSendList, "ptr", pEffectChain, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IXAudio2SubmixVoice>} ppSubmixVoice 
     * @param {Integer} InputChannels 
     * @param {Integer} InputSampleRate 
     * @param {Integer} Flags 
     * @param {Integer} ProcessingStage 
     * @param {Pointer<XAUDIO2_VOICE_SENDS>} pSendList 
     * @param {Pointer<XAUDIO2_EFFECT_CHAIN>} pEffectChain 
     * @returns {HRESULT} 
     */
    CreateSubmixVoice(ppSubmixVoice, InputChannels, InputSampleRate, Flags, ProcessingStage, pSendList, pEffectChain) {
        result := ComCall(6, this, "ptr", ppSubmixVoice, "uint", InputChannels, "uint", InputSampleRate, "uint", Flags, "uint", ProcessingStage, "ptr", pSendList, "ptr", pEffectChain, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IXAudio2MasteringVoice>} ppMasteringVoice 
     * @param {Integer} InputChannels 
     * @param {Integer} InputSampleRate 
     * @param {Integer} Flags 
     * @param {PWSTR} szDeviceId 
     * @param {Pointer<XAUDIO2_EFFECT_CHAIN>} pEffectChain 
     * @param {Integer} StreamCategory 
     * @returns {HRESULT} 
     */
    CreateMasteringVoice(ppMasteringVoice, InputChannels, InputSampleRate, Flags, szDeviceId, pEffectChain, StreamCategory) {
        szDeviceId := szDeviceId is String ? StrPtr(szDeviceId) : szDeviceId

        result := ComCall(7, this, "ptr", ppMasteringVoice, "uint", InputChannels, "uint", InputSampleRate, "uint", Flags, "ptr", szDeviceId, "ptr", pEffectChain, "int", StreamCategory, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    StartEngine() {
        result := ComCall(8, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    StopEngine() {
        ComCall(9, this)
        return result
    }

    /**
     * 
     * @param {Integer} OperationSet 
     * @returns {HRESULT} 
     */
    CommitChanges(OperationSet) {
        result := ComCall(10, this, "uint", OperationSet, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<XAUDIO2_PERFORMANCE_DATA>} pPerfData 
     * @returns {String} Nothing - always returns an empty string
     */
    GetPerformanceData(pPerfData) {
        ComCall(11, this, "ptr", pPerfData)
        return result
    }

    /**
     * 
     * @param {Pointer<XAUDIO2_DEBUG_CONFIGURATION>} pDebugConfiguration 
     * @returns {String} Nothing - always returns an empty string
     */
    SetDebugConfiguration(pDebugConfiguration) {
        static pReserved := 0 ;Reserved parameters must always be NULL

        ComCall(12, this, "ptr", pDebugConfiguration, "ptr", pReserved)
        return result
    }
}
