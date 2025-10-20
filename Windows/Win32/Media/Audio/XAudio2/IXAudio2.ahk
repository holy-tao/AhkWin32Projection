#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/xaudio2/nn-xaudio2-ixaudio2
 * @namespace Windows.Win32.Media.Audio.XAudio2
 * @version v4.0.30319
 */
class IXAudio2 extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RegisterForCallbacks", "UnregisterForCallbacks", "CreateSourceVoice", "CreateSubmixVoice", "CreateMasteringVoice", "StartEngine", "StopEngine", "CommitChanges", "GetPerformanceData", "SetDebugConfiguration"]

    /**
     * 
     * @param {IXAudio2EngineCallback} pCallback 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xaudio2/nf-xaudio2-ixaudio2-registerforcallbacks
     */
    RegisterForCallbacks(pCallback) {
        result := ComCall(3, this, "ptr", pCallback, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IXAudio2EngineCallback} pCallback 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/xaudio2/nf-xaudio2-ixaudio2-unregisterforcallbacks
     */
    UnregisterForCallbacks(pCallback) {
        ComCall(4, this, "ptr", pCallback)
    }

    /**
     * 
     * @param {Pointer<IXAudio2SourceVoice>} ppSourceVoice 
     * @param {Pointer<WAVEFORMATEX>} pSourceFormat 
     * @param {Integer} Flags 
     * @param {Float} MaxFrequencyRatio 
     * @param {IXAudio2VoiceCallback} pCallback 
     * @param {Pointer<XAUDIO2_VOICE_SENDS>} pSendList 
     * @param {Pointer<XAUDIO2_EFFECT_CHAIN>} pEffectChain 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xaudio2/nf-xaudio2-ixaudio2-createsourcevoice
     */
    CreateSourceVoice(ppSourceVoice, pSourceFormat, Flags, MaxFrequencyRatio, pCallback, pSendList, pEffectChain) {
        result := ComCall(5, this, "ptr*", ppSourceVoice, "ptr", pSourceFormat, "uint", Flags, "float", MaxFrequencyRatio, "ptr", pCallback, "ptr", pSendList, "ptr", pEffectChain, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/xaudio2/nf-xaudio2-ixaudio2-createsubmixvoice
     */
    CreateSubmixVoice(ppSubmixVoice, InputChannels, InputSampleRate, Flags, ProcessingStage, pSendList, pEffectChain) {
        result := ComCall(6, this, "ptr*", ppSubmixVoice, "uint", InputChannels, "uint", InputSampleRate, "uint", Flags, "uint", ProcessingStage, "ptr", pSendList, "ptr", pEffectChain, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/xaudio2/nf-xaudio2-ixaudio2-createmasteringvoice
     */
    CreateMasteringVoice(ppMasteringVoice, InputChannels, InputSampleRate, Flags, szDeviceId, pEffectChain, StreamCategory) {
        szDeviceId := szDeviceId is String ? StrPtr(szDeviceId) : szDeviceId

        result := ComCall(7, this, "ptr*", ppMasteringVoice, "uint", InputChannels, "uint", InputSampleRate, "uint", Flags, "ptr", szDeviceId, "ptr", pEffectChain, "int", StreamCategory, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xaudio2/nf-xaudio2-ixaudio2-startengine
     */
    StartEngine() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/xaudio2/nf-xaudio2-ixaudio2-stopengine
     */
    StopEngine() {
        ComCall(9, this)
    }

    /**
     * 
     * @param {Integer} OperationSet 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xaudio2/nf-xaudio2-ixaudio2-commitchanges
     */
    CommitChanges(OperationSet) {
        result := ComCall(10, this, "uint", OperationSet, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<XAUDIO2_PERFORMANCE_DATA>} pPerfData 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/xaudio2/nf-xaudio2-ixaudio2-getperformancedata
     */
    GetPerformanceData(pPerfData) {
        ComCall(11, this, "ptr", pPerfData)
    }

    /**
     * 
     * @param {Pointer<XAUDIO2_DEBUG_CONFIGURATION>} pDebugConfiguration 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/xaudio2/nf-xaudio2-ixaudio2-setdebugconfiguration
     */
    SetDebugConfiguration(pDebugConfiguration) {
        static pReserved := 0 ;Reserved parameters must always be NULL

        ComCall(12, this, "ptr", pDebugConfiguration, "ptr", pReserved)
    }
}
