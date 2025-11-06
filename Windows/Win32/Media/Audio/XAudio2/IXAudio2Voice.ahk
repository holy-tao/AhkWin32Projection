#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/xaudio2/nn-xaudio2-ixaudio2voice
 * @namespace Windows.Win32.Media.Audio.XAudio2
 * @version v4.0.30319
 */
class IXAudio2Voice extends Win32ComInterface{

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 0

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetVoiceDetails", "SetOutputVoices", "SetEffectChain", "EnableEffect", "DisableEffect", "GetEffectState", "SetEffectParameters", "GetEffectParameters", "SetFilterParameters", "GetFilterParameters", "SetOutputFilterParameters", "GetOutputFilterParameters", "SetVolume", "GetVolume", "SetChannelVolumes", "GetChannelVolumes", "SetOutputMatrix", "GetOutputMatrix", "DestroyVoice"]

    /**
     * 
     * @param {Pointer<XAUDIO2_VOICE_DETAILS>} pVoiceDetails 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/xaudio2/nf-xaudio2-ixaudio2voice-getvoicedetails
     */
    GetVoiceDetails(pVoiceDetails) {
        ComCall(0, this, "ptr", pVoiceDetails)
    }

    /**
     * 
     * @param {Pointer<XAUDIO2_VOICE_SENDS>} pSendList 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xaudio2/nf-xaudio2-ixaudio2voice-setoutputvoices
     */
    SetOutputVoices(pSendList) {
        result := ComCall(1, this, "ptr", pSendList, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<XAUDIO2_EFFECT_CHAIN>} pEffectChain 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xaudio2/nf-xaudio2-ixaudio2voice-seteffectchain
     */
    SetEffectChain(pEffectChain) {
        result := ComCall(2, this, "ptr", pEffectChain, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} EffectIndex 
     * @param {Integer} OperationSet 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xaudio2/nf-xaudio2-ixaudio2voice-enableeffect
     */
    EnableEffect(EffectIndex, OperationSet) {
        result := ComCall(3, this, "uint", EffectIndex, "uint", OperationSet, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} EffectIndex 
     * @param {Integer} OperationSet 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xaudio2/nf-xaudio2-ixaudio2voice-disableeffect
     */
    DisableEffect(EffectIndex, OperationSet) {
        result := ComCall(4, this, "uint", EffectIndex, "uint", OperationSet, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} EffectIndex 
     * @param {Pointer<BOOL>} pEnabled 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/xaudio2/nf-xaudio2-ixaudio2voice-geteffectstate
     */
    GetEffectState(EffectIndex, pEnabled) {
        pEnabledMarshal := pEnabled is VarRef ? "int*" : "ptr"

        ComCall(5, this, "uint", EffectIndex, pEnabledMarshal, pEnabled)
    }

    /**
     * 
     * @param {Integer} EffectIndex 
     * @param {Pointer} pParameters 
     * @param {Integer} ParametersByteSize 
     * @param {Integer} OperationSet 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xaudio2/nf-xaudio2-ixaudio2voice-seteffectparameters
     */
    SetEffectParameters(EffectIndex, pParameters, ParametersByteSize, OperationSet) {
        result := ComCall(6, this, "uint", EffectIndex, "ptr", pParameters, "uint", ParametersByteSize, "uint", OperationSet, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} EffectIndex 
     * @param {Pointer} pParameters 
     * @param {Integer} ParametersByteSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xaudio2/nf-xaudio2-ixaudio2voice-geteffectparameters
     */
    GetEffectParameters(EffectIndex, pParameters, ParametersByteSize) {
        result := ComCall(7, this, "uint", EffectIndex, "ptr", pParameters, "uint", ParametersByteSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<XAUDIO2_FILTER_PARAMETERS>} pParameters 
     * @param {Integer} OperationSet 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xaudio2/nf-xaudio2-ixaudio2voice-setfilterparameters
     */
    SetFilterParameters(pParameters, OperationSet) {
        result := ComCall(8, this, "ptr", pParameters, "uint", OperationSet, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<XAUDIO2_FILTER_PARAMETERS>} pParameters 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/xaudio2/nf-xaudio2-ixaudio2voice-getfilterparameters
     */
    GetFilterParameters(pParameters) {
        ComCall(9, this, "ptr", pParameters)
    }

    /**
     * 
     * @param {IXAudio2Voice} pDestinationVoice 
     * @param {Pointer<XAUDIO2_FILTER_PARAMETERS>} pParameters 
     * @param {Integer} OperationSet 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xaudio2/nf-xaudio2-ixaudio2voice-setoutputfilterparameters
     */
    SetOutputFilterParameters(pDestinationVoice, pParameters, OperationSet) {
        result := ComCall(10, this, "ptr", pDestinationVoice, "ptr", pParameters, "uint", OperationSet, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IXAudio2Voice} pDestinationVoice 
     * @param {Pointer<XAUDIO2_FILTER_PARAMETERS>} pParameters 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/xaudio2/nf-xaudio2-ixaudio2voice-getoutputfilterparameters
     */
    GetOutputFilterParameters(pDestinationVoice, pParameters) {
        ComCall(11, this, "ptr", pDestinationVoice, "ptr", pParameters)
    }

    /**
     * 
     * @param {Float} Volume 
     * @param {Integer} OperationSet 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xaudio2/nf-xaudio2-ixaudio2voice-setvolume
     */
    SetVolume(Volume, OperationSet) {
        result := ComCall(12, this, "float", Volume, "uint", OperationSet, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} pVolume 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/xaudio2/nf-xaudio2-ixaudio2voice-getvolume
     */
    GetVolume(pVolume) {
        pVolumeMarshal := pVolume is VarRef ? "float*" : "ptr"

        ComCall(13, this, pVolumeMarshal, pVolume)
    }

    /**
     * 
     * @param {Integer} Channels 
     * @param {Pointer<Float>} pVolumes 
     * @param {Integer} OperationSet 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xaudio2/nf-xaudio2-ixaudio2voice-setchannelvolumes
     */
    SetChannelVolumes(Channels, pVolumes, OperationSet) {
        pVolumesMarshal := pVolumes is VarRef ? "float*" : "ptr"

        result := ComCall(14, this, "uint", Channels, pVolumesMarshal, pVolumes, "uint", OperationSet, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Channels 
     * @param {Pointer<Float>} pVolumes 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/xaudio2/nf-xaudio2-ixaudio2voice-getchannelvolumes
     */
    GetChannelVolumes(Channels, pVolumes) {
        pVolumesMarshal := pVolumes is VarRef ? "float*" : "ptr"

        ComCall(15, this, "uint", Channels, pVolumesMarshal, pVolumes)
    }

    /**
     * 
     * @param {IXAudio2Voice} pDestinationVoice 
     * @param {Integer} SourceChannels 
     * @param {Integer} DestinationChannels 
     * @param {Pointer<Float>} pLevelMatrix 
     * @param {Integer} OperationSet 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xaudio2/nf-xaudio2-ixaudio2voice-setoutputmatrix
     */
    SetOutputMatrix(pDestinationVoice, SourceChannels, DestinationChannels, pLevelMatrix, OperationSet) {
        pLevelMatrixMarshal := pLevelMatrix is VarRef ? "float*" : "ptr"

        result := ComCall(16, this, "ptr", pDestinationVoice, "uint", SourceChannels, "uint", DestinationChannels, pLevelMatrixMarshal, pLevelMatrix, "uint", OperationSet, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IXAudio2Voice} pDestinationVoice 
     * @param {Integer} SourceChannels 
     * @param {Integer} DestinationChannels 
     * @param {Pointer<Float>} pLevelMatrix 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/xaudio2/nf-xaudio2-ixaudio2voice-getoutputmatrix
     */
    GetOutputMatrix(pDestinationVoice, SourceChannels, DestinationChannels, pLevelMatrix) {
        pLevelMatrixMarshal := pLevelMatrix is VarRef ? "float*" : "ptr"

        ComCall(17, this, "ptr", pDestinationVoice, "uint", SourceChannels, "uint", DestinationChannels, pLevelMatrixMarshal, pLevelMatrix)
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/xaudio2/nf-xaudio2-ixaudio2voice-destroyvoice
     */
    DestroyVoice() {
        ComCall(18, this)
    }
}
