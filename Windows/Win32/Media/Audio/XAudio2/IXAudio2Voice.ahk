#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.Media.Audio.XAudio2
 * @version v4.0.30319
 */
class IXAudio2Voice extends Win32ComInterface{

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 0

    /**
     * 
     * @param {Pointer<XAUDIO2_VOICE_DETAILS>} pVoiceDetails 
     * @returns {String} Nothing - always returns an empty string
     */
    GetVoiceDetails(pVoiceDetails) {
        ComCall(0, this, "ptr", pVoiceDetails)
        return result
    }

    /**
     * 
     * @param {Pointer<XAUDIO2_VOICE_SENDS>} pSendList 
     * @returns {HRESULT} 
     */
    SetOutputVoices(pSendList) {
        result := ComCall(1, this, "ptr", pSendList, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<XAUDIO2_EFFECT_CHAIN>} pEffectChain 
     * @returns {HRESULT} 
     */
    SetEffectChain(pEffectChain) {
        result := ComCall(2, this, "ptr", pEffectChain, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} EffectIndex 
     * @param {Integer} OperationSet 
     * @returns {HRESULT} 
     */
    EnableEffect(EffectIndex, OperationSet) {
        result := ComCall(3, this, "uint", EffectIndex, "uint", OperationSet, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} EffectIndex 
     * @param {Integer} OperationSet 
     * @returns {HRESULT} 
     */
    DisableEffect(EffectIndex, OperationSet) {
        result := ComCall(4, this, "uint", EffectIndex, "uint", OperationSet, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} EffectIndex 
     * @param {Pointer<BOOL>} pEnabled 
     * @returns {String} Nothing - always returns an empty string
     */
    GetEffectState(EffectIndex, pEnabled) {
        ComCall(5, this, "uint", EffectIndex, "ptr", pEnabled)
        return result
    }

    /**
     * 
     * @param {Integer} EffectIndex 
     * @param {Pointer} pParameters 
     * @param {Integer} ParametersByteSize 
     * @param {Integer} OperationSet 
     * @returns {HRESULT} 
     */
    SetEffectParameters(EffectIndex, pParameters, ParametersByteSize, OperationSet) {
        result := ComCall(6, this, "uint", EffectIndex, "ptr", pParameters, "uint", ParametersByteSize, "uint", OperationSet, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} EffectIndex 
     * @param {Pointer} pParameters 
     * @param {Integer} ParametersByteSize 
     * @returns {HRESULT} 
     */
    GetEffectParameters(EffectIndex, pParameters, ParametersByteSize) {
        result := ComCall(7, this, "uint", EffectIndex, "ptr", pParameters, "uint", ParametersByteSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<XAUDIO2_FILTER_PARAMETERS>} pParameters 
     * @param {Integer} OperationSet 
     * @returns {HRESULT} 
     */
    SetFilterParameters(pParameters, OperationSet) {
        result := ComCall(8, this, "ptr", pParameters, "uint", OperationSet, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<XAUDIO2_FILTER_PARAMETERS>} pParameters 
     * @returns {String} Nothing - always returns an empty string
     */
    GetFilterParameters(pParameters) {
        ComCall(9, this, "ptr", pParameters)
        return result
    }

    /**
     * 
     * @param {Pointer<IXAudio2Voice>} pDestinationVoice 
     * @param {Pointer<XAUDIO2_FILTER_PARAMETERS>} pParameters 
     * @param {Integer} OperationSet 
     * @returns {HRESULT} 
     */
    SetOutputFilterParameters(pDestinationVoice, pParameters, OperationSet) {
        result := ComCall(10, this, "ptr", pDestinationVoice, "ptr", pParameters, "uint", OperationSet, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IXAudio2Voice>} pDestinationVoice 
     * @param {Pointer<XAUDIO2_FILTER_PARAMETERS>} pParameters 
     * @returns {String} Nothing - always returns an empty string
     */
    GetOutputFilterParameters(pDestinationVoice, pParameters) {
        ComCall(11, this, "ptr", pDestinationVoice, "ptr", pParameters)
        return result
    }

    /**
     * 
     * @param {Float} Volume 
     * @param {Integer} OperationSet 
     * @returns {HRESULT} 
     */
    SetVolume(Volume, OperationSet) {
        result := ComCall(12, this, "float", Volume, "uint", OperationSet, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Single>} pVolume 
     * @returns {String} Nothing - always returns an empty string
     */
    GetVolume(pVolume) {
        ComCall(13, this, "float*", pVolume)
        return result
    }

    /**
     * 
     * @param {Integer} Channels 
     * @param {Pointer<Single>} pVolumes 
     * @param {Integer} OperationSet 
     * @returns {HRESULT} 
     */
    SetChannelVolumes(Channels, pVolumes, OperationSet) {
        result := ComCall(14, this, "uint", Channels, "float*", pVolumes, "uint", OperationSet, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Channels 
     * @param {Pointer<Single>} pVolumes 
     * @returns {String} Nothing - always returns an empty string
     */
    GetChannelVolumes(Channels, pVolumes) {
        ComCall(15, this, "uint", Channels, "float*", pVolumes)
        return result
    }

    /**
     * 
     * @param {Pointer<IXAudio2Voice>} pDestinationVoice 
     * @param {Integer} SourceChannels 
     * @param {Integer} DestinationChannels 
     * @param {Pointer<Single>} pLevelMatrix 
     * @param {Integer} OperationSet 
     * @returns {HRESULT} 
     */
    SetOutputMatrix(pDestinationVoice, SourceChannels, DestinationChannels, pLevelMatrix, OperationSet) {
        result := ComCall(16, this, "ptr", pDestinationVoice, "uint", SourceChannels, "uint", DestinationChannels, "float*", pLevelMatrix, "uint", OperationSet, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IXAudio2Voice>} pDestinationVoice 
     * @param {Integer} SourceChannels 
     * @param {Integer} DestinationChannels 
     * @param {Pointer<Single>} pLevelMatrix 
     * @returns {String} Nothing - always returns an empty string
     */
    GetOutputMatrix(pDestinationVoice, SourceChannels, DestinationChannels, pLevelMatrix) {
        ComCall(17, this, "ptr", pDestinationVoice, "uint", SourceChannels, "uint", DestinationChannels, "float*", pLevelMatrix)
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    DestroyVoice() {
        ComCall(18, this)
        return result
    }
}
