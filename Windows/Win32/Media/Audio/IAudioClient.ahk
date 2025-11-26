#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IAudioClient interface enables a client to create and initialize an audio stream between an audio application and the audio engine (for a shared-mode stream) or the hardware buffer of an audio endpoint device (for an exclusive-mode stream).
 * @remarks
 * 
 * <div class="alert"><b>Note</b>  In Windows 8, the first use of <b>IAudioClient</b> to access the audio device should be on the STA thread. Calls from an MTA thread may result in undefined behavior.</div>
 * <div> </div>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//audioclient/nn-audioclient-iaudioclient
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class IAudioClient extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAudioClient
     * @type {Guid}
     */
    static IID => Guid("{1cb9ad4c-dbfa-4c32-b178-c2f568a703b2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "GetBufferSize", "GetStreamLatency", "GetCurrentPadding", "IsFormatSupported", "GetMixFormat", "GetDevicePeriod", "Start", "Stop", "Reset", "SetEventHandle", "GetService"]

    /**
     * The Initialize method initializes the audio stream.
     * @param {Integer} ShareMode The sharing mode for the connection. Through this parameter, the client tells the audio engine whether it wants to share the audio endpoint device with other clients. The client should set this parameter to one of the following <a href="https://docs.microsoft.com/windows/win32/api/audiosessiontypes/ne-audiosessiontypes-audclnt_sharemode">AUDCLNT_SHAREMODE</a> enumeration values:
     * 
     * AUDCLNT_SHAREMODE_EXCLUSIVE
     * 
     * AUDCLNT_SHAREMODE_SHARED
     * @param {Integer} StreamFlags Flags to control creation of the stream. The client should set this parameter to 0 or to the bitwise OR of one or more of the  <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/audclnt-streamflags-xxx-constants">AUDCLNT_STREAMFLAGS_XXX Constants</a> or  the <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/audclnt-sessionflags-xxx-constants">AUDCLNT_SESSIONFLAGS_XXX Constants</a>.
     * @param {Integer} hnsBufferDuration The buffer capacity as a time value. This parameter is of type <b>REFERENCE_TIME</b> and is expressed in 100-nanosecond units. This parameter contains the buffer size that the caller requests for the buffer that the audio application will share with the audio engine (in shared mode) or with the endpoint device (in exclusive mode). If the call succeeds, the method allocates a buffer that is a least this large. For more information about <b>REFERENCE_TIME</b>, see the Windows SDK documentation. For more information about buffering requirements, see Remarks.
     * @param {Integer} hnsPeriodicity The device period. This parameter can be nonzero only in exclusive mode. In shared mode, always set this parameter to 0. In exclusive mode, this parameter specifies the requested scheduling period for successive buffer accesses by the audio endpoint device. If the requested device period lies outside the range that is set by the device's minimum period and the system's maximum period, then the method clamps the period to that range. If this parameter is 0, the method sets the device period to its default value. To obtain the default device period, call the <a href="https://docs.microsoft.com/windows/win32/api/audioclient/nf-audioclient-iaudioclient-getdeviceperiod">IAudioClient::GetDevicePeriod</a> method. If the AUDCLNT_STREAMFLAGS_EVENTCALLBACK stream flag is set and  AUDCLNT_SHAREMODE_EXCLUSIVE is set as the  ShareMode, then <i>hnsPeriodicity</i> must be nonzero and equal to <i>hnsBufferDuration</i>.
     * @param {Pointer<WAVEFORMATEX>} pFormat Pointer to a format descriptor. This parameter must point to a valid format descriptor of type <b>WAVEFORMATEX</b> (or <b>WAVEFORMATEXTENSIBLE</b>). For more information, see Remarks.
     * @param {Pointer<Guid>} AudioSessionGuid Pointer to a session GUID. This parameter points to a GUID value that identifies the audio session that the stream belongs to. If the GUID identifies a session that has been previously opened, the method adds the stream to that session. If the GUID does not identify an existing session, the method opens a new session and adds the stream to that session. The stream remains a member of the same session for its lifetime. Setting this parameter to <b>NULL</b> is equivalent to passing a pointer to a GUID_NULL value.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
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
     * <dt><b>AUDCLNT_E_BUFFER_SIZE_NOT_ALIGNED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <div class="alert"><b>Note</b>  Applies to Windows 7 and later.</div>
     * <div> </div>
     * The requested buffer size is not aligned. This code can be returned for a render or a capture device  if the caller specified  AUDCLNT_SHAREMODE_EXCLUSIVE and the AUDCLNT_STREAMFLAGS_EVENTCALLBACK flags. The caller must call <a href="/windows/desktop/api/audioclient/nf-audioclient-iaudioclient-initialize">Initialize</a> again with the aligned buffer size. For more information, see Remarks.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>AUDCLNT_E_BUFFER_SIZE_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <div class="alert"><b>Note</b>  Applies to Windows 7 and later.</div>
     * <div> </div>
     * Indicates that the buffer duration value requested by an exclusive-mode client is out of range. The requested duration value for pull mode must not be greater than 5000 milliseconds; for push mode the duration value must not be greater than 2 seconds.
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
     * <div class="alert"><b>Note</b>  Applies to Windows 7 and later.</div>
     * <div> </div>
     * Indicates that the device period requested by an exclusive-mode client is greater than 5000 milliseconds.
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
     * <dt><b>AUDCLNT_E_EXCLUSIVE_MODE_NOT_ALLOWED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller is requesting exclusive-mode use of the endpoint device, but the user has disabled exclusive-mode use of the device.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>AUDCLNT_E_BUFDURATION_PERIOD_NOT_EQUAL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The AUDCLNT_STREAMFLAGS_EVENTCALLBACK flag is set but parameters <i>hnsBufferDuration</i> and <i>hnsPeriodicity</i> are not equal.
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
     * @see https://docs.microsoft.com/windows/win32/api//audioclient/nf-audioclient-iaudioclient-initialize
     */
    Initialize(ShareMode, StreamFlags, hnsBufferDuration, hnsPeriodicity, pFormat, AudioSessionGuid) {
        result := ComCall(3, this, "int", ShareMode, "uint", StreamFlags, "int64", hnsBufferDuration, "int64", hnsPeriodicity, "ptr", pFormat, "ptr", AudioSessionGuid, "HRESULT")
        return result
    }

    /**
     * The GetBufferSize method retrieves the size (maximum capacity) of the endpoint buffer.
     * @returns {Integer} Pointer to a <b>UINT32</b> variable into which the method writes the number of audio frames that the buffer can hold.
     * @see https://docs.microsoft.com/windows/win32/api//audioclient/nf-audioclient-iaudioclient-getbuffersize
     */
    GetBufferSize() {
        result := ComCall(4, this, "uint*", &pNumBufferFrames := 0, "HRESULT")
        return pNumBufferFrames
    }

    /**
     * The GetStreamLatency method retrieves the maximum latency for the current stream and can be called any time after the stream has been initialized.
     * @returns {Integer} Pointer to a <a href="https://docs.microsoft.com/windows/desktop/DirectShow/reference-time">REFERENCE_TIME</a> variable into which the method writes a time value representing the latency. The time is expressed in 100-nanosecond units. For more information about <b>REFERENCE_TIME</b>, see the Windows SDK documentation.
     * @see https://docs.microsoft.com/windows/win32/api//audioclient/nf-audioclient-iaudioclient-getstreamlatency
     */
    GetStreamLatency() {
        result := ComCall(5, this, "int64*", &phnsLatency := 0, "HRESULT")
        return phnsLatency
    }

    /**
     * The GetCurrentPadding method retrieves the number of frames of padding in the endpoint buffer.
     * @returns {Integer} Pointer to a <b>UINT32</b> variable into which the method writes the frame count (the number of audio frames of padding in the buffer).
     * @see https://docs.microsoft.com/windows/win32/api//audioclient/nf-audioclient-iaudioclient-getcurrentpadding
     */
    GetCurrentPadding() {
        result := ComCall(6, this, "uint*", &pNumPaddingFrames := 0, "HRESULT")
        return pNumPaddingFrames
    }

    /**
     * The IsFormatSupported method indicates whether the audio endpoint device supports a particular stream format.
     * @param {Integer} ShareMode The sharing mode for the stream format. Through this parameter, the client indicates whether it wants to use the specified format in exclusive mode or shared mode. The client should set this parameter to one of the following <a href="https://docs.microsoft.com/windows/win32/api/audiosessiontypes/ne-audiosessiontypes-audclnt_sharemode">AUDCLNT_SHAREMODE</a> enumeration values:
     * 
     * AUDCLNT_SHAREMODE_EXCLUSIVE
     * 
     * AUDCLNT_SHAREMODE_SHARED
     * @param {Pointer<WAVEFORMATEX>} pFormat Pointer to the specified stream format. This parameter points to a caller-allocated format descriptor of type <b>WAVEFORMATEX</b> or <b>WAVEFORMATEXTENSIBLE</b>. The client writes a format description to this structure before calling this method. For information about <b>WAVEFORMATEX</b> and <b>WAVEFORMATEXTENSIBLE</b>, see the Windows DDK documentation.
     * @returns {Pointer<WAVEFORMATEX>} Pointer to a pointer variable into which the method writes the address of a <b>WAVEFORMATEX</b> or <b>WAVEFORMATEXTENSIBLE</b> structure. This structure specifies the supported format that is closest to the format that the client specified through the <i>pFormat</i> parameter. For shared mode (that is, if the <i>ShareMode</i> parameter is AUDCLNT_SHAREMODE_SHARED), set <i>ppClosestMatch</i> to point to a valid, non-<b>NULL</b> pointer variable. For exclusive mode, set <i>ppClosestMatch</i> to <b>NULL</b>. The method allocates the storage for the structure. The caller is responsible for freeing the storage, when it is no longer needed, by calling the <b>CoTaskMemFree</b> function. If the <b>IsFormatSupported</b> call fails and <i>ppClosestMatch</i> is non-<b>NULL</b>, the method sets <i>*ppClosestMatch</i> to <b>NULL</b>. For information about <b>CoTaskMemFree</b>, see the Windows SDK documentation.
     * @see https://docs.microsoft.com/windows/win32/api//audioclient/nf-audioclient-iaudioclient-isformatsupported
     */
    IsFormatSupported(ShareMode, pFormat) {
        result := ComCall(7, this, "int", ShareMode, "ptr", pFormat, "ptr*", &ppClosestMatch := 0, "int")
        return ppClosestMatch
    }

    /**
     * The GetMixFormat method retrieves the stream format that the audio engine uses for its internal processing of shared-mode streams.
     * @returns {Pointer<WAVEFORMATEX>} Pointer to a pointer variable into which the method writes the address of the mix format. This parameter must be a valid, non-<b>NULL</b> pointer to a pointer variable. The method writes the address of a <b>WAVEFORMATEX</b> (or <b>WAVEFORMATEXTENSIBLE</b>) structure to this variable. The method allocates the storage for the structure. The caller is responsible for freeing the storage, when it is no longer needed, by calling the <b>CoTaskMemFree</b> function. If the <b>GetMixFormat</b> call fails, <i>*ppDeviceFormat</i> is <b>NULL</b>. For information about <b>WAVEFORMATEX</b>, <b>WAVEFORMATEXTENSIBLE</b>, and <b>CoTaskMemFree</b>, see the Windows SDK documentation.
     * @see https://docs.microsoft.com/windows/win32/api//audioclient/nf-audioclient-iaudioclient-getmixformat
     */
    GetMixFormat() {
        result := ComCall(8, this, "ptr*", &ppDeviceFormat := 0, "HRESULT")
        return ppDeviceFormat
    }

    /**
     * The GetDevicePeriod method retrieves the length of the periodic interval separating successive processing passes by the audio engine on the data in the endpoint buffer.
     * @param {Pointer<Integer>} phnsDefaultDevicePeriod Pointer to a <a href="https://docs.microsoft.com/windows/desktop/DirectShow/reference-time">REFERENCE_TIME</a> variable into which the method writes a time value specifying the default interval between periodic processing passes by the audio engine. The time is expressed in 100-nanosecond units. For information about <b>REFERENCE_TIME</b>, see the Windows SDK documentation.
     * @param {Pointer<Integer>} phnsMinimumDevicePeriod Pointer to a <a href="https://docs.microsoft.com/windows/desktop/DirectShow/reference-time">REFERENCE_TIME</a> variable into which the method writes a time value specifying the minimum interval between periodic processing passes by the audio endpoint device. The time is expressed in 100-nanosecond units.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
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
     * Parameters <i>phnsDefaultDevicePeriod</i> and <i>phnsMinimumDevicePeriod</i> are both <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//audioclient/nf-audioclient-iaudioclient-getdeviceperiod
     */
    GetDevicePeriod(phnsDefaultDevicePeriod, phnsMinimumDevicePeriod) {
        phnsDefaultDevicePeriodMarshal := phnsDefaultDevicePeriod is VarRef ? "int64*" : "ptr"
        phnsMinimumDevicePeriodMarshal := phnsMinimumDevicePeriod is VarRef ? "int64*" : "ptr"

        result := ComCall(9, this, phnsDefaultDevicePeriodMarshal, phnsDefaultDevicePeriod, phnsMinimumDevicePeriodMarshal, phnsMinimumDevicePeriod, "HRESULT")
        return result
    }

    /**
     * The Start method starts the audio stream.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>AUDCLNT_E_NOT_INITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The audio stream has not been successfully initialized.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>AUDCLNT_E_NOT_STOPPED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The audio stream was not stopped at the time of the <a href="/windows/desktop/api/audioclient/nf-audioclient-iaudioclient-start">Start</a> call.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>AUDCLNT_E_EVENTHANDLE_NOT_SET</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The audio stream is configured to use event-driven buffering, but the caller has not called <a href="/windows/desktop/api/audioclient/nf-audioclient-iaudioclient-seteventhandle">IAudioClient::SetEventHandle</a> to set the event handle on the stream.
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
     * <dt><b>AUDCLNT_E_SERVICE_NOT_RUNNING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Windows audio service is not running.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//audioclient/nf-audioclient-iaudioclient-start
     */
    Start() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * The Stop method stops the audio stream.
     * @returns {HRESULT} If the method succeeds and stops the stream, it returns S_OK. If the method succeeds and the stream was already stopped, the method returns S_FALSE. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>AUDCLNT_E_NOT_INITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The client has not been successfully initialized.
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
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//audioclient/nf-audioclient-iaudioclient-stop
     */
    Stop() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * The Reset method resets the audio stream.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If the method succeeds and the stream was already reset, the method returns S_FALSE. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>AUDCLNT_E_NOT_INITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The audio stream has not been successfully initialized.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>AUDCLNT_E_NOT_STOPPED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The audio stream was not stopped at the time the call was made.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>AUDCLNT_E_BUFFER_OPERATION_PENDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The client is currently writing to or reading from the buffer.
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
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//audioclient/nf-audioclient-iaudioclient-reset
     */
    Reset() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * The SetEventHandle method sets the event handle that the system signals when an audio buffer is ready to be processed by the client.
     * @param {HANDLE} eventHandle The event handle.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Parameter <i>eventHandle</i> is <b>NULL</b> or an invalid handle.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>AUDCLNT_E_EVENTHANDLE_NOT_EXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The audio stream was not initialized for event-driven buffering.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>AUDCLNT_E_NOT_INITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The audio stream has not been successfully initialized.
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
     * <dt><b>AUDCLNT_E_SERVICE_NOT_RUNNING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Windows audio service is not running.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//audioclient/nf-audioclient-iaudioclient-seteventhandle
     */
    SetEventHandle(eventHandle) {
        eventHandle := eventHandle is Win32Handle ? NumGet(eventHandle, "ptr") : eventHandle

        result := ComCall(13, this, "ptr", eventHandle, "HRESULT")
        return result
    }

    /**
     * The GetService method accesses additional services from the audio client object.
     * @param {Pointer<Guid>} riid The interface ID for the requested service. The client should set this parameter to one of the following REFIID values:
     * 
     * IID_IAudioCaptureClient
     * 
     * IID_IAudioClientDuckingControl
     * 
     * IID_IAudioClock
     * 
     * IID_IAudioRenderClient
     * 
     * IID_IAudioSessionControl
     * 
     * IID_IAudioStreamVolume
     * 
     * IID_IChannelAudioVolume
     * 
     * IID_IMFTrustedOutput
     * 
     * IID_ISimpleAudioVolume
     * 
     * 
     * 
     * For more information, see Remarks.
     * @returns {Pointer<Void>} Pointer to a pointer variable into which the method writes the address of an instance of the requested interface. Through this method, the caller obtains a counted reference to the interface. The caller is responsible for releasing the interface, when it is no longer needed, by calling the interface's <b>Release</b> method. If the <b>GetService</b> call fails, <i>*ppv</i> is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//audioclient/nf-audioclient-iaudioclient-getservice
     */
    GetService(riid) {
        result := ComCall(14, this, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }
}
