#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IAudioClient2.ahk

/**
 * The IAudioClient3 interface is derived from the IAudioClient2 interface, with a set of additional methods that enable a Windows Audio Session API (WASAPI) audio client to query for the audio engine's supported periodicities and current periodicity as well as request initialization a shared audio stream with a specified periodicity.
 * @see https://docs.microsoft.com/windows/win32/api//audioclient/nn-audioclient-iaudioclient3
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class IAudioClient3 extends IAudioClient2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAudioClient3
     * @type {Guid}
     */
    static IID => Guid("{7ed4ee07-8e67-4cd4-8c1a-2b7a5987ad42}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 18

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSharedModeEnginePeriod", "GetCurrentSharedModeEnginePeriod", "InitializeSharedAudioStream"]

    /**
     * Returns the range of periodicities supported by the engine for the specified stream format.
     * @param {Pointer<WAVEFORMATEX>} pFormat Type: <b>const <a href="https://docs.microsoft.com/previous-versions/dd757713(v=vs.85)">WAVEFORMATEX</a>*</b>
     * 
     * The stream format for which the supported periodicities are queried.
     * @param {Pointer<Integer>} pDefaultPeriodInFrames Type: <b>UINT32*</b>
     * 
     * The default period with which the engine will wake the client for 
     *     transferring audio samples
     * @param {Pointer<Integer>} pFundamentalPeriodInFrames Type: <b>UINT32*</b>
     * 
     * The fundamental period with which the engine will wake the client for 
     *     transferring audio samples. When setting the audio engine periodicity, you must use an integral multiple of this value.
     * @param {Pointer<Integer>} pMinPeriodInFrames Type: <b>UINT32*</b>
     * 
     * The shortest period, in audio frames, with which the audio engine will wake the client for 
     *     transferring audio samples.
     * @param {Pointer<Integer>} pMaxPeriodInFrames Type: <b>UINT32*</b>
     * 
     * The longest period, in audio frames,  with which the audio engine will wake the client for 
     *     transferring audio samples.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns <b>S_OK</b> to indicate that it has completed successfully. Otherwise it returns an appropriate error code.
     * @see https://docs.microsoft.com/windows/win32/api//audioclient/nf-audioclient-iaudioclient3-getsharedmodeengineperiod
     */
    GetSharedModeEnginePeriod(pFormat, pDefaultPeriodInFrames, pFundamentalPeriodInFrames, pMinPeriodInFrames, pMaxPeriodInFrames) {
        pDefaultPeriodInFramesMarshal := pDefaultPeriodInFrames is VarRef ? "uint*" : "ptr"
        pFundamentalPeriodInFramesMarshal := pFundamentalPeriodInFrames is VarRef ? "uint*" : "ptr"
        pMinPeriodInFramesMarshal := pMinPeriodInFrames is VarRef ? "uint*" : "ptr"
        pMaxPeriodInFramesMarshal := pMaxPeriodInFrames is VarRef ? "uint*" : "ptr"

        result := ComCall(18, this, "ptr", pFormat, pDefaultPeriodInFramesMarshal, pDefaultPeriodInFrames, pFundamentalPeriodInFramesMarshal, pFundamentalPeriodInFrames, pMinPeriodInFramesMarshal, pMinPeriodInFrames, pMaxPeriodInFramesMarshal, pMaxPeriodInFrames, "HRESULT")
        return result
    }

    /**
     * Returns the current format and periodicity of the audio engine.
     * @param {Pointer<Pointer<WAVEFORMATEX>>} ppFormat Type: <b><a href="https://docs.microsoft.com/previous-versions/dd757713(v=vs.85)">WAVEFORMATEX</a>**</b>
     * 
     * The current device format that is being used by the audio engine.
     * @param {Pointer<Integer>} pCurrentPeriodInFrames Type: <b>UINT32*</b>
     * 
     * The current period of the audio engine, in audio frames.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns <b>S_OK</b> to indicate that it has completed successfully. Otherwise it returns an appropriate error code.
     * @see https://docs.microsoft.com/windows/win32/api//audioclient/nf-audioclient-iaudioclient3-getcurrentsharedmodeengineperiod
     */
    GetCurrentSharedModeEnginePeriod(ppFormat, pCurrentPeriodInFrames) {
        ppFormatMarshal := ppFormat is VarRef ? "ptr*" : "ptr"
        pCurrentPeriodInFramesMarshal := pCurrentPeriodInFrames is VarRef ? "uint*" : "ptr"

        result := ComCall(19, this, ppFormatMarshal, ppFormat, pCurrentPeriodInFramesMarshal, pCurrentPeriodInFrames, "HRESULT")
        return result
    }

    /**
     * Initializes a shared stream with the specified periodicity.
     * @param {Integer} StreamFlags Type: <b>DWORD</b>
     * 
     * Flags to control creation of the stream. The client should set this parameter to 0 or to the bitwise OR of one or more of the supported  <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/audclnt-streamflags-xxx-constants">AUDCLNT_STREAMFLAGS_XXX Constants</a> or   <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/audclnt-sessionflags-xxx-constants">AUDCLNT_SESSIONFLAGS_XXX Constants</a>. The supported <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/audclnt-streamflags-xxx-constants">AUDCLNT_STREAMFLAGS_XXX Constants</a> for this parameter when using this method are: 
     * 
     * - AUDCLNT_STREAMFLAGS_EVENTCALLBACK
     * - AUDCLNT_STREAMFLAGS_AUTOCONVERTPCM
     * - AUDCLNT_STREAMFLAGS_SRC_DEFAULT_QUALITY
     * @param {Integer} PeriodInFrames Type: <b>UINT32</b>
     * 
     * Periodicity requested by the client. This value must  be an integral multiple of the value returned in the <i>pFundamentalPeriodInFrames</i> parameter to <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-iaudioclient3-getsharedmodeengineperiod">IAudioClient3::GetSharedModeEnginePeriod</a>.  <i>PeriodInFrames</i> must also be greater than or equal to the value returned in <i>pMinPeriodInFrames</i> and less than or equal to the value returned in <i>pMaxPeriodInFrames</i>.
     * @param {Pointer<WAVEFORMATEX>} pFormat Type: <b>const <a href="https://docs.microsoft.com/previous-versions/dd757713(v=vs.85)">WAVEFORMATEX</a>*</b>
     * 
     * Pointer to a format descriptor. This parameter must point to a valid format descriptor of type <a href="https://docs.microsoft.com/previous-versions/dd757713(v=vs.85)">WAVEFORMATEX</a> or <b></b><a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/ksmedia/ns-ksmedia-waveformatextensible">WAVEFORMATEXTENSIBLE</a>. For more information, see the Remarks section for <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-iaudioclient-initialize">IAudioClient::Initialize</a>.
     * @param {Pointer<Guid>} AudioSessionGuid Type: <b>LPCGUID</b>
     * 
     * Pointer to a session GUID. This parameter points to a GUID value that identifies the audio session that the stream belongs to. If the GUID identifies a session that has been previously opened, the method adds the stream to that session. If the GUID does not identify an existing session, the method opens a new session and adds the stream to that session. The stream remains a member of the same session for its lifetime. Setting this parameter to <b>NULL</b> is equivalent to passing a pointer to a GUID_NULL value.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the method succeeds, it returns S_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>AUDCLNT_E_ALREADY_INITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>IAudioClient</b> object is already initialized.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>AUDCLNT_E_WRONG_ENDPOINT_TYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The AUDCLNT_STREAMFLAGS_LOOPBACK flag is set but the endpoint device is a capture device, not a rendering device.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>AUDCLNT_E_CPUUSAGE_EXCEEDED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that the process-pass duration exceeded the maximum CPU usage. The audio engine keeps track of CPU usage by maintaining the number of times the process-pass duration exceeds the maximum CPU usage. The maximum CPU usage is calculated as a percent of  the engine's periodicity. The percentage value is the system's CPU throttle value (within the range of 10% and 90%). If  this value is not found, then the default value of 40% is used to calculate the maximum CPU usage. 
     * 
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>AUDCLNT_E_DEVICE_INVALIDATED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The audio endpoint device has been unplugged, or the audio hardware or associated hardware resources have been reconfigured, disabled, removed, or otherwise made unavailable for use.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>AUDCLNT_E_DEVICE_IN_USE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The endpoint device is already in use. Either the device is being used in exclusive mode, or the device is being used in shared mode and the caller asked to use the device in exclusive mode.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>AUDCLNT_E_ENGINE_FORMAT_LOCKED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The client specified <a href="/windows/desktop/api/audioclient/ne-audioclient-audclnt_streamoptions">AUDCLNT_STREAMOPTIONS_MATCH_FORMAT</a> when calling <a href="/windows/desktop/api/audioclient/nf-audioclient-iaudioclient2-setclientproperties">IAudioClient2::SetClientProperties</a>, but the format of the audio engine has been locked by another client. In this case, you can call <b>IAudioClient2::SetClientProperties</b> without specifying the match format option and then use audio engine's current format.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>AUDCLNT_E_ENGINE_PERIODICITY_LOCKED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The client specified <a href="/windows/desktop/api/audioclient/ne-audioclient-audclnt_streamoptions">AUDCLNT_STREAMOPTIONS_MATCH_FORMAT</a> when calling <a href="/windows/desktop/api/audioclient/nf-audioclient-iaudioclient2-setclientproperties">IAudioClient2::SetClientProperties</a>, but the periodicity of the audio engine has been locked by another client. In this case, you can call <b>IAudioClient2::SetClientProperties</b> without specifying the match format option and then use audio engine's current periodicity.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>AUDCLNT_E_ENDPOINT_CREATE_FAILED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method failed to create the audio endpoint for the render or the capture device. This can occur if the audio endpoint device has been unplugged, or the audio hardware or associated hardware resources have been reconfigured, disabled, removed, or otherwise made unavailable for use. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>AUDCLNT_E_INVALID_DEVICE_PERIOD</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that the requested device period specified with the <i>PeriodInFrames</i> is not an integral multiple of the fundamental periodicity of the audio engine, is shorter than the engine's minimum period, or is longer than the engine's maximum period. Get the supported periodicity values of the engine by calling <a href="/windows/desktop/api/audioclient/nf-audioclient-iaudioclient3-getsharedmodeengineperiod">IAudioClient3::GetSharedModeEnginePeriod</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>AUDCLNT_E_UNSUPPORTED_FORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The audio engine (shared mode) or audio endpoint device (exclusive mode) does not support the specified format.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>AUDCLNT_E_SERVICE_NOT_RUNNING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Windows audio service is not running.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Parameter <i>pFormat</i> is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Parameter <i>pFormat</i> points to an invalid format description; or the AUDCLNT_STREAMFLAGS_LOOPBACK flag is set but <i>ShareMode</i> is not equal to AUDCLNT_SHAREMODE_SHARED; or the AUDCLNT_STREAMFLAGS_CROSSPROCESS flag is set but <i>ShareMode</i> is equal to AUDCLNT_SHAREMODE_EXCLUSIVE.
     * 
     * A prior call to <a href="/windows/desktop/api/audioclient/nf-audioclient-iaudioclient2-setclientproperties">SetClientProperties</a> was made with an invalid category for audio/render streams.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Out of memory.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//audioclient/nf-audioclient-iaudioclient3-initializesharedaudiostream
     */
    InitializeSharedAudioStream(StreamFlags, PeriodInFrames, pFormat, AudioSessionGuid) {
        result := ComCall(20, this, "uint", StreamFlags, "uint", PeriodInFrames, "ptr", pFormat, "ptr", AudioSessionGuid, "HRESULT")
        return result
    }
}
