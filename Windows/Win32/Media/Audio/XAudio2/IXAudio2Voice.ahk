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
     * Returns information about the creation flags, input channels, and sample rate of a voice.
     * @param {Pointer<XAUDIO2_VOICE_DETAILS>} pVoiceDetails <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/ns-xaudio2-xaudio2_voice_details">XAUDIO2_VOICE_DETAILS</a> structure containing information about the voice.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//xaudio2/nf-xaudio2-ixaudio2voice-getvoicedetails
     */
    GetVoiceDetails(pVoiceDetails) {
        ComCall(0, this, "ptr", pVoiceDetails)
    }

    /**
     * Designates a new set of submix or mastering voices to receive the output of the voice.
     * @param {Pointer<XAUDIO2_VOICE_SENDS>} pSendList Array of <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/ns-xaudio2-xaudio2_voice_sends">XAUDIO2_VOICE_SENDS</a> structure pointers to destination voices. If <i>pSendList</i> is NULL, the voice will send its output to the current mastering voice. To set the voice to not send its output anywhere set the <b>OutputCount</b> member of <b>XAUDIO2_VOICE_SENDS</b> to 0. All of the voices in a send list must have the same input sample rate, see <a href="https://docs.microsoft.com/windows/desktop/xaudio2/xaudio2-sample-rate-conversions">XAudio2 Sample Rate Conversions</a> for additional information.
     * @returns {HRESULT} Returns S_OK if successful, an error code otherwise. See <a href="/windows/desktop/xaudio2/xaudio2-error-codes">XAudio2 Error Codes</a> for descriptions of XAudio2 specific error codes.
     * @see https://docs.microsoft.com/windows/win32/api//xaudio2/nf-xaudio2-ixaudio2voice-setoutputvoices
     */
    SetOutputVoices(pSendList) {
        result := ComCall(1, this, "ptr", pSendList, "HRESULT")
        return result
    }

    /**
     * Replaces the effect chain of the voice.
     * @param {Pointer<XAUDIO2_EFFECT_CHAIN>} pEffectChain Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/ns-xaudio2-xaudio2_effect_chain">XAUDIO2_EFFECT_CHAIN</a> structure that describes the new effect chain to use. If NULL is passed, the current effect chain is removed.
     * 
     * <div class="alert"><b>Note</b>  If <i>pEffectChain</i> is non-NULL, the <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/ns-xaudio2-xaudio2_effect_chain">XAUDIO2_EFFECT_CHAIN</a> structure that it points to must specify at least one effect.</div>
     * <div> </div>
     * @returns {HRESULT} Returns S_OK if successful; otherwise, an error code. 
     * 
     * 
     * 
     * See <a href="/windows/desktop/xaudio2/xaudio2-error-codes">XAudio2 Error Codes</a> for descriptions of XAudio2 specific error codes.
     * @see https://docs.microsoft.com/windows/win32/api//xaudio2/nf-xaudio2-ixaudio2voice-seteffectchain
     */
    SetEffectChain(pEffectChain) {
        result := ComCall(2, this, "ptr", pEffectChain, "HRESULT")
        return result
    }

    /**
     * Enables the effect at a given position in the effect chain of the voice.
     * @param {Integer} EffectIndex Zero-based index of an effect in the effect chain of the voice.
     * @param {Integer} OperationSet Identifies this call as part of a deferred batch. See the <a href="https://docs.microsoft.com/windows/desktop/xaudio2/xaudio2-operation-sets">XAudio2 Operation Sets</a> overview for more information.
     * @returns {HRESULT} Returns S_OK if successful; otherwise, an error code. See <a href="/windows/desktop/xaudio2/xaudio2-error-codes">XAudio2 Error Codes</a> for descriptions of error codes.
     * @see https://docs.microsoft.com/windows/win32/api//xaudio2/nf-xaudio2-ixaudio2voice-enableeffect
     */
    EnableEffect(EffectIndex, OperationSet) {
        result := ComCall(3, this, "uint", EffectIndex, "uint", OperationSet, "HRESULT")
        return result
    }

    /**
     * Disables the effect at a given position in the effect chain of the voice.
     * @param {Integer} EffectIndex Zero-based index of an effect in the effect chain of the voice.
     * @param {Integer} OperationSet Identifies this call as part of a deferred batch. See the <a href="https://docs.microsoft.com/windows/desktop/xaudio2/xaudio2-operation-sets">XAudio2 Operation Sets</a> overview for more information.
     * @returns {HRESULT} Returns S_OK if successful; otherwise, an error code. See <a href="/windows/desktop/xaudio2/xaudio2-error-codes">XAudio2 Error Codes</a> for descriptions of valid error codes.
     * @see https://docs.microsoft.com/windows/win32/api//xaudio2/nf-xaudio2-ixaudio2voice-disableeffect
     */
    DisableEffect(EffectIndex, OperationSet) {
        result := ComCall(4, this, "uint", EffectIndex, "uint", OperationSet, "HRESULT")
        return result
    }

    /**
     * Returns the running state of the effect at a specified position in the effect chain of the voice.
     * @param {Integer} EffectIndex Zero-based index of an effect in the effect chain of the voice.
     * @param {Pointer<BOOL>} pEnabled Returns TRUE If the effect is enabled. If the effect is disabled, returns FALSE.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//xaudio2/nf-xaudio2-ixaudio2voice-geteffectstate
     */
    GetEffectState(EffectIndex, pEnabled) {
        pEnabledMarshal := pEnabled is VarRef ? "int*" : "ptr"

        ComCall(5, this, "uint", EffectIndex, pEnabledMarshal, pEnabled)
    }

    /**
     * Sets parameters for a given effect in the voice's effect chain.
     * @param {Integer} EffectIndex Zero-based index of an effect within the voice's effect chain.
     * @param {Pointer} pParameters Returns the current values of the effect-specific parameters.
     * @param {Integer} ParametersByteSize Size of the <b>pParameters</b> array in bytes.
     * @param {Integer} OperationSet Identifies this call as part of a deferred batch. See the <a href="https://docs.microsoft.com/windows/desktop/xaudio2/xaudio2-operation-sets">XAudio2 Operation Sets</a> overview for more information.
     * @returns {HRESULT} Returns S_OK if successful; otherwise, an error code. See <a href="/windows/desktop/xaudio2/xaudio2-error-codes">XAudio2 Error Codes</a> for descriptions of error codes.
     * 
     * 
     * 
     * Fails with E_NOTIMPL if the effect does not support a generic parameter control interface.
     * @see https://docs.microsoft.com/windows/win32/api//xaudio2/nf-xaudio2-ixaudio2voice-seteffectparameters
     */
    SetEffectParameters(EffectIndex, pParameters, ParametersByteSize, OperationSet) {
        result := ComCall(6, this, "uint", EffectIndex, "ptr", pParameters, "uint", ParametersByteSize, "uint", OperationSet, "HRESULT")
        return result
    }

    /**
     * Returns the current effect-specific parameters of a given effect in the voice's effect chain.
     * @param {Integer} EffectIndex Zero-based index of an effect within the voice's effect chain.
     * @param {Pointer} pParameters Returns the current values of the effect-specific parameters.
     * @param {Integer} ParametersByteSize Size, in bytes, of the pParameters array.
     * @returns {HRESULT} Returns S_OK if successful, an error code otherwise. See <a href="/windows/desktop/xaudio2/xaudio2-error-codes">XAudio2 Error Codes</a> for descriptions of error codes.
     * 
     * 
     * 
     * Fails with E_NOTIMPL if the effect does not support a generic parameter control interface.
     * @see https://docs.microsoft.com/windows/win32/api//xaudio2/nf-xaudio2-ixaudio2voice-geteffectparameters
     */
    GetEffectParameters(EffectIndex, pParameters, ParametersByteSize) {
        result := ComCall(7, this, "uint", EffectIndex, "ptr", pParameters, "uint", ParametersByteSize, "HRESULT")
        return result
    }

    /**
     * Sets the voice's filter parameters.
     * @param {Pointer<XAUDIO2_FILTER_PARAMETERS>} pParameters Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/ns-xaudio2-xaudio2_filter_parameters">XAUDIO2_FILTER_PARAMETERS</a> structure containing the filter information.
     * @param {Integer} OperationSet Identifies this call as part of a deferred batch. See the <a href="https://docs.microsoft.com/windows/desktop/xaudio2/xaudio2-operation-sets">XAudio2 Operation Sets</a> overview for more information.
     * @returns {HRESULT} Returns S_OK if successful, an error code otherwise. See <a href="/windows/desktop/xaudio2/xaudio2-error-codes">XAudio2 Error Codes</a> for descriptions of error codes.
     * @see https://docs.microsoft.com/windows/win32/api//xaudio2/nf-xaudio2-ixaudio2voice-setfilterparameters
     */
    SetFilterParameters(pParameters, OperationSet) {
        result := ComCall(8, this, "ptr", pParameters, "uint", OperationSet, "HRESULT")
        return result
    }

    /**
     * Gets the voice's filter parameters.
     * @param {Pointer<XAUDIO2_FILTER_PARAMETERS>} pParameters Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/ns-xaudio2-xaudio2_filter_parameters">XAUDIO2_FILTER_PARAMETERS</a> structure containing the filter information.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//xaudio2/nf-xaudio2-ixaudio2voice-getfilterparameters
     */
    GetFilterParameters(pParameters) {
        ComCall(9, this, "ptr", pParameters)
    }

    /**
     * Sets the filter parameters on one of this voice's sends.
     * @param {IXAudio2Voice} pDestinationVoice <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nn-xaudio2-ixaudio2voice">IXAudio2Voice</a> pointer to the destination voice of the send whose filter parameters will be set.
     * @param {Pointer<XAUDIO2_FILTER_PARAMETERS>} pParameters Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/ns-xaudio2-xaudio2_filter_parameters">XAUDIO2_FILTER_PARAMETERS</a> structure containing the filter information.
     * @param {Integer} OperationSet Identifies this call as part of a deferred batch. See the <a href="https://docs.microsoft.com/windows/desktop/xaudio2/xaudio2-operation-sets">XAudio2 Operation Sets</a> overview for more information.
     * @returns {HRESULT} Returns S_OK if successful, an error code otherwise. See <a href="/windows/desktop/xaudio2/xaudio2-error-codes">XAudio2 Error Codes</a> for descriptions of error codes.
     * @see https://docs.microsoft.com/windows/win32/api//xaudio2/nf-xaudio2-ixaudio2voice-setoutputfilterparameters
     */
    SetOutputFilterParameters(pDestinationVoice, pParameters, OperationSet) {
        result := ComCall(10, this, "ptr", pDestinationVoice, "ptr", pParameters, "uint", OperationSet, "HRESULT")
        return result
    }

    /**
     * Returns the filter parameters from one of this voice's sends.
     * @param {IXAudio2Voice} pDestinationVoice <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nn-xaudio2-ixaudio2voice">IXAudio2Voice</a> pointer to the destination voice of the send whose filter parameters will be read.
     * @param {Pointer<XAUDIO2_FILTER_PARAMETERS>} pParameters Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/ns-xaudio2-xaudio2_filter_parameters">XAUDIO2_FILTER_PARAMETERS</a> structure containing the filter information.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//xaudio2/nf-xaudio2-ixaudio2voice-getoutputfilterparameters
     */
    GetOutputFilterParameters(pDestinationVoice, pParameters) {
        ComCall(11, this, "ptr", pDestinationVoice, "ptr", pParameters)
    }

    /**
     * Sets the overall volume level for the voice.
     * @param {Float} Volume Overall volume level to use. See Remarks for more information on volume levels.
     * @param {Integer} OperationSet Identifies this call as part of a deferred batch. See the <a href="https://docs.microsoft.com/windows/desktop/xaudio2/xaudio2-operation-sets">XAudio2 Operation Sets</a> overview for more information.
     * @returns {HRESULT} Returns S_OK if successful, an error code otherwise. See <a href="/windows/desktop/xaudio2/xaudio2-error-codes">XAudio2 Error Codes</a> for descriptions of error codes.
     * @see https://docs.microsoft.com/windows/win32/api//xaudio2/nf-xaudio2-ixaudio2voice-setvolume
     */
    SetVolume(Volume, OperationSet) {
        result := ComCall(12, this, "float", Volume, "uint", OperationSet, "HRESULT")
        return result
    }

    /**
     * Gets the current overall volume level of the voice.
     * @param {Pointer<Float>} pVolume Returns the current overall volume level of the voice. See Remarks for more information on volume levels.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//xaudio2/nf-xaudio2-ixaudio2voice-getvolume
     */
    GetVolume(pVolume) {
        pVolumeMarshal := pVolume is VarRef ? "float*" : "ptr"

        ComCall(13, this, pVolumeMarshal, pVolume)
    }

    /**
     * Sets the volume levels for the voice, per channel.
     * @param {Integer} Channels Number of channels in the voice.
     * @param {Pointer<Float>} pVolumes Array containing the new volumes of each channel in the voice. The array must have <i>Channels</i> elements. See Remarks for more information on volume levels.
     * @param {Integer} OperationSet Identifies this call as part of a deferred batch. See the <a href="https://docs.microsoft.com/windows/desktop/xaudio2/xaudio2-operation-sets">XAudio2 Operation Sets</a> overview for more information.
     * @returns {HRESULT} Returns S_OK if successful, an error code otherwise. See <a href="/windows/desktop/xaudio2/xaudio2-error-codes">XAudio2 Error Codes</a> for descriptions of XAudio2 specific error codes.
     * @see https://docs.microsoft.com/windows/win32/api//xaudio2/nf-xaudio2-ixaudio2voice-setchannelvolumes
     */
    SetChannelVolumes(Channels, pVolumes, OperationSet) {
        pVolumesMarshal := pVolumes is VarRef ? "float*" : "ptr"

        result := ComCall(14, this, "uint", Channels, pVolumesMarshal, pVolumes, "uint", OperationSet, "HRESULT")
        return result
    }

    /**
     * Returns the volume levels for the voice, per channel.
     * @param {Integer} Channels Confirms the channel count of the voice.
     * @param {Pointer<Float>} pVolumes Returns the current volume level of each channel in the voice. The array must have at least <i>Channels</i> elements. See Remarks for more information on volume levels.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//xaudio2/nf-xaudio2-ixaudio2voice-getchannelvolumes
     */
    GetChannelVolumes(Channels, pVolumes) {
        pVolumesMarshal := pVolumes is VarRef ? "float*" : "ptr"

        ComCall(15, this, "uint", Channels, pVolumesMarshal, pVolumes)
    }

    /**
     * Sets the volume level of each channel of the final output for the voice. These channels are mapped to the input channels of a specified destination voice.
     * @param {IXAudio2Voice} pDestinationVoice Pointer to a destination <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nn-xaudio2-ixaudio2voice">IXAudio2Voice</a> for which to set volume levels.
     * 
     * <div class="alert"><b>Note</b>  If the voice sends to a single target voice then specifying NULL will cause <b>SetOutputMatrix</b> to operate on that target voice.</div>
     * <div> </div>
     * @param {Integer} SourceChannels Confirms the output channel count of the voice. This is the number of channels that are produced by the last effect in the chain.
     * @param {Integer} DestinationChannels Confirms the input channel count of the destination voice.
     * @param {Pointer<Float>} pLevelMatrix Array of [<i>SourceChannels</i> × <i>DestinationChannels</i>] volume levels sent to the destination voice. The level sent from source channel <i>S</i> to destination channel <i>D</i> is specified in the form <i>pLevelMatrix</i>[<i>SourceChannels</i> × <i>D</i> + <i>S</i>]. 
     * 
     * 
     * For example, when rendering two-channel stereo input into 5.1 output that is weighted toward the front channels—but is absent from the center and low-frequency channels—the matrix might have the values shown in the following table.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Output</th>
     * <th>Left Input [Array Index]</th>
     * <th>Right Input [Array Index]</th>
     * </tr>
     * <tr>
     * <td>Left</td>
     * <td>1.0 [0]</td>
     * <td>0.0 [1]</td>
     * </tr>
     * <tr>
     * <td>Right</td>
     * <td>0.0 [2]</td>
     * <td>1.0 [3]</td>
     * </tr>
     * <tr>
     * <td>Front Center</td>
     * <td>0.0 [4]</td>
     * <td>0.0 [5]</td>
     * </tr>
     * <tr>
     * <td>LFE</td>
     * <td>0.0 [6]</td>
     * <td>0.0 [7]</td>
     * </tr>
     * <tr>
     * <td>Rear Left</td>
     * <td>0.8 [8]</td>
     * <td>0.0 [9]</td>
     * </tr>
     * <tr>
     * <td>Rear Right</td>
     * <td>0.0 [10]</td>
     * <td>0.8 [11]</td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  The left and right input are fully mapped to the output left and right channels; 80 percent of the left and right input is mapped to the rear left and right channels.</div>
     * <div> </div>
     * See Remarks for more information on volume levels.
     * @param {Integer} OperationSet Identifies this call as part of a deferred batch. See the <a href="https://docs.microsoft.com/windows/desktop/xaudio2/xaudio2-operation-sets">XAudio2 Operation Sets</a> overview for more information.
     * @returns {HRESULT} Returns S_OK if successful, an error code otherwise. See <a href="/windows/desktop/xaudio2/xaudio2-error-codes">XAudio2 Error Codes</a> for descriptions of error codes.
     * @see https://docs.microsoft.com/windows/win32/api//xaudio2/nf-xaudio2-ixaudio2voice-setoutputmatrix
     */
    SetOutputMatrix(pDestinationVoice, SourceChannels, DestinationChannels, pLevelMatrix, OperationSet) {
        pLevelMatrixMarshal := pLevelMatrix is VarRef ? "float*" : "ptr"

        result := ComCall(16, this, "ptr", pDestinationVoice, "uint", SourceChannels, "uint", DestinationChannels, pLevelMatrixMarshal, pLevelMatrix, "uint", OperationSet, "HRESULT")
        return result
    }

    /**
     * Gets the volume level of each channel of the final output for the voice. These channels are mapped to the input channels of a specified destination voice.
     * @param {IXAudio2Voice} pDestinationVoice Pointer specifying the destination <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nn-xaudio2-ixaudio2voice">IXAudio2Voice</a> to retrieve the output matrix for.
     * 
     * <div class="alert"><b>Note</b>  If the voice sends to a single target voice then specifying NULL will cause <b>GetOutputMatrix</b> to operate on that target voice.</div>
     * <div> </div>
     * @param {Integer} SourceChannels Confirms the output channel count of the voice. This is the number of channels that are produced by the last effect in the chain.
     * @param {Integer} DestinationChannels Confirms the input channel count of the destination voice.
     * @param {Pointer<Float>} pLevelMatrix Array of [<i>SourceChannels</i> * <i>DestinationChannels</i>] volume levels sent to the destination voice. The level sent from source channel S to destination channel D is returned in the form <i>pLevelMatrix</i>[<i>DestinationChannels</i> × S + D]. See Remarks for more information on volume levels.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//xaudio2/nf-xaudio2-ixaudio2voice-getoutputmatrix
     */
    GetOutputMatrix(pDestinationVoice, SourceChannels, DestinationChannels, pLevelMatrix) {
        pLevelMatrixMarshal := pLevelMatrix is VarRef ? "float*" : "ptr"

        ComCall(17, this, "ptr", pDestinationVoice, "uint", SourceChannels, "uint", DestinationChannels, pLevelMatrixMarshal, pLevelMatrix)
    }

    /**
     * Destroys the voice. If necessary, stops the voice and removes it from the XAudio2 graph.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//xaudio2/nf-xaudio2-ixaudio2voice-destroyvoice
     */
    DestroyVoice() {
        ComCall(18, this)
    }
}
