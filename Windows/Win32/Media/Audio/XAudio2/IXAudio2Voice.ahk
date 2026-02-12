#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * IXAudio2Voice represents the base interface from which IXAudio2SourceVoice, IXAudio2SubmixVoice and IXAudio2MasteringVoice are derived. The methods listed below are common to all voice subclasses.
 * @remarks
 * <h3><a id="Platform_Requirements"></a><a id="platform_requirements"></a><a id="PLATFORM_REQUIREMENTS"></a>Platform Requirements</h3>
 * Windows 10 (XAudio2.9); Windows 8, Windows Phone 8 (XAudio 2.8); DirectX SDK (XAudio 2.7)
 * @see https://learn.microsoft.com/windows/win32/api//content/xaudio2/nn-xaudio2-ixaudio2voice
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
     * @remarks
     * <h3><a id="Platform_Requirements"></a><a id="platform_requirements"></a><a id="PLATFORM_REQUIREMENTS"></a>Platform Requirements</h3>
     * Windows 10 (XAudio2.9); Windows 8, Windows Phone 8 (XAudio 2.8); DirectX SDK (XAudio 2.7)
     * @param {Pointer<XAUDIO2_VOICE_DETAILS>} pVoiceDetails <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/ns-xaudio2-xaudio2_voice_details">XAUDIO2_VOICE_DETAILS</a> structure containing information about the voice.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api//content/xaudio2/nf-xaudio2-ixaudio2voice-getvoicedetails
     */
    GetVoiceDetails(pVoiceDetails) {
        ComCall(0, this, "ptr", pVoiceDetails)
    }

    /**
     * Designates a new set of submix or mastering voices to receive the output of the voice.
     * @remarks
     * This method is only valid for source and submix voices. Mastering voices can not send audio to another voice.
     * 
     * 
     * 
     * After calling <b>SetOutputVoices</b> a voice's current send levels will be replaced by a default send matrix. The <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nf-xaudio2-ixaudio2voice-setoutputmatrix">IXAudio2Voice::SetOutputMatrix</a> method must be called to set a custom matrix for the new sendlist.
     * 
     * 
     * 
     * It is invalid to call <b>SetOutputVoices</b> from within a callback (that is, <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nn-xaudio2-ixaudio2enginecallback">IXAudio2EngineCallback</a> or <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nn-xaudio2-ixaudio2voicecallback">IXAudio2VoiceCallback</a>). If <b>SetOutputVoices</b> is called within a callback, it returns XAUDIO2_E_INVALID_CALL.
     * 
     * <div class="alert"><b>Note</b>  Calling <b>SetOutputVoices</b> invalidates any send matrices previously set with <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nf-xaudio2-ixaudio2voice-setoutputmatrix">IXAudio2Voice::SetOutputMatrix</a>.</div>
     * <div> </div>
     * <h3><a id="Platform_Requirements"></a><a id="platform_requirements"></a><a id="PLATFORM_REQUIREMENTS"></a>Platform Requirements</h3>
     * Windows 8, Windows Phone 8 (XAudio 2.8); DirectX SDK (XAudio 2.7)
     * @param {Pointer<XAUDIO2_VOICE_SENDS>} pSendList Array of <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/ns-xaudio2-xaudio2_voice_sends">XAUDIO2_VOICE_SENDS</a> structure pointers to destination voices. If <i>pSendList</i> is NULL, the voice will send its output to the current mastering voice. To set the voice to not send its output anywhere set the <b>OutputCount</b> member of <b>XAUDIO2_VOICE_SENDS</b> to 0. All of the voices in a send list must have the same input sample rate, see <a href="https://docs.microsoft.com/windows/desktop/xaudio2/xaudio2-sample-rate-conversions">XAudio2 Sample Rate Conversions</a> for additional information.
     * @returns {HRESULT} Returns S_OK if successful, an error code otherwise. See <a href="https://docs.microsoft.com/windows/desktop/xaudio2/xaudio2-error-codes">XAudio2 Error Codes</a> for descriptions of XAudio2 specific error codes.
     * @see https://learn.microsoft.com/windows/win32/api//content/xaudio2/nf-xaudio2-ixaudio2voice-setoutputvoices
     */
    SetOutputVoices(pSendList) {
        result := ComCall(1, this, "ptr", pSendList, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Replaces the effect chain of the voice.
     * @remarks
     * The number of output channels allowed for a voice's effect chain is locked at creation of the voice. If you create the voice with an effect chain, any new effect chain passed to <b>SetEffectChain</b> must have the same number of input and output channels as the original effect chain. If you create the voice without an effect chain, the number of output channels allowed for the effect chain will default to the number of input channels for the voice. If any part of effect chain creation fails, none of it is applied.
     * 
     * 
     * 
     * After you attach an effect to an XAudio2 voice, XAudio2 takes control of the effect, and the client should not make any further calls to it. The simplest way to ensure this is to release all pointers to the effect.
     * 
     * 
     * 
     * It is invalid to call <b>SetEffectChain</b> from within a callback (that is, <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nn-xaudio2-ixaudio2enginecallback">IXAudio2EngineCallback</a> or <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nn-xaudio2-ixaudio2voicecallback">IXAudio2VoiceCallback</a>). If you call <b>SetEffectChain</b> within a callback, it returns XAUDIO2_E_INVALID_CALL.
     * 
     * 
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/ns-xaudio2-xaudio2_effect_chain">XAUDIO2_EFFECT_CHAIN</a> that is passed in as the pEffectChain argument and any <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/ns-xaudio2-xaudio2_effect_descriptor">XAUDIO2_EFFECT_DESCRIPTOR</a> information contained within it are no longer needed after <b>SetEffectChain</b> successfully completes, and may be deleted immediately after <b>SetEffectChain</b> is called.
     * 
     * <h3><a id="Platform_Requirements"></a><a id="platform_requirements"></a><a id="PLATFORM_REQUIREMENTS"></a>Platform Requirements</h3>
     * Windows 8, Windows Phone 8 (XAudio 2.8); DirectX SDK (XAudio 2.7)
     * @param {Pointer<XAUDIO2_EFFECT_CHAIN>} pEffectChain Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/ns-xaudio2-xaudio2_effect_chain">XAUDIO2_EFFECT_CHAIN</a> structure that describes the new effect chain to use. If NULL is passed, the current effect chain is removed.
     * 
     * <div class="alert"><b>Note</b>  If <i>pEffectChain</i> is non-NULL, the <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/ns-xaudio2-xaudio2_effect_chain">XAUDIO2_EFFECT_CHAIN</a> structure that it points to must specify at least one effect.</div>
     * <div> </div>
     * @returns {HRESULT} Returns S_OK if successful; otherwise, an error code. 
     * 
     * 
     * 
     * See <a href="https://docs.microsoft.com/windows/desktop/xaudio2/xaudio2-error-codes">XAudio2 Error Codes</a> for descriptions of XAudio2 specific error codes.
     * @see https://learn.microsoft.com/windows/win32/api//content/xaudio2/nf-xaudio2-ixaudio2voice-seteffectchain
     */
    SetEffectChain(pEffectChain) {
        result := ComCall(2, this, "ptr", pEffectChain, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Enables the effect at a given position in the effect chain of the voice.
     * @remarks
     * Be careful when you enable an effect while the voice that hosts it is running. Such an action can result in a problem if the effect significantly changes the audio's pitch or volume.
     * 
     * 
     * 
     * The effects in a given XAudio2 voice's effect chain must consume and produce audio at that voice's processing sample rate. The only aspect of the audio format they can change is the channel count. For example a reverb effect can convert mono data to 5.1. The client can use the <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/ns-xaudio2-xaudio2_effect_descriptor">XAUDIO2_EFFECT_DESCRIPTOR</a> structure's <b>OutputChannels</b> field to specify the number of channels it wants each effect to produce. Each effect in an effect chain must produce a number of channels that the next effect can consume. Any calls to <b>IXAudio2Voice::EnableEffect</b> or <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nf-xaudio2-ixaudio2voice-disableeffect">IXAudio2Voice::DisableEffect</a> that would make the effect chain stop fulfilling these requirements will fail.
     * 
     * 
     * 
     * <b>EnableEffect</b> takes effect immediately when you call it from an XAudio2 callback with an <i>OperationSet</i> of <b>XAUDIO2_COMMIT_NOW</b>.
     * 
     * <h3><a id="Platform_Requirements"></a><a id="platform_requirements"></a><a id="PLATFORM_REQUIREMENTS"></a>Platform Requirements</h3>
     * Windows 10 (XAudio2.9); Windows 8, Windows Phone 8 (XAudio 2.8); DirectX SDK (XAudio 2.7)
     * @param {Integer} EffectIndex Zero-based index of an effect in the effect chain of the voice.
     * @param {Integer} OperationSet Identifies this call as part of a deferred batch. See the <a href="https://docs.microsoft.com/windows/desktop/xaudio2/xaudio2-operation-sets">XAudio2 Operation Sets</a> overview for more information.
     * @returns {HRESULT} Returns S_OK if successful; otherwise, an error code. See <a href="https://docs.microsoft.com/windows/desktop/xaudio2/xaudio2-error-codes">XAudio2 Error Codes</a> for descriptions of error codes.
     * @see https://learn.microsoft.com/windows/win32/api//content/xaudio2/nf-xaudio2-ixaudio2voice-enableeffect
     */
    EnableEffect(EffectIndex, OperationSet) {
        result := ComCall(3, this, "uint", EffectIndex, "uint", OperationSet, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Disables the effect at a given position in the effect chain of the voice.
     * @remarks
     * The effects in a given XAudio2 voice's effect chain must consume and produce audio at that voice's processing sample rate. The only aspect of the audio format they can change is the channel count. For example a reverb effect can convert mono data to 5.1. The client can use the <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/ns-xaudio2-xaudio2_effect_descriptor">XAUDIO2_EFFECT_DESCRIPTOR</a> structure's <b>OutputChannels</b> field to specify the number of channels it wants each effect to produce. Each effect in an effect chain must produce a number of channels that the next effect can consume. Any calls to <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nf-xaudio2-ixaudio2voice-enableeffect">IXAudio2Voice::EnableEffect</a> or <b>IXAudio2Voice::DisableEffect</b> that would make the effect chain stop fulfilling these requirements will fail.
     * 
     * 
     * 
     * Disabling an effect immediately removes it from the processing graph. Any pending audio in the effect—such as a reverb tail—is not played. Be careful disabling an effect while the voice that hosts it is running. This can result in an audible artifact if the effect significantly changes the audio's pitch or volume.
     * 
     * 
     * 
     * <b>DisableEffect</b> takes effect immediately when called from an XAudio2 callback with an <i>OperationSet</i> of <b>XAUDIO2_COMMIT_NOW</b>.
     * 
     * 
     * 
     * <h3><a id="Platform_Requirements"></a><a id="platform_requirements"></a><a id="PLATFORM_REQUIREMENTS"></a>Platform Requirements</h3>
     * Windows 10 (XAudio2.9); Windows 8, Windows Phone 8 (XAudio 2.8); DirectX SDK (XAudio 2.7)
     * @param {Integer} EffectIndex Zero-based index of an effect in the effect chain of the voice.
     * @param {Integer} OperationSet Identifies this call as part of a deferred batch. See the <a href="https://docs.microsoft.com/windows/desktop/xaudio2/xaudio2-operation-sets">XAudio2 Operation Sets</a> overview for more information.
     * @returns {HRESULT} Returns S_OK if successful; otherwise, an error code. See <a href="https://docs.microsoft.com/windows/desktop/xaudio2/xaudio2-error-codes">XAudio2 Error Codes</a> for descriptions of valid error codes.
     * @see https://learn.microsoft.com/windows/win32/api//content/xaudio2/nf-xaudio2-ixaudio2voice-disableeffect
     */
    DisableEffect(EffectIndex, OperationSet) {
        result := ComCall(4, this, "uint", EffectIndex, "uint", OperationSet, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Returns the running state of the effect at a specified position in the effect chain of the voice.
     * @remarks
     * <b>GetEffectState</b> always returns the effect's actual current state. However, this may not be the state set by the most recent <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nf-xaudio2-ixaudio2voice-enableeffect">IXAudio2Voice::EnableEffect</a> or <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nf-xaudio2-ixaudio2voice-disableeffect">IXAudio2Voice::DisableEffect</a> call: the actual state is only changed the next time the audio engine runs after the <b>IXAudio2Voice::EnableEffect</b> or <b>IXAudio2Voice::DisableEffect</b> call (or after the corresponding <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nf-xaudio2-ixaudio2-commitchanges">IXAudio2::CommitChanges</a> call, if EnableEffect/DisableEffect was called with a deferred operation ID).
     * 
     * <h3><a id="Platform_Requirements"></a><a id="platform_requirements"></a><a id="PLATFORM_REQUIREMENTS"></a>Platform Requirements</h3>
     * Windows 10 (XAudio2.9); Windows 8, Windows Phone 8 (XAudio 2.8); DirectX SDK (XAudio 2.7)
     * @param {Integer} EffectIndex Zero-based index of an effect in the effect chain of the voice.
     * @param {Pointer<BOOL>} pEnabled Returns TRUE If the effect is enabled. If the effect is disabled, returns FALSE.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api//content/xaudio2/nf-xaudio2-ixaudio2voice-geteffectstate
     */
    GetEffectState(EffectIndex, pEnabled) {
        pEnabledMarshal := pEnabled is VarRef ? "int*" : "ptr"

        ComCall(5, this, "uint", EffectIndex, pEnabledMarshal, pEnabled)
    }

    /**
     * Sets parameters for a given effect in the voice's effect chain.
     * @remarks
     * The specific effect being used determines the valid size and format of the <i>pParameters</i> buffer. The call will fail if <i>pParameters</i> is invalid or if <i>ParametersByteSize</i> is not exactly the size that the effect expects. The client must take care to direct the <b>SetEffectParameters</b> call to the right effect. If this call is directed to a different effect that happens to accept the same parameter block size, the parameters will be interpreted differently. This may lead to unexpected results.
     * 
     * 
     * 
     * The memory pointed to by <i>pParameters</i> must <i>not</i> be freed immediately, because XAudio2 will need to refer to it later when the parameters actually are applied to the effect. This happens during the next audio processing pass if the <i>OperationSet</i> argument is <b>XAUDIO2_COMMIT_NOW</b>. Otherwise, the parameters are applied to the effect later, during the first processing pass after the <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nf-xaudio2-ixaudio2-commitchanges">IXAudio2::CommitChanges</a> function is called with the same <i>OperationSet</i> argument.
     * 
     * 
     * 
     * <b>SetEffectParameters</b> takes effect immediately when called from an XAudio2 callback with an <i>OperationSet</i> of <b>XAUDIO2_COMMIT_NOW</b>.
     * 
     * 
     * <div class="alert"><b>Note</b>  <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nf-xaudio2-ixaudio2voice-geteffectparameters">IXAudio2Voice::GetEffectParameters</a> always returns the effect's actual current parameters. However, these may not match the parameters set by the most recent call to <b>IXAudio2Voice::SetEffectParameters</b>. The actual parameters are only changed the next time the audio engine runs after the <b>IXAudio2Voice::SetEffectParameters</b> call (or after the corresponding <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nf-xaudio2-ixaudio2-commitchanges">IXAudio2::CommitChanges</a> call, if <b>IXAudio2Voice::SetEffectParameters</b> was called with a deferred operation ID).</div>
     * <div> </div>
     * <h3><a id="Platform_Requirements"></a><a id="platform_requirements"></a><a id="PLATFORM_REQUIREMENTS"></a>Platform Requirements</h3>
     * Windows 10 (XAudio2.9); Windows 8, Windows Phone 8 (XAudio 2.8); DirectX SDK (XAudio 2.7)
     * @param {Integer} EffectIndex Zero-based index of an effect within the voice's effect chain.
     * @param {Pointer} pParameters Returns the current values of the effect-specific parameters.
     * @param {Integer} ParametersByteSize Size of the <b>pParameters</b> array in bytes.
     * @param {Integer} OperationSet Identifies this call as part of a deferred batch. See the <a href="https://docs.microsoft.com/windows/desktop/xaudio2/xaudio2-operation-sets">XAudio2 Operation Sets</a> overview for more information.
     * @returns {HRESULT} Returns S_OK if successful; otherwise, an error code. See <a href="https://docs.microsoft.com/windows/desktop/xaudio2/xaudio2-error-codes">XAudio2 Error Codes</a> for descriptions of error codes.
     * 
     * 
     * 
     * Fails with E_NOTIMPL if the effect does not support a generic parameter control interface.
     * @see https://learn.microsoft.com/windows/win32/api//content/xaudio2/nf-xaudio2-ixaudio2voice-seteffectparameters
     */
    SetEffectParameters(EffectIndex, pParameters, ParametersByteSize, OperationSet) {
        result := ComCall(6, this, "uint", EffectIndex, "ptr", pParameters, "uint", ParametersByteSize, "uint", OperationSet, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Returns the current effect-specific parameters of a given effect in the voice's effect chain.
     * @remarks
     * <b>GetEffectParameters</b> always returns the effect's actual current parameters. However, these may not match the parameters set by the most recent call to <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nf-xaudio2-ixaudio2voice-seteffectparameters">IXAudio2Voice::SetEffectParameters</a>: the actual parameters are only changed the next time the audio engine runs after the <b>IXAudio2Voice::SetEffectParameters</b> call (or after the corresponding <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nf-xaudio2-ixaudio2-commitchanges">IXAudio2::CommitChanges</a> call, if <b>IXAudio2Voice::SetEffectParameters</b> was called with a deferred operation ID).
     * 
     * 
     * 
     * <h3><a id="Platform_Requirements"></a><a id="platform_requirements"></a><a id="PLATFORM_REQUIREMENTS"></a>Platform Requirements</h3>
     * Windows 10 (XAudio2.9); Windows 8, Windows Phone 8 (XAudio 2.8); DirectX SDK (XAudio 2.7)
     * @param {Integer} EffectIndex Zero-based index of an effect within the voice's effect chain.
     * @param {Pointer} pParameters Returns the current values of the effect-specific parameters.
     * @param {Integer} ParametersByteSize Size, in bytes, of the pParameters array.
     * @returns {HRESULT} Returns S_OK if successful, an error code otherwise. See <a href="https://docs.microsoft.com/windows/desktop/xaudio2/xaudio2-error-codes">XAudio2 Error Codes</a> for descriptions of error codes.
     * 
     * 
     * 
     * Fails with E_NOTIMPL if the effect does not support a generic parameter control interface.
     * @see https://learn.microsoft.com/windows/win32/api//content/xaudio2/nf-xaudio2-ixaudio2voice-geteffectparameters
     */
    GetEffectParameters(EffectIndex, pParameters, ParametersByteSize) {
        result := ComCall(7, this, "uint", EffectIndex, "ptr", pParameters, "uint", ParametersByteSize, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets the voice's filter parameters.
     * @remarks
     * <b>SetFilterParameters</b> will fail if the voice was not created with the XAUDIO2_VOICE_USEFILTER flag.
     * 
     * 
     * 
     * This method is usable only on source and submix voices and has no effect on mastering voices.
     * 
     * <div class="alert"><b>Note</b>  <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nf-xaudio2-ixaudio2voice-getfilterparameters">IXAudio2Voice::GetFilterParameters</a> always returns this voice's actual current filter parameters. However, these may not match the parameters set by the most recent <b>IXAudio2Voice::SetFilterParameters</b> call: the actual parameters are only changed the next time the audio engine runs after the <b>IXAudio2Voice::SetFilterParameters</b> call (or after the corresponding <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nf-xaudio2-ixaudio2-commitchanges">IXAudio2::CommitChanges</a> call, if <b>IXAudio2Voice::SetFilterParameters</b> was called with a deferred operation ID).</div>
     * <div> </div>
     * <h3><a id="Platform_Requirements"></a><a id="platform_requirements"></a><a id="PLATFORM_REQUIREMENTS"></a>Platform Requirements</h3>
     * Windows 10 (XAudio2.9); Windows 8, Windows Phone 8 (XAudio 2.8); DirectX SDK (XAudio 2.7)
     * @param {Pointer<XAUDIO2_FILTER_PARAMETERS>} pParameters Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/ns-xaudio2-xaudio2_filter_parameters">XAUDIO2_FILTER_PARAMETERS</a> structure containing the filter information.
     * @param {Integer} OperationSet Identifies this call as part of a deferred batch. See the <a href="https://docs.microsoft.com/windows/desktop/xaudio2/xaudio2-operation-sets">XAudio2 Operation Sets</a> overview for more information.
     * @returns {HRESULT} Returns S_OK if successful, an error code otherwise. See <a href="https://docs.microsoft.com/windows/desktop/xaudio2/xaudio2-error-codes">XAudio2 Error Codes</a> for descriptions of error codes.
     * @see https://learn.microsoft.com/windows/win32/api//content/xaudio2/nf-xaudio2-ixaudio2voice-setfilterparameters
     */
    SetFilterParameters(pParameters, OperationSet) {
        result := ComCall(8, this, "ptr", pParameters, "uint", OperationSet, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets the voice's filter parameters.
     * @remarks
     * <b>GetFilterParameters</b> will fail if the voice was not created with the XAUDIO2_VOICE_USEFILTER flag.
     * 
     * 
     * 
     * <b>GetFilterParameters</b> always returns this voice's actual current filter parameters. However, these may not match the parameters set by the most recent <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nf-xaudio2-ixaudio2voice-setfilterparameters">IXAudio2Voice::SetFilterParameters</a> call: the actual parameters are only changed the next time the audio engine runs after the <b>IXAudio2Voice::SetFilterParameters</b> call (or after the corresponding <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nf-xaudio2-ixaudio2-commitchanges">IXAudio2::CommitChanges</a> call, if <b>IXAudio2Voice::SetFilterParameters</b> was called with a deferred operation ID).
     * 
     * 
     * 
     * <div class="alert"><b>Note</b>  <b>GetFilterParameters</b> is usable only on source and submix voices and has no effect on mastering voices.</div>
     * <div> </div>
     * <h3><a id="Platform_Requirements"></a><a id="platform_requirements"></a><a id="PLATFORM_REQUIREMENTS"></a>Platform Requirements</h3>
     * Windows 10 (XAudio2.9); Windows 8, Windows Phone 8 (XAudio 2.8); DirectX SDK (XAudio 2.7)
     * @param {Pointer<XAUDIO2_FILTER_PARAMETERS>} pParameters Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/ns-xaudio2-xaudio2_filter_parameters">XAUDIO2_FILTER_PARAMETERS</a> structure containing the filter information.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api//content/xaudio2/nf-xaudio2-ixaudio2voice-getfilterparameters
     */
    GetFilterParameters(pParameters) {
        ComCall(9, this, "ptr", pParameters)
    }

    /**
     * Sets the filter parameters on one of this voice's sends.
     * @remarks
     * <b>SetOutputFilterParameters</b> will fail if the send was not created with the XAUDIO2_SEND_USEFILTER flag. This method is usable only on sends belonging to source and submix voices and has no effect on a mastering voice's sends.
     * 
     * 
     * <div class="alert"><b>Note</b>  <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nf-xaudio2-ixaudio2voice-getoutputfilterparameters">IXAudio2Voice::GetOutputFilterParameters</a> always returns this send’s actual current filter parameters. However, these may not match the parameters set by the most recent <b>IXAudio2Voice::SetOutputFilterParameters</b> call: the actual parameters are only changed the next time the audio engine runs after the <b>IXAudio2Voice::SetOutputFilterParameters</b> call (or after the corresponding <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nf-xaudio2-ixaudio2-commitchanges">IXAudio2::CommitChanges</a> call, if <b>IXAudio2Voice::SetOutputFilterParameters</b> was called with a deferred operation ID).</div>
     * <div> </div>
     * <h3><a id="Platform_Requirements"></a><a id="platform_requirements"></a><a id="PLATFORM_REQUIREMENTS"></a>Platform Requirements</h3>
     * Windows 10 (XAudio2.9); Windows 8, Windows Phone 8 (XAudio 2.8); DirectX SDK (XAudio 2.7)
     * @param {IXAudio2Voice} pDestinationVoice <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nn-xaudio2-ixaudio2voice">IXAudio2Voice</a> pointer to the destination voice of the send whose filter parameters will be set.
     * @param {Pointer<XAUDIO2_FILTER_PARAMETERS>} pParameters Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/ns-xaudio2-xaudio2_filter_parameters">XAUDIO2_FILTER_PARAMETERS</a> structure containing the filter information.
     * @param {Integer} OperationSet Identifies this call as part of a deferred batch. See the <a href="https://docs.microsoft.com/windows/desktop/xaudio2/xaudio2-operation-sets">XAudio2 Operation Sets</a> overview for more information.
     * @returns {HRESULT} Returns S_OK if successful, an error code otherwise. See <a href="https://docs.microsoft.com/windows/desktop/xaudio2/xaudio2-error-codes">XAudio2 Error Codes</a> for descriptions of error codes.
     * @see https://learn.microsoft.com/windows/win32/api//content/xaudio2/nf-xaudio2-ixaudio2voice-setoutputfilterparameters
     */
    SetOutputFilterParameters(pDestinationVoice, pParameters, OperationSet) {
        result := ComCall(10, this, "ptr", pDestinationVoice, "ptr", pParameters, "uint", OperationSet, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Returns the filter parameters from one of this voice's sends.
     * @remarks
     * <b>GetOutputFilterParameters</b> will fail if the send was not created with the XAUDIO2_SEND_USEFILTER flag. This method is usable only on sends belonging to source and submix voices and has no effect on mastering voices’ sends.
     * 
     * 
     * 
     * <div class="alert"><b>Note</b>  <b>IXAudio2Voice::GetOutputFilterParameters</b> always returns this send’s actual current filter parameters. However, these may not match the parameters set by the most recent <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nf-xaudio2-ixaudio2voice-setoutputfilterparameters">IXAudio2Voice::SetOutputFilterParameters</a> call: the actual parameters are only changed the next time the audio engine runs after the <b>IXAudio2Voice::SetOutputFilterParameters</b> call (or after the corresponding <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nf-xaudio2-ixaudio2-commitchanges">IXAudio2::CommitChanges</a> call, if <b>IXAudio2Voice::SetOutputFilterParameters</b> was called with a deferred operation ID).</div>
     * <div> </div>
     * <h3><a id="Platform_Requirements"></a><a id="platform_requirements"></a><a id="PLATFORM_REQUIREMENTS"></a>Platform Requirements</h3>
     * Windows 10 (XAudio2.9); Windows 8, Windows Phone 8 (XAudio 2.8); DirectX SDK (XAudio 2.7)
     * @param {IXAudio2Voice} pDestinationVoice <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nn-xaudio2-ixaudio2voice">IXAudio2Voice</a> pointer to the destination voice of the send whose filter parameters will be read.
     * @param {Pointer<XAUDIO2_FILTER_PARAMETERS>} pParameters Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/ns-xaudio2-xaudio2_filter_parameters">XAUDIO2_FILTER_PARAMETERS</a> structure containing the filter information.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api//content/xaudio2/nf-xaudio2-ixaudio2voice-getoutputfilterparameters
     */
    GetOutputFilterParameters(pDestinationVoice, pParameters) {
        ComCall(11, this, "ptr", pDestinationVoice, "ptr", pParameters)
    }

    /**
     * Sets the overall volume level for the voice.
     * @remarks
     * <b>SetVolume</b> controls a voice's master input volume level. The master volume level is applied at different times depending on the type of voice. For submix and mastering voices the volume level is applied just before the voice's built in filter and effect chain is applied. For source voices the master volume level is applied after the voice's filter and effect chain is applied.
     * 
     * 
     * 
     * Volume levels are expressed as floating-point amplitude multipliers between -XAUDIO2_MAX_VOLUME_LEVEL and XAUDIO2_MAX_VOLUME_LEVEL (-2²⁴ to 2²⁴), with a maximum gain of 144.5 dB. A volume level of 1.0 means there is no attenuation or gain and 0 means silence. Negative levels can be used to invert the audio's phase. See <a href="https://docs.microsoft.com/windows/desktop/xaudio2/xaudio2-volume-and-pitch-control">XAudio2 Volume and Pitch Control</a> for additional information on volume control.
     * 
     * 
     * 
     * <div class="alert"><b>Note</b>  <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nf-xaudio2-ixaudio2voice-getvolume">IXAudio2Voice::GetVolume</a> always returns the volume most recently set by <b>IXAudio2Voice::SetVolume</b>. However, it may not actually be in effect yet: it only takes effect the next time the audio engine runs after the <b>IXAudio2Voice::SetVolume</b> call (or after the corresponding <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nf-xaudio2-ixaudio2-commitchanges">IXAudio2::CommitChanges</a> call, if <b>IXAudio2Voice::SetVolume</b> was called with a deferred operation ID).</div>
     * <div> </div>
     * <h3><a id="Platform_Requirements"></a><a id="platform_requirements"></a><a id="PLATFORM_REQUIREMENTS"></a>Platform Requirements</h3>
     * Windows 10 (XAudio2.9); Windows 8, Windows Phone 8 (XAudio 2.8); DirectX SDK (XAudio 2.7)
     * @param {Float} Volume Overall volume level to use. See Remarks for more information on volume levels.
     * @param {Integer} OperationSet Identifies this call as part of a deferred batch. See the <a href="https://docs.microsoft.com/windows/desktop/xaudio2/xaudio2-operation-sets">XAudio2 Operation Sets</a> overview for more information.
     * @returns {HRESULT} Returns S_OK if successful, an error code otherwise. See <a href="https://docs.microsoft.com/windows/desktop/xaudio2/xaudio2-error-codes">XAudio2 Error Codes</a> for descriptions of error codes.
     * @see https://learn.microsoft.com/windows/win32/api//content/xaudio2/nf-xaudio2-ixaudio2voice-setvolume
     */
    SetVolume(Volume, OperationSet) {
        result := ComCall(12, this, "float", Volume, "uint", OperationSet, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets the current overall volume level of the voice.
     * @remarks
     * Volume levels are expressed as floating-point amplitude multipliers between -224 to 224, with a maximum gain of 144.5 dB. A volume level of 1 means there is no attenuation or gain and 0 means silence. Negative levels can be used to invert the audio's phase. See <a href="https://docs.microsoft.com/windows/desktop/xaudio2/xaudio2-volume-and-pitch-control">XAudio2 Volume and Pitch Control</a> for additional information on volume control.
     * 
     * 
     * 
     * <div class="alert"><b>Note</b>  <b>GetVolume</b> always returns the volume most recently set by <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nf-xaudio2-ixaudio2voice-setvolume">IXAudio2Voice::SetVolume</a>. However, it may not actually be in effect yet: it only takes effect the next time the audio engine runs after the <b>IXAudio2Voice::SetVolume</b> call (or after the corresponding <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nf-xaudio2-ixaudio2-commitchanges">IXAudio2::CommitChanges</a> call, if <b>IXAudio2Voice::SetVolume</b> was called with a deferred operation ID).</div>
     * <div> </div>
     * <h3><a id="Platform_Requirements"></a><a id="platform_requirements"></a><a id="PLATFORM_REQUIREMENTS"></a>Platform Requirements</h3>
     * Windows 10 (XAudio2.9); Windows 8, Windows Phone 8 (XAudio 2.8); DirectX SDK (XAudio 2.7)
     * @param {Pointer<Float>} pVolume Returns the current overall volume level of the voice. See Remarks for more information on volume levels.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api//content/xaudio2/nf-xaudio2-ixaudio2voice-getvolume
     */
    GetVolume(pVolume) {
        pVolumeMarshal := pVolume is VarRef ? "float*" : "ptr"

        ComCall(13, this, pVolumeMarshal, pVolume)
    }

    /**
     * Sets the volume levels for the voice, per channel.
     * @remarks
     * <b>SetChannelVolumes</b> controls a voice's per-channel output levels and is applied just after the voice's final SRC and before its sends.
     * 
     * 
     * 
     * This method is valid only for source and submix voices, because mastering voices do not specify volume per channel.
     * 
     * 
     * 
     * Volume levels are expressed as floating-point amplitude multipliers between -XAUDIO2_MAX_VOLUME_LEVEL and XAUDIO2_MAX_VOLUME_LEVEL (-2²⁴ to 2²⁴), with a maximum gain of 144.5 dB. A volume of 1 means there is no attenuation or gain and 0 means silence. Negative levels can be used to invert the audio's phase. See <a href="https://docs.microsoft.com/windows/desktop/xaudio2/xaudio2-volume-and-pitch-control">XAudio2 Volume and Pitch Control</a> for additional information on volume control.
     * 
     * 
     * 
     * <div class="alert"><b>Note</b>  <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nf-xaudio2-ixaudio2voice-getchannelvolumes">IXAudio2Voice::GetChannelVolumes</a> always returns the volume levels most recently set by <b>IXAudio2Voice::SetChannelVolumes</b>. However, those values may not actually be in effect yet: they only take effect the next time the audio engine runs after the <b>IXAudio2Voice::SetChannelVolumes</b> call (or after the corresponding <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nf-xaudio2-ixaudio2-commitchanges">IXAudio2::CommitChanges</a> call, if <b>IXAudio2Voice::SetChannelVolumes</b> was called with a deferred operation ID).</div>
     * <div> </div>
     * <h3><a id="Platform_Requirements"></a><a id="platform_requirements"></a><a id="PLATFORM_REQUIREMENTS"></a>Platform Requirements</h3>
     * Windows 10 (XAudio2.9); Windows 8, Windows Phone 8 (XAudio 2.8); DirectX SDK (XAudio 2.7)
     * @param {Integer} Channels Number of channels in the voice.
     * @param {Pointer<Float>} pVolumes Array containing the new volumes of each channel in the voice. The array must have <i>Channels</i> elements. See Remarks for more information on volume levels.
     * @param {Integer} OperationSet Identifies this call as part of a deferred batch. See the <a href="https://docs.microsoft.com/windows/desktop/xaudio2/xaudio2-operation-sets">XAudio2 Operation Sets</a> overview for more information.
     * @returns {HRESULT} Returns S_OK if successful, an error code otherwise. See <a href="https://docs.microsoft.com/windows/desktop/xaudio2/xaudio2-error-codes">XAudio2 Error Codes</a> for descriptions of XAudio2 specific error codes.
     * @see https://learn.microsoft.com/windows/win32/api//content/xaudio2/nf-xaudio2-ixaudio2voice-setchannelvolumes
     */
    SetChannelVolumes(Channels, pVolumes, OperationSet) {
        pVolumesMarshal := pVolumes is VarRef ? "float*" : "ptr"

        result := ComCall(14, this, "uint", Channels, pVolumesMarshal, pVolumes, "uint", OperationSet, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Returns the volume levels for the voice, per channel.
     * @remarks
     * These settings are applied after the effect chain is applied. This method is valid only for source and submix voices, because mastering voices do not specify volume per channel.
     * 
     * 
     * 
     * Volume levels are expressed as floating-point amplitude multipliers between -2²⁴ to 2²⁴, with a maximum gain of 144.5 dB. A volume of 1 means there is no attenuation or gain, 0 means silence, and negative levels can be used to invert the audio's phase. See <a href="https://docs.microsoft.com/windows/desktop/xaudio2/xaudio2-volume-and-pitch-control">XAudio2 Volume and Pitch Control</a> for additional information on volume control.
     * 
     * 
     * 
     * <div class="alert"><b>Note</b>  <b>GetChannelVolumes</b> always returns the volume levels most recently set by <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nf-xaudio2-ixaudio2voice-setchannelvolumes">IXAudio2Voice::SetChannelVolumes</a>. However, those values may not actually be in effect yet: they only take effect the next time the audio engine runs after the <b>IXAudio2Voice::SetChannelVolumes</b> call (or after the corresponding <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nf-xaudio2-ixaudio2-commitchanges">IXAudio2::CommitChanges</a> call, if <b>IXAudio2Voice::SetChannelVolumes</b> was called with a deferred operation ID). </div>
     * <div> </div>
     * <h3><a id="Platform_Requirements"></a><a id="platform_requirements"></a><a id="PLATFORM_REQUIREMENTS"></a>Platform Requirements</h3>
     * Windows 10 (XAudio2.9); Windows 8, Windows Phone 8 (XAudio 2.8); DirectX SDK (XAudio 2.7)
     * @param {Integer} Channels Confirms the channel count of the voice.
     * @param {Pointer<Float>} pVolumes Returns the current volume level of each channel in the voice. The array must have at least <i>Channels</i> elements. See Remarks for more information on volume levels.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api//content/xaudio2/nf-xaudio2-ixaudio2voice-getchannelvolumes
     */
    GetChannelVolumes(Channels, pVolumes) {
        pVolumesMarshal := pVolumes is VarRef ? "float*" : "ptr"

        ComCall(15, this, "uint", Channels, pVolumesMarshal, pVolumes)
    }

    /**
     * Sets the volume level of each channel of the final output for the voice. These channels are mapped to the input channels of a specified destination voice.
     * @remarks
     * This method is valid only for source and submix voices, because mastering voices write directly to the device with no matrix mixing.
     * 
     * 
     * 
     * Volume levels are expressed as floating-point amplitude multipliers between -XAUDIO2_MAX_VOLUME_LEVEL and XAUDIO2_MAX_VOLUME_LEVEL (-2²⁴ to 2²⁴), with a maximum gain of 144.5 dB. A volume level of 1.0 means there is no attenuation or gain and 0 means silence. Negative levels can be used to invert the audio's phase. See <a href="https://docs.microsoft.com/windows/desktop/xaudio2/xaudio2-volume-and-pitch-control">XAudio2 Volume and Pitch Control</a> for additional information on volume control.
     * 
     * 
     * 
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/xaudio2/x3daudio-overview">X3DAudio</a> function <a href="https://docs.microsoft.com/windows/desktop/api/x3daudio/nf-x3daudio-x3daudiocalculate">X3DAudioCalculate</a> can produce an output matrix for use with <b>SetOutputMatrix</b> based on a sound's position and a listener's position.
     * 
     * <div class="alert"><b>Note</b>  <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nf-xaudio2-ixaudio2voice-getoutputmatrix">IXAudio2Voice::GetOutputMatrix</a> always returns the levels most recently set by <b>IXAudio2Voice::SetOutputMatrix</b>. However, they may not actually be in effect yet: they only take effect the next time the audio engine runs after the <b>IXAudio2Voice::SetOutputMatrix</b> call (or after the corresponding <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nf-xaudio2-ixaudio2-commitchanges">IXAudio2::CommitChanges</a> call, if <b>IXAudio2Voice::SetOutputMatrix</b> was called with a deferred operation ID).</div>
     * <div> </div>
     * <h3><a id="Platform_Requirements"></a><a id="platform_requirements"></a><a id="PLATFORM_REQUIREMENTS"></a>Platform Requirements</h3>
     * Windows 10 (XAudio2.9); Windows 8, Windows Phone 8 (XAudio 2.8); DirectX SDK (XAudio 2.7)
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
     * @returns {HRESULT} Returns S_OK if successful, an error code otherwise. See <a href="https://docs.microsoft.com/windows/desktop/xaudio2/xaudio2-error-codes">XAudio2 Error Codes</a> for descriptions of error codes.
     * @see https://learn.microsoft.com/windows/win32/api//content/xaudio2/nf-xaudio2-ixaudio2voice-setoutputmatrix
     */
    SetOutputMatrix(pDestinationVoice, SourceChannels, DestinationChannels, pLevelMatrix, OperationSet) {
        pLevelMatrixMarshal := pLevelMatrix is VarRef ? "float*" : "ptr"

        result := ComCall(16, this, "ptr", pDestinationVoice, "uint", SourceChannels, "uint", DestinationChannels, pLevelMatrixMarshal, pLevelMatrix, "uint", OperationSet, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets the volume level of each channel of the final output for the voice. These channels are mapped to the input channels of a specified destination voice.
     * @remarks
     * This method applies only to source and submix voices, because mastering voices write directly to the device with no matrix mixing.
     * 
     * Volume levels are expressed as floating-point amplitude multipliers between -2²⁴ to 2²⁴, with a maximum gain of 144.5 dB. A volume level of 1 means there is no attenuation or gain and 0 means silence. Negative levels can be used to invert the audio's phase. See <a href="https://docs.microsoft.com/windows/desktop/xaudio2/xaudio2-volume-and-pitch-control">XAudio2 Volume and Pitch Control</a> for additional information on volume control.
     * 
     * 
     * 
     * See <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/ksmedia/ns-ksmedia-waveformatextensible">WAVEFORMATEXTENSIBLE</a> for information on standard channel ordering.
     * 
     * 
     * 
     * <div class="alert"><b>Note</b>  <b>GetOutputMatrix</b> always returns the levels most recently set by <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nf-xaudio2-ixaudio2voice-setoutputmatrix">IXAudio2Voice::SetOutputMatrix</a>. However, they may not actually be in effect yet: they only take effect the next time the audio engine runs after the <b>IXAudio2Voice::SetOutputMatrix</b> call (or after the corresponding <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nf-xaudio2-ixaudio2-commitchanges">IXAudio2::CommitChanges</a> call, if <b>IXAudio2Voice::SetOutputMatrix</b> was called with a deferred operation ID).</div>
     * <div> </div>
     * <h3><a id="Platform_Requirements"></a><a id="platform_requirements"></a><a id="PLATFORM_REQUIREMENTS"></a>Platform Requirements</h3>
     * Windows 10 (XAudio2.9); Windows 8, Windows Phone 8 (XAudio 2.8); DirectX SDK (XAudio 2.7)
     * @param {IXAudio2Voice} pDestinationVoice Pointer specifying the destination <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nn-xaudio2-ixaudio2voice">IXAudio2Voice</a> to retrieve the output matrix for.
     * 
     * <div class="alert"><b>Note</b>  If the voice sends to a single target voice then specifying NULL will cause <b>GetOutputMatrix</b> to operate on that target voice.</div>
     * <div> </div>
     * @param {Integer} SourceChannels Confirms the output channel count of the voice. This is the number of channels that are produced by the last effect in the chain.
     * @param {Integer} DestinationChannels Confirms the input channel count of the destination voice.
     * @param {Pointer<Float>} pLevelMatrix Array of [<i>SourceChannels</i> * <i>DestinationChannels</i>] volume levels sent to the destination voice. The level sent from source channel S to destination channel D is returned in the form <i>pLevelMatrix</i>[<i>DestinationChannels</i> × S + D]. See Remarks for more information on volume levels.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api//content/xaudio2/nf-xaudio2-ixaudio2voice-getoutputmatrix
     */
    GetOutputMatrix(pDestinationVoice, SourceChannels, DestinationChannels, pLevelMatrix) {
        pLevelMatrixMarshal := pLevelMatrix is VarRef ? "float*" : "ptr"

        ComCall(17, this, "ptr", pDestinationVoice, "uint", SourceChannels, "uint", DestinationChannels, pLevelMatrixMarshal, pLevelMatrix)
    }

    /**
     * Destroys the voice. If necessary, stops the voice and removes it from the XAudio2 graph.
     * @remarks
     * If any other voice is currently sending audio to this voice, the method fails.
     * 
     * 
     * 
     * <b>DestroyVoice</b> waits for the audio processing thread to be idle, so it can take a little while (typically no more than a couple of milliseconds). This is necessary to guarantee that the voice will no longer make any callbacks or read any audio data, so the application can safely free up these resources as soon as the call returns.
     * 
     * 
     * 
     * To avoid title thread interruptions from a blocking <b>DestroyVoice</b> call, the application can destroy voices on a separate non-critical thread, or the application can use voice pooling strategies to reuse voices rather than destroying them. Note that voices can only be reused with audio that has the same data format and the same number of channels the voice was created with. A voice can play audio data with different sample rates than that of the voice by calling <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nf-xaudio2-ixaudio2sourcevoice-setfrequencyratio">IXAudio2SourceVoice::SetFrequencyRatio</a> with an appropriate ratio parameter.
     * 
     * 
     * 
     * It is invalid to call <b>DestroyVoice</b> from within a callback (that is, <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nn-xaudio2-ixaudio2enginecallback">IXAudio2EngineCallback</a> or <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nn-xaudio2-ixaudio2voicecallback">IXAudio2VoiceCallback</a>).
     * 
     * <h3><a id="Platform_Requirements"></a><a id="platform_requirements"></a><a id="PLATFORM_REQUIREMENTS"></a>Platform Requirements</h3>
     * Windows 10 (XAudio2.9); 
     *             Windows 8, Windows Phone 8 (XAudio 2.8); DirectX SDK (XAudio 2.7)
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api//content/xaudio2/nf-xaudio2-ixaudio2voice-destroyvoice
     */
    DestroyVoice() {
        ComCall(18, this)
    }
}
