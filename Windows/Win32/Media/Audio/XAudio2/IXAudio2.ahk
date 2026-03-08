#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IXAudio2SourceVoice.ahk
#Include .\IXAudio2SubmixVoice.ahk
#Include .\IXAudio2MasteringVoice.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * IXAudio2 is the interface for the XAudio2 object that manages all audio engine states, the audio processing thread, the voice graph, and so forth.
 * @remarks
 * The DirectX SDK versions of XAUDIO2 included three member functions that are not present in the Windows 8 version: <b>GetDeviceCount</b>, <b>GetDeviceDetails</b>, and <b>Initialize</b>. These enumeration methods are no longer provided and standard Windows Audio APIs should be used for device enumeration instead.
 * 
 * <h3><a id="Platform_Requirements"></a><a id="platform_requirements"></a><a id="PLATFORM_REQUIREMENTS"></a>Platform Requirements</h3>
 * Windows 8, Windows Phone 8 (XAudio 2.8); DirectX SDK (XAudio 2.7)
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
     * Adds an IXAudio2EngineCallback pointer to the XAudio2 engine callback list.
     * @remarks
     * This method can be called multiple times, allowing different components or layers of the same application to manage their own engine callback implementations separately.
     * 
     * 
     * 
     * It is invalid to call <b>RegisterForCallbacks</b> from within a callback (that is, <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nn-xaudio2-ixaudio2enginecallback">IXAudio2EngineCallback</a> or <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nn-xaudio2-ixaudio2voicecallback">IXAudio2VoiceCallback</a>). If <b>RegisterForCallbacks</b> is called within a callback, it returns XAUDIO2_E_INVALID_CALL.
     * 
     * 
     * 
     * <h3><a id="Platform_Requirements"></a><a id="platform_requirements"></a><a id="PLATFORM_REQUIREMENTS"></a>Platform Requirements</h3>
     * Windows 8, Windows Phone 8 (XAudio 2.8); DirectX SDK (XAudio 2.7)
     * @param {IXAudio2EngineCallback} pCallback <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nn-xaudio2-ixaudio2enginecallback">IXAudio2EngineCallback</a> pointer to add to the <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nn-xaudio2-ixaudio2">XAudio2</a> engine callback list.
     * @returns {HRESULT} Returns S_OK if successful, an error code otherwise. See <a href="https://docs.microsoft.com/windows/desktop/xaudio2/xaudio2-error-codes">XAudio2 Error Codes</a> for descriptions of XAudio2 specific error codes.
     * @see https://learn.microsoft.com/windows/win32/api/xaudio2/nf-xaudio2-ixaudio2-registerforcallbacks
     */
    RegisterForCallbacks(pCallback) {
        result := ComCall(3, this, "ptr", pCallback, "HRESULT")
        return result
    }

    /**
     * Removes an IXAudio2EngineCallback pointer from the XAudio2 engine callback list.
     * @remarks
     * It is invalid to call <b>UnregisterForCallbacks</b> from within a callback (that is, <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nn-xaudio2-ixaudio2enginecallback">IXAudio2EngineCallback</a> or <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nn-xaudio2-ixaudio2voicecallback">IXAudio2VoiceCallback</a>). 
     * 
     * <h3><a id="Platform_Requirements"></a><a id="platform_requirements"></a><a id="PLATFORM_REQUIREMENTS"></a>Platform Requirements</h3>
     * Windows 10 (XAudio2.9); Windows 8, Windows Phone 8 (XAudio 2.8); DirectX SDK (XAudio 2.7)
     * @param {IXAudio2EngineCallback} pCallback <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nn-xaudio2-ixaudio2enginecallback">IXAudio2EngineCallback</a> pointer to remove from the <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nn-xaudio2-ixaudio2">XAudio2</a> engine callback list. 
     * If the given pointer is present more than once in the list, only the first instance in the list will be removed.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/xaudio2/nf-xaudio2-ixaudio2-unregisterforcallbacks
     */
    UnregisterForCallbacks(pCallback) {
        ComCall(4, this, "ptr", pCallback)
    }

    /**
     * Creates and configures a source voice.
     * @remarks
     * Source voices read audio data from the client. They process the data and send it to the XAudio2 processing graph.
     * 
     * 
     * 
     * A source voice includes a variable-rate sample rate conversion, to convert data from the source format sample rate to the output rate required for the voice send list. If you use a NULL send list, the target sample rate will be the mastering voice's input sample rate. If you provide a single voice in pSendList, that voice's input sample rate is the target rate. If you provide multiple voices in the pSendList, all the source voice's output voices must be running at the same input sample rate.
     * 
     * 
     * 
     * You cannot create any source or submix voices until a mastering voice exists, and you cannot destroy a mastering voice if any source or submix voices still exist.
     * 
     * 
     * 
     * Source voices are always processed before any submix or mastering voices. This means that you do not need a ProcessingStage parameter to control the processing order.
     * 
     * 
     * 
     * When first created, source voices are in the stopped state.
     * 
     * 
     * 
     * XAudio2 uses an internal memory pooler for voices with the same format. This means memory allocation for voices will occur less frequently as more voices are created and then destroyed. To minimize just-in-time allocations, a title can create the anticipated maximum number of voices needed up front, and then delete them as necessary. Voices will then be reused from the XAudio2 pool. The memory pool is tied to an XAudio2 engine instance. You can reclaim all the memory used by an instance of the XAudio2 engine by destroying the XAudio2 object and recreating it as necessary (forcing the memory pool to grow via preallocation would have to be reapplied as needed).
     * 
     * 
     * 
     * It is invalid to call <b>CreateSourceVoice</b> from within a callback (that is, <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nn-xaudio2-ixaudio2enginecallback">IXAudio2EngineCallback</a> or <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nn-xaudio2-ixaudio2voicecallback">IXAudio2VoiceCallback</a>). If you call <b>CreateSourceVoice</b> within a callback, it returns XAUDIO2_E_INVALID_CALL.
     * 
     * 
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/ns-xaudio2-xaudio2_effect_chain">XAUDIO2_EFFECT_CHAIN</a> that is passed in as the pEffectChain argument and any <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/ns-xaudio2-xaudio2_effect_descriptor">XAUDIO2_EFFECT_DESCRIPTOR</a> information contained within it are no longer needed after <b>CreateSourceVoice</b> successfully completes, and may be deleted immediately after <b>CreateSourceVoice</b> is called.
     * 
     * 
     * <h3><a id="Platform_Requirements"></a><a id="platform_requirements"></a><a id="PLATFORM_REQUIREMENTS"></a>Platform Requirements</h3>
     * Windows 10 (XAudio2.9); 
     *             Windows 8, Windows Phone 8 (XAudio 2.8); DirectX SDK (XAudio 2.7)
     * @param {Pointer<WAVEFORMATEX>} pSourceFormat Pointer to a one of the structures in the table below. This structure contains the expected format for all audio buffers submitted to the source voice. 
     * XAudio2 supports PCM and ADPCM voice types. 
     * 
     * <table>
     * <tr>
     * <th>Format tag</th>
     * <th>Wave format structure</th>
     * <th>Size (in bytes)</th>
     * </tr>
     * <tr>
     * <td>WAVE_FORMAT_PCM (0x0001) </td>
     * <td>
     * <a href="https://docs.microsoft.com/previous-versions/dd743663(v=vs.85)">PCMWAVEFORMAT</a>
     * </td>
     * <td>16</td>
     * </tr>
     * <tr>
     * <td>-or-</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/win32/api/mmreg/ns-mmreg-waveformatex">WAVEFORMATEX</a>
     * </td>
     * <td>18</td>
     * </tr>
     * <tr>
     * <td>WAVE_FORMAT_IEEE_FLOAT (0x0003) [32-bit]</td>
     * <td>
     * <a href="https://docs.microsoft.com/previous-versions/dd743663(v=vs.85)">PCMWAVEFORMAT</a>
     * </td>
     * <td>18</td>
     * </tr>
     * <tr>
     * <td>WAVE_FORMAT_ADPCM (0x0002) [MS-ADPCM]</td>
     * <td>
     * <a href="https://docs.microsoft.com/previous-versions/dd743663(v=vs.85)">ADPCMWAVEFORMAT</a>
     * </td>
     * <td>50</td>
     * </tr>
     * <tr>
     * <td>WAVE_FORMAT_EXTENSIBLE (0xFFFE)</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/ksmedia/ns-ksmedia-waveformatextensible">WAVEFORMATEXTENSIBLE</a>
     * </td>
     * <td>40</td>
     * </tr>
     * </table>
     *  
     * 
     * XAudio2 supports the following PCM formats.
     * 
     * 
     * <ul>
     * <li>8-bit (unsigned) integer PCM
     * 
     * </li>
     * <li>16-bit integer PCM (optimal format for XAudio2)
     * 
     * </li>
     * <li>20-bit integer PCM (either in 24 or 32 bit containers)
     * 
     * </li>
     * <li>24-bit integer PCM (either in 24 or 32 bit containers)
     * 
     * </li>
     * <li>32-bit integer PCM
     * 
     * </li>
     * <li>32-bit float PCM (preferred format after 16-bit integer)
     * </li>
     * </ul>
     * The number of channels in a source voice must be less than or equal to XAUDIO2_MAX_AUDIO_CHANNELS. The sample rate of a source voice must be between XAUDIO2_MIN_SAMPLE_RATE and XAUDIO2_MAX_SAMPLE_RATE.
     * 
     * <div class="alert"><b>Note</b>  PCM data formats such as <a href="https://docs.microsoft.com/previous-versions/dd743663(v=vs.85)">PCMWAVEFORMAT</a> and  <b>ADPCMWAVEFORMAT</b> that require more information than provided by <b>WAVEFORMATEX</b> have a <b>WAVEFORMATEX</b> structure as the first member in their format structures. When you create a source voice with one of those formats, cast the format's structure as a <b>WAVEFORMATEX</b> structure and use it as the value for <i>pSourceFormat</i>.</div>
     * <div> </div>
     * @param {Integer} Flags Flags that specify the behavior of the source voice. A flag can be 0 or a combination of one or more of the following:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>XAUDIO2_VOICE_NOPITCH</td>
     * <td>No pitch control is available on the voice. </td>
     * </tr>
     * <tr>
     * <td>XAUDIO2_VOICE_NOSRC</td>
     * <td>No sample rate conversion is available on the voice. 
     *          The voice's outputs must have the same sample rate.<div class="alert"><b>Note</b>  The XAUDIO2_VOICE_NOSRC flag causes the voice to behave as though the XAUDIO2_VOICE_NOPITCH flag also is specified.</div>
     * <div> </div>
     * </td>
     * </tr>
     * <tr>
     * <td>XAUDIO2_VOICE_USEFILTER</td>
     * <td>The filter effect should be available on this voice. </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  The XAUDIO2_VOICE_MUSIC flag is not supported on Windows.</div>
     * <div> </div>
     * @param {Float} MaxFrequencyRatio Highest allowable frequency ratio that can be set on this voice. The value for this argument must be between XAUDIO2_MIN_FREQ_RATIO and XAUDIO2_MAX_FREQ_RATIO. Subsequent calls to <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nf-xaudio2-ixaudio2sourcevoice-setfrequencyratio">IXAudio2SourceVoice::SetFrequencyRatio</a> are clamped between XAUDIO2_MIN_FREQ_RATIO and <b>MaxFrequencyRatio</b>. 
     * The maximum value for this argument is defined as XAUDIO2_MAX_FREQ_RATIO, which allows pitch to be raised by up to 10 octaves.
     * 
     * 
     * 
     * If <i>MaxFrequencyRatio</i> is less than 1.0, the voice will use that ratio immediately after being created (rather than the default of 1.0).
     * 
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Xbox 360</th>
     * </tr>
     * <tr>
     * <td>For XMA voices, there is one more restriction on the <i>MaxFrequencyRatio</i> argument and the voice's sample rate. The product of these two numbers cannot exceed XAUDIO2_MAX_RATIO_TIMES_RATE_XMA_MONO for one-channel voices or XAUDIO2_MAX_RATIO_TIMES_RATE_XMA_MULTICHANNEL for voices with any other number of channels. If the value specified for <i>MaxFrequencyRatio</i> is too high for the specified format, the call to <b>CreateSourceVoice</b> fails and produces a debug message.
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  You can use the lowest possible <i>MaxFrequencyRatio</i> value to reduce XAudio2's memory usage.</div>
     * <div> </div>
     * @param {IXAudio2VoiceCallback} pCallback Pointer to a client-provided callback interface, <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nn-xaudio2-ixaudio2voicecallback">IXAudio2VoiceCallback</a>.
     * @param {Pointer<XAUDIO2_VOICE_SENDS>} pSendList Pointer to a list of <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/ns-xaudio2-xaudio2_voice_sends">XAUDIO2_VOICE_SENDS</a> structures that describe the set of destination voices for the source voice. If pSendList is NULL, the send list defaults to a single output to the first mastering voice created.
     * @param {Pointer<XAUDIO2_EFFECT_CHAIN>} pEffectChain Pointer to a list of <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/ns-xaudio2-xaudio2_effect_chain">XAUDIO2_EFFECT_CHAIN</a> structures that describe an effect chain to use in the source voice.
     * @returns {IXAudio2SourceVoice} If successful, returns a pointer to the new <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nn-xaudio2-ixaudio2sourcevoice">IXAudio2SourceVoice</a> object.
     * @see https://learn.microsoft.com/windows/win32/api/xaudio2/nf-xaudio2-ixaudio2-createsourcevoice
     */
    CreateSourceVoice(pSourceFormat, Flags, MaxFrequencyRatio, pCallback, pSendList, pEffectChain) {
        result := ComCall(5, this, "ptr*", &ppSourceVoice := 0, "ptr", pSourceFormat, "uint", Flags, "float", MaxFrequencyRatio, "ptr", pCallback, "ptr", pSendList, "ptr", pEffectChain, "HRESULT")
        return IXAudio2SourceVoice(ppSourceVoice)
    }

    /**
     * Creates and configures a submix voice.
     * @remarks
     * Submix voices receive the output of one or more source or submix voices. They process the output, and then send it to another submix voice or to a mastering voice.
     * 
     * 
     * 
     * A submix voice performs a sample rate conversion from the input sample rate to the input rate of its output voices in <i>pSendList</i>. If you specify multiple voice sends, they must all have the input same sample rate.
     * 
     * 
     * 
     * You cannot create any source or submix voices until a mastering voice exists, and you cannot destroy a mastering voice if any source or submix voices still exist.
     * 
     * 
     * 
     * When first created, submix voices are in the started state.
     * 
     * 
     * 
     * XAudio2 uses an internal memory pooler for voices with the same format. This means that memory allocation for voices will occur less frequently as more voices are created and then destroyed. To minimize just-in-time allocations, a title can create the anticipated maximum number of voices needed up front, and then delete them as necessary. Voices will then be reused from the XAudio2 pool. The memory pool is tied to an XAudio2 engine instance. You can reclaim all the memory used by an instance of the XAudio2 engine by destroying the XAudio2 object and recreating it as necessary (forcing the memory pool to grow via preallocation would have to be reapplied as needed).
     * 
     * 
     * 
     * It is invalid to call <b>CreateSubmixVoice</b> from within a callback (that is, <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nn-xaudio2-ixaudio2enginecallback">IXAudio2EngineCallback</a> or <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nn-xaudio2-ixaudio2voicecallback">IXAudio2VoiceCallback</a>). If you call <b>CreateSubmixVoice</b> within a callback, it returns XAUDIO2_E_INVALID_CALL.
     * 
     * 
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/ns-xaudio2-xaudio2_effect_chain">XAUDIO2_EFFECT_CHAIN</a> that is passed in as the <i>pEffectChain</i> argument and any <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/ns-xaudio2-xaudio2_effect_descriptor">XAUDIO2_EFFECT_DESCRIPTOR</a> information contained within it are no longer needed after <b>CreateSubmixVoice</b> successfully completes, and may be deleted immediately after <b>CreateSubmixVoice</b> is called.
     * 
     * <h3><a id="Platform_Requirements"></a><a id="platform_requirements"></a><a id="PLATFORM_REQUIREMENTS"></a>Platform Requirements</h3>
     * Windows 10 (XAudio2.9); Windows 8, Windows Phone 8 (XAudio 2.8); DirectX SDK (XAudio 2.7)
     * @param {Integer} InputChannels Number of channels in the input audio data of the submix voice. 
     * <i>InputChannels</i> must be less than or equal to XAUDIO2_MAX_AUDIO_CHANNELS.
     * @param {Integer} InputSampleRate Sample rate of the input audio data of submix voice. This rate must be a multiple of XAUDIO2_QUANTUM_DENOMINATOR. <i>InputSampleRate</i> must be between XAUDIO2_MIN_SAMPLE_RATE and XAUDIO2_MAX_SAMPLE_RATE.
     * @param {Integer} Flags Flags that specify the behavior of the submix voice. It can be 0 or the following:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>XAUDIO2_VOICE_USEFILTER</td>
     * <td>The filter effect should be available on this voice.</td>
     * </tr>
     * </table>
     * @param {Integer} ProcessingStage An arbitrary number that specifies when this voice is processed with respect to other submix voices, if the XAudio2 engine is running other submix voices. The voice is processed after all other voices that include a smaller <i>ProcessingStage</i> value and before all other voices that include a larger <i>ProcessingStage</i> value. Voices that include the same <i>ProcessingStage</i> value are processed in any order. A submix voice cannot send to another submix voice with a lower or equal <i>ProcessingStage</i> value. This prevents audio being lost due to a submix cycle.
     * @param {Pointer<XAUDIO2_VOICE_SENDS>} pSendList Pointer to a list of <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/ns-xaudio2-xaudio2_voice_sends">XAUDIO2_VOICE_SENDS</a> structures that describe the set of destination voices for the submix voice. If <i>pSendList</i> is NULL, the send list will default to a single output to the first mastering voice created.
     * @param {Pointer<XAUDIO2_EFFECT_CHAIN>} pEffectChain Pointer to a list of <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/ns-xaudio2-xaudio2_effect_chain">XAUDIO2_EFFECT_CHAIN</a> structures that describe an effect chain to use in the submix voice.
     * @returns {IXAudio2SubmixVoice} On success, returns a pointer to the new <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nn-xaudio2-ixaudio2submixvoice">IXAudio2SubmixVoice</a> object.
     * @see https://learn.microsoft.com/windows/win32/api/xaudio2/nf-xaudio2-ixaudio2-createsubmixvoice
     */
    CreateSubmixVoice(InputChannels, InputSampleRate, Flags, ProcessingStage, pSendList, pEffectChain) {
        result := ComCall(6, this, "ptr*", &ppSubmixVoice := 0, "uint", InputChannels, "uint", InputSampleRate, "uint", Flags, "uint", ProcessingStage, "ptr", pSendList, "ptr", pEffectChain, "HRESULT")
        return IXAudio2SubmixVoice(ppSubmixVoice)
    }

    /**
     * Creates and configures a mastering voice.
     * @remarks
     * Mastering voices receive the output of one or more source or submix voices. They process the data, and send it to the audio output device.
     * 
     * 
     * 
     * Typically, you should create a mastering voice with an input sample rate that will be used by the majority of the title's audio content. The mastering voice performs a sample rate conversion from this input sample rate to the actual device output rate.
     * 
     * 
     * 
     * You cannot create a source or submix voices until a mastering voice exists. You cannot destroy a mastering voice if any source or submix voices still exist.
     * 
     * 
     * 
     * Mastering voices are always processed after all source and submix voices. This means that you need not specify a <i>ProcessingStage</i> parameter to control the processing order.
     * 
     * 
     * 
     * XAudio2 only allows one mastering voice to exist at once. If you attempt to create more than one voice, XAUDIO2_E_INVALID_CALL is returned. If an additional mastering voice is needed, for example for an output device with a different audio category set, you will need to create an additional XAudio2 instance.
     * 
     * 
     * 
     * When first created, mastering voices are in the started state.
     * 
     * 
     * 
     * It is invalid to call <b>CreateMasteringVoice</b> from within a callback (that is, <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nn-xaudio2-ixaudio2enginecallback">IXAudio2EngineCallback</a> or <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nn-xaudio2-ixaudio2voicecallback">IXAudio2VoiceCallback</a>). If you call <b>CreateMasteringVoice</b> within a callback, it returns XAUDIO2_E_INVALID_CALL.
     * 
     * 
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/ns-xaudio2-xaudio2_effect_chain">XAUDIO2_EFFECT_CHAIN</a> that is passed in as the pEffectChain argument and any <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/ns-xaudio2-xaudio2_effect_descriptor">XAUDIO2_EFFECT_DESCRIPTOR</a> information contained within it are no longer needed after <b>CreateMasteringVoice</b> successfully completes, and may be deleted immediately after <b>CreateMasteringVoice</b> is called.
     * 
     * 
     * 
     * Note that the DirectX SDK XAUDIO2 version of <b>CreateMasteringVoice</b> took a DeviceIndex argument instead of a szDeviceId and a StreamCategory argument. This reflects the changes needed for the standard Windows device enumeration model.
     * 
     * <h3><a id="Platform_Requirements"></a><a id="platform_requirements"></a><a id="PLATFORM_REQUIREMENTS"></a>Platform Requirements</h3>
     * Windows 10 (XAudio2.9); 
     *             Windows 8, Windows Phone 8 (XAudio 2.8); DirectX SDK (XAudio 2.7)
     * @param {Integer} InputChannels Number of channels the mastering voice expects in its input audio. 
     * <i>InputChannels</i> must be less than or equal to XAUDIO2_MAX_AUDIO_CHANNELS.
     * 
     * 
     * 
     * You can set <i>InputChannels</i> to XAUDIO2_DEFAULT_CHANNELS, which causes XAudio2 to try to detect the system speaker configuration setup.
     * @param {Integer} InputSampleRate Sample rate of the input audio data of the mastering voice. This rate must be a multiple of XAUDIO2_QUANTUM_DENOMINATOR. 
     * <i>InputSampleRate</i> must be between XAUDIO2_MIN_SAMPLE_RATE and XAUDIO2_MAX_SAMPLE_RATE.
     * 
     * 
     * 
     * You can set <i>InputSampleRate</i> to XAUDIO2_DEFAULT_SAMPLERATE, with the default being determined by the current platform.
     * 
     * 
     * 
     * Windows XP defaults to 44100.
     * 
     * 
     * 
     * Windows Vista and Windows 7 default to the setting specified in the Sound Control Panel. The default for this setting is 44100 (or 48000 if required by the driver).
     * 
     * Flags
     * @param {Integer} Flags Flags that specify the behavior of the mastering voice. This can be 0 or ``XAUDIO2_NO_VIRTUAL_AUDIO_CLIENT``.
     * @param {PWSTR} szDeviceId Identifier of the device to receive the output audio. Specifying the default value of NULL causes XAudio2 to select the global default audio device. On Windows 10 or later, NULL will also opt-in to the WASAPI virtualized client unless `XAUDIO2_NO_VIRTUAL_AUDIO_CLIENT` is passed in Flags.
     * @param {Pointer<XAUDIO2_EFFECT_CHAIN>} pEffectChain Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/ns-xaudio2-xaudio2_effect_chain">XAUDIO2_EFFECT_CHAIN</a> structure that describes an effect chain to use in the mastering voice, or NULL to use no effects.
     * @param {Integer} StreamCategory The audio stream category to use for this mastering voice.
     * @returns {IXAudio2MasteringVoice} If successful, returns a pointer to the new <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nn-xaudio2-ixaudio2masteringvoice">IXAudio2MasteringVoice</a> object.
     * @see https://learn.microsoft.com/windows/win32/api/xaudio2/nf-xaudio2-ixaudio2-createmasteringvoice
     */
    CreateMasteringVoice(InputChannels, InputSampleRate, Flags, szDeviceId, pEffectChain, StreamCategory) {
        szDeviceId := szDeviceId is String ? StrPtr(szDeviceId) : szDeviceId

        result := ComCall(7, this, "ptr*", &ppMasteringVoice := 0, "uint", InputChannels, "uint", InputSampleRate, "uint", Flags, "ptr", szDeviceId, "ptr", pEffectChain, "int", StreamCategory, "HRESULT")
        return IXAudio2MasteringVoice(ppMasteringVoice)
    }

    /**
     * Starts the audio processing thread.
     * @remarks
     * After <b>StartEngine</b> is called, all started voices begin to consume audio. All enabled effects start running, and the resulting audio is sent to any connected output devices. When XAudio2 is first initialized, the engine is already in the started state.
     * 
     * 
     * 
     * It is invalid to call <b>StartEngine</b> from within a callback (that is, <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nn-xaudio2-ixaudio2enginecallback">IXAudio2EngineCallback</a> or <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nn-xaudio2-ixaudio2voicecallback">IXAudio2VoiceCallback</a>). If <b>StartEngine</b> is called within a callback, it returns XAUDIO2_E_INVALID_CALL.
     * 
     * 
     * 
     * <h3><a id="Platform_Requirements"></a><a id="platform_requirements"></a><a id="PLATFORM_REQUIREMENTS"></a>Platform Requirements</h3>
     * Windows 10 (XAudio2.9); Windows 8, Windows Phone 8 (XAudio 2.8); DirectX SDK (XAudio 2.7)
     * @returns {HRESULT} Returns S_OK if successful, an error code otherwise. See <a href="https://docs.microsoft.com/windows/desktop/xaudio2/xaudio2-error-codes">XAudio2 Error Codes</a> for descriptions of XAudio2 specific error codes.
     * @see https://learn.microsoft.com/windows/win32/api/xaudio2/nf-xaudio2-ixaudio2-startengine
     */
    StartEngine() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * Stops the audio processing thread.
     * @remarks
     * When <b>StopEngine</b> is called, all output is stopped immediately. However, the audio graph is left untouched, preserving effect parameters, effect histories (for example, the data stored by a reverb effect in order to emit echoes of a previous sound), voice states, pending source buffers, cursor positions, and so forth. When the engine is restarted, the resulting audio output will be identical—apart from a period of silence—to the output that would have been produced if the engine had never been stopped.
     * 
     * 
     * 
     * It is invalid to call <b>StopEngine</b> from within a callback (that is, <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nn-xaudio2-ixaudio2enginecallback">IXAudio2EngineCallback</a> or <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nn-xaudio2-ixaudio2voicecallback">IXAudio2VoiceCallback</a>).
     * 
     * <h3><a id="Platform_Requirements"></a><a id="platform_requirements"></a><a id="PLATFORM_REQUIREMENTS"></a>Platform Requirements</h3>
     * Windows 10 (XAudio2.9); 
     *             Windows 8, Windows Phone 8 (XAudio 2.8); DirectX SDK (XAudio 2.7)
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/xaudio2/nf-xaudio2-ixaudio2-stopengine
     */
    StopEngine() {
        ComCall(9, this)
    }

    /**
     * Atomically applies a set of operations that are tagged with a given identifier.
     * @remarks
     * <b>CommitChanges</b> does nothing if no operations are tagged with the given identifier.
     * 
     * 
     * 
     * See the <a href="https://docs.microsoft.com/windows/desktop/xaudio2/xaudio2-operation-sets">XAudio2 Operation Sets</a> overview about working with <b>CommitChanges</b> and XAudio2 interface methods that may be deferred.
     * 
     * 
     * <h3><a id="Platform_Requirements"></a><a id="platform_requirements"></a><a id="PLATFORM_REQUIREMENTS"></a>Platform Requirements</h3>
     * Windows 10 (XAudio2.9); Windows 8, Windows Phone 8 (XAudio 2.8); DirectX SDK (XAudio 2.7)
     * @param {Integer} OperationSet Identifier of the set of operations to be applied. To commit all pending operations, pass <b>XAUDIO2_COMMIT_ALL</b>.
     * @returns {HRESULT} Returns S_OK if successful; returns an error code otherwise. See <a href="https://docs.microsoft.com/windows/desktop/xaudio2/xaudio2-error-codes">XAudio2 Error Codes</a> for descriptions of XAudio2 specific error codes.
     * @see https://learn.microsoft.com/windows/win32/api/xaudio2/nf-xaudio2-ixaudio2-commitchanges
     */
    CommitChanges(OperationSet) {
        result := ComCall(10, this, "uint", OperationSet, "HRESULT")
        return result
    }

    /**
     * Returns current resource usage details, such as available memory or CPU usage.
     * @remarks
     * For specific information on the statistics returned by <b>GetPerformanceData</b>, see the <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/ns-xaudio2-xaudio2_performance_data">XAUDIO2_PERFORMANCE_DATA</a> structure reference.
     * 
     * 
     * 
     * <h3><a id="Platform_Requirements"></a><a id="platform_requirements"></a><a id="PLATFORM_REQUIREMENTS"></a>Platform Requirements</h3>
     * Windows 10 (XAudio2.9); Windows 8, Windows Phone 8 (XAudio 2.8); DirectX SDK (XAudio 2.7)
     * @param {Pointer<XAUDIO2_PERFORMANCE_DATA>} pPerfData On success, pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/ns-xaudio2-xaudio2_performance_data">XAUDIO2_PERFORMANCE_DATA</a> structure that is returned.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/xaudio2/nf-xaudio2-ixaudio2-getperformancedata
     */
    GetPerformanceData(pPerfData) {
        ComCall(11, this, "ptr", pPerfData)
    }

    /**
     * Changes global debug logging options for XAudio2.
     * @remarks
     * SetDebugConfiguration sets the debug configuration for the given instance of XAudio2 engine. See <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/ns-xaudio2-xaudio2_debug_configuration">XAUDIO2_DEBUG_CONFIGURATION</a> Structure for supported debug options. By default, XAudio2 does not log debug output or break on errors. 
     * 
     * <h3><a id="Platform_Requirements"></a><a id="platform_requirements"></a><a id="PLATFORM_REQUIREMENTS"></a>Platform Requirements</h3>
     * Windows 10 (XAudio2.9); Windows 8, Windows Phone 8 (XAudio 2.8); DirectX SDK (XAudio 2.7)
     * @param {Pointer<XAUDIO2_DEBUG_CONFIGURATION>} pDebugConfiguration Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/ns-xaudio2-xaudio2_debug_configuration">XAUDIO2_DEBUG_CONFIGURATION</a> structure that contains the new debug configuration.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/xaudio2/nf-xaudio2-ixaudio2-setdebugconfiguration
     */
    SetDebugConfiguration(pDebugConfiguration) {
        static pReserved := 0 ;Reserved parameters must always be NULL

        ComCall(12, this, "ptr", pDebugConfiguration, "ptr", pReserved)
    }
}
