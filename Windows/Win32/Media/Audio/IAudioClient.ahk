#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IAudioClient interface enables a client to create and initialize an audio stream between an audio application and the audio engine (for a shared-mode stream) or the hardware buffer of an audio endpoint device (for an exclusive-mode stream).
 * @remarks
 * <div class="alert"><b>Note</b>  In Windows 8, the first use of <b>IAudioClient</b> to access the audio device should be on the STA thread. Calls from an MTA thread may result in undefined behavior.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api//content/audioclient/nn-audioclient-iaudioclient
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
     * @remarks
     * After activating an <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nn-audioclient-iaudioclient">IAudioClient</a> interface on an audio endpoint device, the client must successfully call <b>Initialize</b> once and only once to initialize the audio stream between the client and the device. The client can either connect directly to the audio hardware (exclusive mode) or indirectly through the audio engine (shared mode). In the <b>Initialize</b> call, the client specifies the audio data format, the buffer size, and audio session for the stream.
     * 
     * <div class="alert"><b>Note</b>  In Windows 8, the first use of <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nn-audioclient-iaudioclient">IAudioClient</a> to access the audio device should be on the STA thread. Calls from an MTA thread may result in undefined behavior.</div>
     * <div> </div>
     * An attempt to create a shared-mode stream can succeed only if the audio device is already operating in shared mode or the device is currently unused. An attempt to create a shared-mode stream fails if the device is already operating in exclusive mode.
     * 
     * If a stream is initialized to be event driven and in shared mode, <i>ShareMode</i> is set to AUDCLNT_SHAREMODE_SHARED and one of the stream flags that are set includes AUDCLNT_STREAMFLAGS_EVENTCALLBACK. For such a stream, the associated  application must also obtain a handle by making a call to <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-iaudioclient-seteventhandle">IAudioClient::SetEventHandle</a>. When it is time to retire  the stream, the audio engine can then use the handle to release the stream objects.  Failure to call <b>IAudioClient::SetEventHandle</b> before releasing the stream objects can cause a delay of several seconds (a time-out period) while the audio engine waits for an available handle. After the time-out period expires, the audio engine then releases the stream objects.
     * 
     * Whether an attempt to create an exclusive-mode stream succeeds depends on several factors, including the availability of the device and the user-controlled settings that govern exclusive-mode operation of the device. For more information, see <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/exclusive-mode-streams">Exclusive-Mode Streams</a>.
     * 
     * An <b>IAudioClient</b> object supports exactly one connection to the audio engine or audio hardware. This connection lasts for the lifetime of the <b>IAudioClient</b> object.
     * 
     * The client should call the following methods only <i>after</i> calling <b>Initialize</b>:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-iaudioclient-getbuffersize">IAudioClient::GetBufferSize</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-iaudioclient-getcurrentpadding">IAudioClient::GetCurrentPadding</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-iaudioclient-getservice">IAudioClient::GetService</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-iaudioclient-getstreamlatency">IAudioClient::GetStreamLatency</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-iaudioclient-reset">IAudioClient::Reset</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-iaudioclient-seteventhandle">IAudioClient::SetEventHandle</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-iaudioclient-start">IAudioClient::Start</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-iaudioclient-stop">IAudioClient::Stop</a>
     * </li>
     * </ul>
     * The following methods do not require that <b>Initialize</b> be called first:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-iaudioclient-getdeviceperiod">IAudioClient::GetDevicePeriod</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-iaudioclient-getmixformat">IAudioClient::GetMixFormat</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-iaudioclient-isformatsupported">IAudioClient::IsFormatSupported</a>
     * </li>
     * </ul>
     * These methods can be called any time after activating the <b>IAudioClient</b> interface.
     * 
     * Before calling <b>Initialize</b> to set up a shared-mode or exclusive-mode connection, the client can call the <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-iaudioclient-isformatsupported">IAudioClient::IsFormatSupported</a> method to discover whether the audio engine or audio endpoint device supports a particular format in that mode. Before opening a shared-mode connection, the client can obtain the audio engine's mix format by calling the <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-iaudioclient-getmixformat">IAudioClient::GetMixFormat</a> method.
     * 
     * The endpoint buffer that is shared between the client and audio engine must be large enough to prevent glitches from occurring in the audio stream between processing passes by the client and audio engine. For a rendering endpoint, the client thread periodically writes data to the buffer, and the audio engine thread periodically reads data from the buffer. For a capture endpoint, the engine thread periodically writes to the buffer, and the client thread periodically reads from the buffer. In either case, if the periods of the client thread and engine thread are not equal, the buffer must be large enough to accommodate the longer of the two periods without allowing glitches to occur.
     * 
     * The client specifies a buffer size through the <i>hnsBufferDuration</i> parameter. The client is responsible for requesting a buffer that is large enough to ensure that glitches cannot occur between the periodic processing passes that it performs on the buffer. Similarly, the <b>Initialize</b> method ensures that the buffer is never smaller than the minimum buffer size needed to ensure that glitches do not occur between the periodic processing passes that the engine thread performs on the buffer. If the client requests a buffer size that is smaller than the audio engine's minimum required buffer size, the method sets the buffer size to this minimum buffer size rather than to the buffer size requested by the client.
     * 
     * If the client requests a buffer size (through the <i>hnsBufferDuration</i> parameter) that is not an integral number of audio frames, the method rounds up the requested buffer size to the next integral number of frames.
     * 
     * Following the <b>Initialize</b> call, the client should call the <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-iaudioclient-getbuffersize">IAudioClient::GetBufferSize</a> method to get the precise size of the endpoint buffer. During each processing pass, the client will need the actual buffer size to calculate how much data to transfer to or from the buffer. The client calls the <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-iaudioclient-getcurrentpadding">IAudioClient::GetCurrentPadding</a> method to determine how much of the data in the buffer is currently available for processing.
     * 
     * To achieve the minimum stream latency between the client application and audio endpoint device, the client thread should run at the same period as the audio engine thread. The period of the engine thread is fixed and cannot be controlled by the client. Making the client's period smaller than the engine's period unnecessarily increases the client thread's load on the processor without improving latency or decreasing the buffer size. To determine the period of the engine thread, the client can call the <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-iaudioclient-getdeviceperiod">IAudioClient::GetDevicePeriod</a> method. To set the buffer to the minimum size required by the engine thread, the client should call <b>Initialize</b> with the <i>hnsBufferDuration</i> parameter set to 0. Following the <b>Initialize</b> call, the client can get the size of the resulting buffer by calling <b>IAudioClient::GetBufferSize</b>.
     * 
     * A client has the option of requesting a buffer size that is larger than what is strictly necessary to make timing glitches rare or nonexistent. Increasing the buffer size does not necessarily increase the stream latency. For a rendering stream, the latency through the buffer is determined solely by the separation between the client's write pointer and the engine's read pointer. For a capture stream, the latency through the buffer is determined solely by the separation between the engine's write pointer and the client's read pointer.
     * 
     * The loopback flag (AUDCLNT_STREAMFLAGS_LOOPBACK) enables audio loopback. A client can enable audio loopback only on a rendering endpoint with a shared-mode stream. Audio loopback is provided primarily to support acoustic echo cancellation (AEC).
     * 
     * An AEC client requires both a rendering endpoint and the ability to capture the output stream from the audio engine. The engine's output stream is the global mix that the audio device plays through the speakers. If audio loopback is enabled, a client can open a capture buffer for the global audio mix by calling the <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-iaudioclient-getservice">IAudioClient::GetService</a> method to obtain an <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nn-audioclient-iaudiocaptureclient">IAudioCaptureClient</a> interface on the rendering stream object. If audio loopback is not enabled, then an attempt to open a capture buffer on a rendering stream will fail. The loopback data in the capture buffer is in the device format, which the client can obtain by querying the device's <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/pkey-audioengine-deviceformat">PKEY_AudioEngine_DeviceFormat</a> property.  
     * 
     * On Windows versions prior to Windows 10, a pull-mode capture client will not receive any events when a stream is initialized with event-driven buffering (AUDCLNT_STREAMFLAGS_EVENTCALLBACK) and is loopback-enabled (AUDCLNT_STREAMFLAGS_LOOPBACK). If the stream is opened with this configuration, the <b>Initialize</b> call succeeds, but relevant events are not raised to notify the capture client each time a buffer becomes ready for processing. To work around this, initialize a render stream in event-driven mode. Each time the client receives an event for the render stream, it must signal the capture client to run the capture thread that reads the next set of samples from the capture endpoint buffer.
     *  As of Windows 10 the relevant event handles are now set for loopback-enabled streams that are active.
     * 
     * Note that all streams must be opened in share mode because exclusive-mode streams cannot operate in loopback mode.
     * For more information about audio loopback, see <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/loopback-recording">Loopback Recording</a>.
     * 
     * The AUDCLNT_STREAMFLAGS_EVENTCALLBACK flag indicates that processing of the audio buffer by the client will be event driven. WASAPI supports event-driven buffering to enable low-latency processing of both shared-mode and exclusive-mode streams.
     * 
     * The initial release of Windows Vista supports event-driven buffering (that is, the use of the AUDCLNT_STREAMFLAGS_EVENTCALLBACK flag) for rendering streams only.
     * 
     * In the initial  release of Windows Vista, for capture streams, the AUDCLNT_STREAMFLAGS_EVENTCALLBACK flag is supported only in shared mode. Setting this flag    has no effect for exclusive-mode capture streams. That is, although the application specifies this flag in exclusive mode through the <b>Initialize</b> call, the application will not receive any events that are  usually required to capture the  audio stream. In the Windows Vista Service Pack 1 release, this flag is functional in shared-mode and exclusive mode; an application can set this  flag to enable event-buffering for capture streams. For more information about capturing an audio stream, see <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/capturing-a-stream">Capturing a Stream</a>.
     * 
     * To enable event-driven buffering, the client must provide an event handle to the system. Following the <b>Initialize</b> call and before calling the <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-iaudioclient-start">IAudioClient::Start</a> method to start the stream, the client must call the <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-iaudioclient-seteventhandle">IAudioClient::SetEventHandle</a> method to set the event handle. While the stream is running, the system periodically signals the event to indicate to the client that audio data is available for processing. Between processing passes, the client thread waits on the event handle by calling a synchronization function such as <b>WaitForSingleObject</b>. For more information about synchronization functions, see the Windows SDK documentation.
     * 
     * For a shared-mode stream that uses event-driven buffering, the caller must set both <i>hnsPeriodicity</i> and <i>hnsBufferDuration</i> to 0. The <b>Initialize</b> method determines how large a buffer to allocate based on the scheduling period of the audio engine. Although the client's buffer processing thread is event driven, the basic buffer management process, as described previously, is unaltered. Each time the thread awakens, it should call <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-iaudioclient-getcurrentpadding">IAudioClient::GetCurrentPadding</a> to determine how much data to write to a rendering buffer or read from a capture buffer. In contrast to the two buffers that the <b>Initialize</b> method allocates for an exclusive-mode stream that uses event-driven buffering, a shared-mode stream requires a single buffer.
     * 
     * For an exclusive-mode stream that uses event-driven buffering, the caller must specify nonzero values for <i>hnsPeriodicity</i> and <i>hnsBufferDuration</i>, and the values of these two parameters must be equal. The <b>Initialize</b> method allocates two buffers for the stream. Each buffer is equal in duration to the value of the <i>hnsBufferDuration</i> parameter. Following the <b>Initialize</b> call for a rendering stream, the caller should fill the first of the two buffers before starting the stream. For a capture stream, the buffers are initially empty, and the caller should assume that each buffer remains empty until the event for that buffer is signaled. While the stream is running, the system alternately sends one buffer or the other to the client—this form of double buffering is referred to as "ping-ponging". Each time the client receives a buffer from the system (which the system indicates by signaling the event), the client must process the entire buffer. For example, if the client requests a packet size from the <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-iaudiorenderclient-getbuffer">IAudioRenderClient::GetBuffer</a> method that does not match the buffer size, the method fails. Calls to the <b>IAudioClient::GetCurrentPadding</b> method are unnecessary because the packet size must always equal the buffer size. In contrast to the buffering modes discussed previously, the latency for an event-driven, exclusive-mode stream depends directly on the buffer size.
     * 
     * As explained in <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/audio-sessions">Audio Sessions</a>, the default behavior for a session that contains rendering streams is that its volume and mute settings persist across application restarts. The AUDCLNT_STREAMFLAGS_NOPERSIST flag overrides the default behavior and makes the settings nonpersistent. This flag has no effect on sessions that contain capture streams—the settings for those sessions are never persistent. In addition, the settings for a session that contains a loopback stream (a stream that is initialized with the AUDCLNT_STREAMFLAGS_LOOPBACK flag) are not persistent.
     * 
     * Only a session that connects to a rendering endpoint device can have persistent volume and mute settings. The first stream to be added to the session determines whether the session's settings are persistent. Thus, if the AUDCLNT_STREAMFLAGS_NOPERSIST or AUDCLNT_STREAMFLAGS_LOOPBACK flag is set during initialization of the first stream, the session's settings are not persistent. Otherwise, they are persistent. Their persistence is unaffected by additional streams that might be subsequently added or removed during the lifetime of the session object.
     * 
     * After a call to <b>Initialize</b> has successfully initialized an <b>IAudioClient</b> interface instance, a subsequent <b>Initialize</b> call to initialize the same interface instance will fail and return error code E_ALREADY_INITIALIZED.
     * 
     * If the initial call to <b>Initialize</b> fails, subsequent <b>Initialize</b> calls might fail and return error code E_ALREADY_INITIALIZED, even though the interface has not been initialized. If this occurs, release the <b>IAudioClient</b> interface and obtain a new <b>IAudioClient</b> interface from the <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/mmdevice-api">MMDevice API</a> before calling <b>Initialize</b> again.
     * 
     * For code examples that call the <b>Initialize</b> method, see the following topics:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/rendering-a-stream">Rendering a Stream</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/capturing-a-stream">Capturing a Stream</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/exclusive-mode-streams">Exclusive-Mode Streams</a>
     * </li>
     * </ul>
     * Starting with Windows 7, <b>Initialize</b> can return AUDCLNT_E_BUFFER_SIZE_NOT_ALIGNED for a render or a capture device. This indicates that the buffer size, specified by the caller  in the  <i>hnsBufferDuration</i> parameter, is not aligned. This error code is returned only if  the caller requested  an exclusive-mode stream (AUDCLNT_SHAREMODE_EXCLUSIVE) and event-driven buffering (AUDCLNT_STREAMFLAGS_EVENTCALLBACK).
     * 
     *   If <b>Initialize</b> returns AUDCLNT_E_BUFFER_SIZE_NOT_ALIGNED, the caller must call <b>Initialize</b> again and specify the aligned buffer size. Use the following steps:<ol>
     * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-iaudioclient-getbuffersize">IAudioClient::GetBufferSize</a> and receive the next-highest-aligned buffer size (in frames).</li>
     * <li>Call <b>IAudioClient::Release</b> to release the audio client used in the previous call that returned AUDCLNT_E_BUFFER_SIZE_NOT_ALIGNED.</li>
     * <li>Calculate the aligned buffer size in 100-nanosecond units (hns). The buffer size is <c>(REFERENCE_TIME)((10000.0 * 1000 / WAVEFORMATEX.nSamplesPerSecond * nFrames) + 0.5)</code>. In this formula,  <code>nFrames</c> is the buffer size retrieved by <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-iaudioclient-getbuffersize">GetBufferSize</a>.
     * </li>
     * <li>Call the <a href="https://docs.microsoft.com/windows/desktop/api/mmdeviceapi/nf-mmdeviceapi-immdevice-activate">IMMDevice::Activate</a> method with parameter <i>iid</i> set to REFIID IID_IAudioClient to create a new audio client.</li>
     * <li>Call <b>Initialize</b> again on the created audio client and specify the new buffer size and periodicity.</li>
     * </ol>
     * 
     * 
     * Starting with Windows 10, hardware-offloaded audio streams must be event driven. This means that if you call <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-iaudioclient2-setclientproperties">IAudioClient2::SetClientProperties</a> and set the <i>bIsOffload</i> parameter of the <a href="https://docs.microsoft.com/windows/win32/api/audioclient/ns-audioclient-audioclientproperties-r1">AudioClientProperties</a> to TRUE, you must specify the <b>AUDCLNT_STREAMFLAGS_EVENTCALLBACK</b> flag in the <i>StreamFlags</i> parameter to <b>IAudioClient::Initialize</b>.
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
     * The requested buffer size is not aligned. This code can be returned for a render or a capture device  if the caller specified  AUDCLNT_SHAREMODE_EXCLUSIVE and the AUDCLNT_STREAMFLAGS_EVENTCALLBACK flags. The caller must call <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-iaudioclient-initialize">Initialize</a> again with the aligned buffer size. For more information, see Remarks.
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
     * A prior call to <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-iaudioclient2-setclientproperties">SetClientProperties</a> was made with an invalid category for audio/render streams.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/audioclient/nf-audioclient-iaudioclient-initialize
     */
    Initialize(ShareMode, StreamFlags, hnsBufferDuration, hnsPeriodicity, pFormat, AudioSessionGuid) {
        result := ComCall(3, this, "int", ShareMode, "uint", StreamFlags, "int64", hnsBufferDuration, "int64", hnsPeriodicity, "ptr", pFormat, "ptr", AudioSessionGuid, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The GetBufferSize method retrieves the size (maximum capacity) of the endpoint buffer.
     * @remarks
     * This method requires prior initialization of the <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nn-audioclient-iaudioclient">IAudioClient</a> interface. All calls to this method will fail with the error AUDCLNT_E_NOT_INITIALIZED until the client initializes the audio stream by successfully calling the <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-iaudioclient-initialize">IAudioClient::Initialize</a> method.
     * 
     * This method retrieves the length of the endpoint buffer shared between the client application and the audio engine. The length is expressed as the number of audio frames the buffer can hold. The size in bytes of an audio frame is calculated as the number of channels in the stream multiplied by the sample size per channel. For example, the frame size is four bytes for a stereo (2-channel) stream with 16-bit samples.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-iaudioclient-initialize">IAudioClient::Initialize</a> method allocates the buffer. The client specifies the buffer length in the <i>hnsBufferDuration</i> parameter value that it passes to the <b>Initialize</b> method. For rendering clients, the buffer length determines the maximum amount of rendering data that the application can write to the endpoint buffer during a single processing pass. For capture clients, the buffer length determines the maximum amount of capture data that the audio engine can read from the endpoint buffer during a single processing pass. The client should always call <b>GetBufferSize</b> after calling <b>Initialize</b> to determine the actual size of the allocated buffer, which might differ from the requested size.
     * 
     * Rendering clients can use this value to calculate the largest rendering buffer size that can be requested from <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-iaudiorenderclient-getbuffer">IAudioRenderClient::GetBuffer</a> during each processing pass.
     * 
     * For code examples that call the <b>GetBufferSize</b> method, see the following topics:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/rendering-a-stream">Rendering a Stream</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/capturing-a-stream">Capturing a Stream</a>
     * </li>
     * </ul>
     * @returns {Integer} Pointer to a <b>UINT32</b> variable into which the method writes the number of audio frames that the buffer can hold.
     * @see https://learn.microsoft.com/windows/win32/api//content/audioclient/nf-audioclient-iaudioclient-getbuffersize
     */
    GetBufferSize() {
        result := ComCall(4, this, "uint*", &pNumBufferFrames := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pNumBufferFrames
    }

    /**
     * The GetStreamLatency method retrieves the maximum latency for the current stream and can be called any time after the stream has been initialized.
     * @remarks
     * This method requires prior initialization of the <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nn-audioclient-iaudioclient">IAudioClient</a> interface. All calls to this method will fail with the error AUDCLNT_E_NOT_INITIALIZED until the client initializes the audio stream by successfully calling the <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-iaudioclient-initialize">IAudioClient::Initialize</a> method.
     * 
     * This method retrieves the maximum latency for the current stream. The value will not change for the lifetime of the <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nn-audioclient-iaudioclient">IAudioClient</a> object.
     * 
     * Rendering clients can use this latency value to compute the minimum amount of data that they can write during any single processing pass. To write less than this minimum is to risk introducing glitches into the audio stream. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-iaudiorenderclient-getbuffer">IAudioRenderClient::GetBuffer</a>.
     * @returns {Integer} Pointer to a <a href="https://docs.microsoft.com/windows/desktop/DirectShow/reference-time">REFERENCE_TIME</a> variable into which the method writes a time value representing the latency. The time is expressed in 100-nanosecond units. For more information about <b>REFERENCE_TIME</b>, see the Windows SDK documentation.
     * @see https://learn.microsoft.com/windows/win32/api//content/audioclient/nf-audioclient-iaudioclient-getstreamlatency
     */
    GetStreamLatency() {
        result := ComCall(5, this, "int64*", &phnsLatency := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return phnsLatency
    }

    /**
     * The GetCurrentPadding method retrieves the number of frames of padding in the endpoint buffer.
     * @remarks
     * This method requires prior initialization of the <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nn-audioclient-iaudioclient">IAudioClient</a> interface. All calls to this method will fail with the error AUDCLNT_E_NOT_INITIALIZED until the client initializes the audio stream by successfully calling the <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-iaudioclient-initialize">IAudioClient::Initialize</a> method.
     * 
     * This method retrieves a padding value that indicates the amount of valid, unread data that the endpoint buffer currently contains. A rendering application can use the padding value to determine how much new data it can safely write to the endpoint buffer without overwriting previously written data that the audio engine has not yet read from the buffer. A capture application can use the padding value to determine how much new data it can safely read from the endpoint buffer without reading invalid data from a region of the buffer to which the audio engine has not yet written valid data.
     * 
     * The padding value is expressed as a number of audio frames. The size of an audio frame is specified by the <b>nBlockAlign</b> member of the <a href="https://docs.microsoft.com/windows/win32/api/mmreg/ns-mmreg-waveformatex">WAVEFORMATEX</a> (or <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/ksmedia/ns-ksmedia-waveformatextensible">WAVEFORMATEXTENSIBLE</a>) structure that the client passed to the <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-iaudioclient-initialize">IAudioClient::Initialize</a>  method. The size in bytes of an audio frame equals the number of channels in the stream multiplied by the sample size per channel. For example, the frame size is four bytes for a stereo (2-channel) stream with 16-bit samples.
     * 
     * For a shared-mode rendering stream, the padding value reported by <b>GetCurrentPadding</b> specifies the number of audio frames that are queued up to play in the endpoint buffer. Before writing to the endpoint buffer, the client can calculate the amount of available space in the buffer by subtracting the padding value from the buffer length. To ensure that a subsequent call to the <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-iaudiorenderclient-getbuffer">IAudioRenderClient::GetBuffer</a> method succeeds, the client should request a packet length that does not exceed the available space in the buffer. To obtain the buffer length, call the <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-iaudioclient-getbuffersize">IAudioClient::GetBufferSize</a> method.
     * 
     * For a shared-mode capture stream, the padding value reported by <b>GetCurrentPadding</b> specifies the number of frames of capture data that are available in the next packet in the endpoint buffer. At a particular moment, zero, one, or more packets of capture data might be ready for the client to read from the buffer. If no packets are currently available, the method reports a padding value of 0. Following the <b>GetCurrentPadding</b> call, an <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-iaudiocaptureclient-getbuffer">IAudioCaptureClient::GetBuffer</a> method call will retrieve a packet whose length exactly equals the padding value reported by <b>GetCurrentPadding</b>. Each call to <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-iaudiorenderclient-getbuffer">GetBuffer</a> retrieves a whole packet. A packet always contains an integral number of audio frames.
     * 
     * For a shared-mode capture stream, calling <b>GetCurrentPadding</b> is equivalent to calling the <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-iaudiocaptureclient-getnextpacketsize">IAudioCaptureClient::GetNextPacketSize</a> method. That is, the padding value reported by <b>GetCurrentPadding</b> is equal to the packet length reported by <b>GetNextPacketSize</b>.
     * 
     * For an exclusive-mode rendering or capture stream that was initialized with the AUDCLNT_STREAMFLAGS_EVENTCALLBACK flag, the client typically has no use for the padding value reported by <b>GetCurrentPadding</b>. Instead, the client accesses an entire buffer during each processing pass. Each time a buffer becomes available for processing, the audio engine notifies the client by signaling the client's event handle. For more information about this flag, see <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-iaudioclient-initialize">IAudioClient::Initialize</a>.
     * 
     * For an exclusive-mode rendering or capture stream that was not initialized with the AUDCLNT_STREAMFLAGS_EVENTCALLBACK flag, the client can use the padding value obtained from <b>GetCurrentPadding</b> in a way that is similar to that described previously for a shared-mode stream. The details are as follows.
     * 
     * First, for an exclusive-mode rendering stream, the padding value specifies the number of audio frames that are queued up to play in the endpoint buffer. As before, the client can calculate the amount of available space in the buffer by subtracting the padding value from the buffer length.
     * 
     * Second, for an exclusive-mode capture stream, the padding value reported by <b>GetCurrentPadding</b> specifies the current length of the next packet. However, this padding value is a snapshot of the packet length, which might increase before the client calls the <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-iaudiocaptureclient-getbuffer">IAudioCaptureClient::GetBuffer</a> method. Thus, the length of the packet retrieved by <b>GetBuffer</b> is at least as large as, but might be larger than, the padding value reported by the <b>GetCurrentPadding</b> call that preceded the <b>GetBuffer</b> call. In contrast, for a shared-mode capture stream, the length of the packet obtained from <b>GetBuffer</b> always equals the padding value reported by the preceding <b>GetCurrentPadding</b> call.
     * 
     * For a code example that calls the <b>GetCurrentPadding</b> method, see <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/rendering-a-stream">Rendering a Stream</a>.
     * @returns {Integer} Pointer to a <b>UINT32</b> variable into which the method writes the frame count (the number of audio frames of padding in the buffer).
     * @see https://learn.microsoft.com/windows/win32/api//content/audioclient/nf-audioclient-iaudioclient-getcurrentpadding
     */
    GetCurrentPadding() {
        result := ComCall(6, this, "uint*", &pNumPaddingFrames := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pNumPaddingFrames
    }

    /**
     * The IsFormatSupported method indicates whether the audio endpoint device supports a particular stream format.
     * @remarks
     * This method provides a way for a client to determine, before calling <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-iaudioclient-initialize">IAudioClient::Initialize</a>, whether the audio engine supports a particular stream format.
     * 
     * For exclusive mode, <b>IsFormatSupported</b> returns S_OK if the audio endpoint device supports the caller-specified format, or it returns AUDCLNT_E_UNSUPPORTED_FORMAT if the device does not support the format. The <i>ppClosestMatch</i> parameter can be <b>NULL</b>. If it is not <b>NULL</b>, the method writes <b>NULL</b> to <i>*ppClosestMatch</i>.
     * 
     * For shared mode, if the audio engine supports the caller-specified format, <b>IsFormatSupported</b> sets <b>*ppClosestMatch</b> to <b>NULL</b> and returns S_OK. If the audio engine does not support the caller-specified format but does support a similar format, the method retrieves the similar format through the <i>ppClosestMatch</i> parameter and returns S_FALSE. If the audio engine does not support the caller-specified format or any similar format, the method sets  <i>*ppClosestMatch</i> to <b>NULL</b> and returns AUDCLNT_E_UNSUPPORTED_FORMAT.
     * 
     * In shared mode, the audio engine always supports the mix format, which the client can obtain by calling the <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-iaudioclient-getmixformat">IAudioClient::GetMixFormat</a> method. In addition, the audio engine might support similar formats that have the same sample rate and number of channels as the mix format but differ in the representation of audio sample values. The audio engine represents sample values internally as floating-point numbers, but if the caller-specified format represents sample values as integers, the audio engine typically can convert between the integer sample values and its internal floating-point representation.
     * 
     * The audio engine might be able to support an even wider range of shared-mode formats if the installation package for the audio device includes a local effects (LFX) audio processing object (APO) that can handle format conversions. An LFX APO is a software module that performs device-specific processing of an audio stream. The audio graph builder in the Windows audio service inserts the LFX APO into the stream between each client and the audio engine. When a client calls the <b>IsFormatSupported</b> method and the method determines that an LFX APO is installed for use with the device, the method directs the query to the LFX APO, which indicates whether it supports the caller-specified format.
     * 
     * For example, a particular LFX APO might accept a 6-channel surround sound stream from a client and convert the stream to a stereo format that can be played through headphones. Typically, an LFX APO supports only client formats with sample rates that match the sample rate of the mix format.
     * 
     * For more information about APOs, see the white papers titled "Custom Audio Effects in Windows Vista" and "Reusing the Windows Vista Audio System Effects" at the <a href="https://www.microsoft.com/whdc/device/audio/default.mspx">Audio Device Technologies for Windows</a> website. For more information about the <b>IsFormatSupported</b> method, see <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/device-formats">Device Formats</a>.
     * @param {Integer} ShareMode The sharing mode for the stream format. Through this parameter, the client indicates whether it wants to use the specified format in exclusive mode or shared mode. The client should set this parameter to one of the following <a href="https://docs.microsoft.com/windows/win32/api/audiosessiontypes/ne-audiosessiontypes-audclnt_sharemode">AUDCLNT_SHAREMODE</a> enumeration values:
     * 
     * AUDCLNT_SHAREMODE_EXCLUSIVE
     * 
     * AUDCLNT_SHAREMODE_SHARED
     * @param {Pointer<WAVEFORMATEX>} pFormat Pointer to the specified stream format. This parameter points to a caller-allocated format descriptor of type <b>WAVEFORMATEX</b> or <b>WAVEFORMATEXTENSIBLE</b>. The client writes a format description to this structure before calling this method. For information about <b>WAVEFORMATEX</b> and <b>WAVEFORMATEXTENSIBLE</b>, see the Windows DDK documentation.
     * @returns {Pointer<WAVEFORMATEX>} Pointer to a pointer variable into which the method writes the address of a <b>WAVEFORMATEX</b> or <b>WAVEFORMATEXTENSIBLE</b> structure. This structure specifies the supported format that is closest to the format that the client specified through the <i>pFormat</i> parameter. For shared mode (that is, if the <i>ShareMode</i> parameter is AUDCLNT_SHAREMODE_SHARED), set <i>ppClosestMatch</i> to point to a valid, non-<b>NULL</b> pointer variable. For exclusive mode, set <i>ppClosestMatch</i> to <b>NULL</b>. The method allocates the storage for the structure. The caller is responsible for freeing the storage, when it is no longer needed, by calling the <b>CoTaskMemFree</b> function. If the <b>IsFormatSupported</b> call fails and <i>ppClosestMatch</i> is non-<b>NULL</b>, the method sets <i>*ppClosestMatch</i> to <b>NULL</b>. For information about <b>CoTaskMemFree</b>, see the Windows SDK documentation.
     * @see https://learn.microsoft.com/windows/win32/api//content/audioclient/nf-audioclient-iaudioclient-isformatsupported
     */
    IsFormatSupported(ShareMode, pFormat) {
        result := ComCall(7, this, "int", ShareMode, "ptr", pFormat, "ptr*", &ppClosestMatch := 0, "int")
        return ppClosestMatch
    }

    /**
     * The GetMixFormat method retrieves the stream format that the audio engine uses for its internal processing of shared-mode streams.
     * @remarks
     * The client can call this method before calling the <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-iaudioclient-initialize">IAudioClient::Initialize</a> method. When creating a shared-mode stream for an audio endpoint device, the <b>Initialize</b> method always accepts the stream format obtained from a <b>GetMixFormat</b> call on the same device.
     * 
     * The mix format is the format that the audio engine uses internally for digital processing of shared-mode streams. This format is not necessarily a format that the audio endpoint device supports. Thus, the caller might not succeed in creating an exclusive-mode stream with a format obtained by calling <b>GetMixFormat</b>.
     * 
     * For example, to facilitate digital audio processing, the audio engine might use a mix format that represents samples as floating-point values. If the device supports only integer PCM samples, then the engine converts the samples to or from integer PCM values at the connection between the device and the engine. However, to avoid resampling, the engine might use a mix format with a sample rate that the device supports.
     * 
     * To determine whether the <b>Initialize</b> method can create a shared-mode or exclusive-mode stream with a particular format, call the <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-iaudioclient-isformatsupported">IAudioClient::IsFormatSupported</a> method.
     * 
     * By itself, a <b>WAVEFORMATEX</b> structure cannot specify the mapping of channels to speaker positions. In addition, although <b>WAVEFORMATEX</b> specifies the size of the container for each audio sample, it cannot specify the number of bits of precision in a sample (for example, 20 bits of precision in a 24-bit container). However, the <b>WAVEFORMATEXTENSIBLE</b> structure can specify both the mapping of channels to speakers and the number of bits of precision in each sample. For this reason, the <b>GetMixFormat</b> method retrieves a format descriptor that is in the form of a <b>WAVEFORMATEXTENSIBLE</b> structure instead of a standalone <b>WAVEFORMATEX</b> structure. Through the <i>ppDeviceFormat</i> parameter, the method outputs a pointer to the <b>WAVEFORMATEX</b> structure that is embedded at the start of this <b>WAVEFORMATEXTENSIBLE</b> structure. For more information about <b>WAVEFORMATEX</b> and <b>WAVEFORMATEXTENSIBLE</b>, see the Windows DDK documentation.
     * 
     * For more information about the <b>GetMixFormat</b> method, see <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/device-formats">Device Formats</a>. For code examples that call <b>GetMixFormat</b>, see the following topics:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/rendering-a-stream">Rendering a Stream</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/capturing-a-stream">Capturing a Stream</a>
     * </li>
     * </ul>
     * @returns {Pointer<WAVEFORMATEX>} Pointer to a pointer variable into which the method writes the address of the mix format. This parameter must be a valid, non-<b>NULL</b> pointer to a pointer variable. The method writes the address of a <b>WAVEFORMATEX</b> (or <b>WAVEFORMATEXTENSIBLE</b>) structure to this variable. The method allocates the storage for the structure. The caller is responsible for freeing the storage, when it is no longer needed, by calling the <b>CoTaskMemFree</b> function. If the <b>GetMixFormat</b> call fails, <i>*ppDeviceFormat</i> is <b>NULL</b>. For information about <b>WAVEFORMATEX</b>, <b>WAVEFORMATEXTENSIBLE</b>, and <b>CoTaskMemFree</b>, see the Windows SDK documentation.
     * @see https://learn.microsoft.com/windows/win32/api//content/audioclient/nf-audioclient-iaudioclient-getmixformat
     */
    GetMixFormat() {
        result := ComCall(8, this, "ptr*", &ppDeviceFormat := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppDeviceFormat
    }

    /**
     * The GetDevicePeriod method retrieves the length of the periodic interval separating successive processing passes by the audio engine on the data in the endpoint buffer.
     * @remarks
     * The client can call this method before calling the <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-iaudioclient-initialize">IAudioClient::Initialize</a> method.
     * 
     * The <i>phnsDefaultDevicePeriod</i> parameter specifies the default scheduling period for a shared-mode stream. The <i>phnsMinimumDevicePeriod</i> parameter specifies the minimum scheduling period for an exclusive-mode stream.
     * 
     * At least one of the two parameters, <i>phnsDefaultDevicePeriod</i> and <i>phnsMinimumDevicePeriod</i>, must be non-<b>NULL</b> or the method returns immediately with error code E_POINTER. If both parameters are non-<b>NULL</b>, then the method outputs both the default and minimum periods.
     * 
     * For a shared-mode stream, the audio engine periodically processes the data in the endpoint buffer, which the engine shares with the client application. The engine schedules itself to perform these processing passes at regular intervals.
     * 
     * The period between processing passes by the audio engine is fixed for a particular audio endpoint device and represents the smallest processing quantum for the audio engine. This period plus the stream latency between the buffer and endpoint device represents the minimum possible latency that an audio application can achieve.
     * 
     * The client has the option of scheduling its periodic processing thread to run at the same time interval as the audio engine. In this way, the client can achieve the smallest possible latency for a shared-mode stream. However, in an application for which latency is less important, the client can reduce the process-switching overhead on the CPU by scheduling its processing passes to occur less frequently. In this case, the endpoint buffer must be proportionally larger to compensate for the longer period between processing passes.
     * 
     * The client determines the buffer size during its call to the <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-iaudioclient-initialize">IAudioClient::Initialize</a> method. For a shared-mode stream, if the client passes this method an <i>hnsBufferDuration</i> parameter value of 0, the method assumes that the periods for the client and audio engine are guaranteed to be equal, and the method will allocate a buffer small enough to achieve the minimum possible latency. (In fact, any <i>hnsBufferDuration</i> value between 0 and the sum of the audio engine's period and device latency will have the same result.) Similarly, for an exclusive-mode stream, if the client sets <i>hnsBufferDuration</i> to 0, the method assumes that the period of the client is set to the minimum period of the audio endpoint device, and the method will allocate a buffer small enough to achieve the minimum possible latency.
     * 
     * If the client chooses to run its periodic processing thread less often, at the cost of increased latency, it can do so as long as it creates an endpoint buffer during the <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-iaudioclient-initialize">IAudioClient::Initialize</a> call that is sufficiently large.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/audioclient/nf-audioclient-iaudioclient-getdeviceperiod
     */
    GetDevicePeriod(phnsDefaultDevicePeriod, phnsMinimumDevicePeriod) {
        phnsDefaultDevicePeriodMarshal := phnsDefaultDevicePeriod is VarRef ? "int64*" : "ptr"
        phnsMinimumDevicePeriodMarshal := phnsMinimumDevicePeriod is VarRef ? "int64*" : "ptr"

        result := ComCall(9, this, phnsDefaultDevicePeriodMarshal, phnsDefaultDevicePeriod, phnsMinimumDevicePeriodMarshal, phnsMinimumDevicePeriod, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The Start method starts the audio stream.
     * @remarks
     * This method requires prior initialization of the <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nn-audioclient-iaudioclient">IAudioClient</a> interface. All calls to this method will fail with the error AUDCLNT_E_NOT_INITIALIZED until the client initializes the audio stream by successfully calling the <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-iaudioclient-initialize">IAudioClient::Initialize</a> method.
     * 
     * <b>Start</b> is a control method that the client calls to start the audio stream. Starting the stream causes the <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nn-audioclient-iaudioclient">IAudioClient</a> object to begin streaming data between the endpoint buffer and the audio engine. It also causes the stream's audio clock to resume counting from its current position.
     * 
     * The first time this method is called following initialization of the stream, the <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nn-audioclient-iaudioclient">IAudioClient</a> object's stream position counter begins at 0. Otherwise, the clock resumes from its position at the time that the stream was last stopped. Resetting the stream forces the stream position back to 0.
     * 
     * To avoid start-up glitches with rendering streams, clients should not call <b>Start</b> until the audio engine has been initially loaded with data by calling the <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-iaudiorenderclient-getbuffer">IAudioRenderClient::GetBuffer</a> and <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-iaudiorenderclient-releasebuffer">IAudioRenderClient::ReleaseBuffer</a> methods on the rendering interface.
     * 
     * For code examples that call the <b>Start</b> method, see the following topics:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/rendering-a-stream">Rendering a Stream</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/capturing-a-stream">Capturing a Stream</a>
     * </li>
     * </ul>
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
     * The audio stream was not stopped at the time of the <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-iaudioclient-start">Start</a> call.
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
     * The audio stream is configured to use event-driven buffering, but the caller has not called <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-iaudioclient-seteventhandle">IAudioClient::SetEventHandle</a> to set the event handle on the stream.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/audioclient/nf-audioclient-iaudioclient-start
     */
    Start() {
        result := ComCall(10, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The Stop method stops the audio stream.
     * @remarks
     * This method requires prior initialization of the <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nn-audioclient-iaudioclient">IAudioClient</a> interface. All calls to this method will fail with the error AUDCLNT_E_NOT_INITIALIZED until the client initializes the audio stream by successfully calling the <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-iaudioclient-initialize">IAudioClient::Initialize</a> method.
     * 
     * <b>Stop</b> is a control method that stops a running audio stream. This method stops data from streaming through the client's connection with the audio engine. Stopping the stream freezes the stream's audio clock at its current stream position. A subsequent call to <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-iaudioclient-start">IAudioClient::Start</a> causes the stream to resume running from that position. If necessary, the client can call the <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-iaudioclient-reset">IAudioClient::Reset</a> method to reset the position while the stream is stopped.
     * 
     * For code examples that call the <b>Stop</b> method, see the following topics:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/rendering-a-stream">Rendering a Stream</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/capturing-a-stream">Capturing a Stream</a>
     * </li>
     * </ul>
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
     * @see https://learn.microsoft.com/windows/win32/api//content/audioclient/nf-audioclient-iaudioclient-stop
     */
    Stop() {
        result := ComCall(11, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The Reset method resets the audio stream.
     * @remarks
     * This method requires prior initialization of the <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nn-audioclient-iaudioclient">IAudioClient</a> interface. All calls to this method will fail with the error AUDCLNT_E_NOT_INITIALIZED until the client initializes the audio stream by successfully calling the <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-iaudioclient-initialize">IAudioClient::Initialize</a> method.
     * 
     * <b>Reset</b> is a control method that the client calls to reset a stopped audio stream. Resetting the stream flushes all pending data and resets the audio clock stream position to 0. This method fails if it is called on a stream that is not stopped.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/audioclient/nf-audioclient-iaudioclient-reset
     */
    Reset() {
        result := ComCall(12, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The SetEventHandle method sets the event handle that the system signals when an audio buffer is ready to be processed by the client.
     * @remarks
     * This method requires prior initialization of the <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nn-audioclient-iaudioclient">IAudioClient</a> interface. All calls to this method will fail with the error AUDCLNT_E_NOT_INITIALIZED until the client initializes the audio stream by successfully calling the <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-iaudioclient-initialize">IAudioClient::Initialize</a> method.
     * 
     * During stream initialization, the client can, as an option, enable event-driven buffering. To do so, the client calls the <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-iaudioclient-initialize">IAudioClient::Initialize</a> method with the AUDCLNT_STREAMFLAGS_EVENTCALLBACK flag set. After enabling event-driven buffering, and before calling the <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-iaudioclient-start">IAudioClient::Start</a> method to start the stream, the client must call <b>SetEventHandle</b> to register the event handle that the system will signal each time a buffer becomes ready to be processed by the client.
     * 
     * The event handle should be in the nonsignaled state at the time that the client calls the <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-iaudioclient-start">Start</a> method.
     * 
     * If the client has enabled event-driven buffering of a stream, but the client calls the <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-iaudioclient-start">Start</a> method for that stream without first calling <b>SetEventHandle</b>, the <b>Start</b> call will fail and return an error code.
     * 
     * If the client does not enable event-driven buffering of a stream but attempts to set an event handle for the stream by calling <b>SetEventHandle</b>, the call will fail and return an error code.
     * 
     * For a code example that calls the <b>SetEventHandle</b> method, see <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/exclusive-mode-streams">Exclusive-Mode Streams</a>.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/audioclient/nf-audioclient-iaudioclient-seteventhandle
     */
    SetEventHandle(eventHandle) {
        eventHandle := eventHandle is Win32Handle ? NumGet(eventHandle, "ptr") : eventHandle

        result := ComCall(13, this, "ptr", eventHandle, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The GetService method accesses additional services from the audio client object.
     * @remarks
     * This method requires prior initialization of the <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nn-audioclient-iaudioclient">IAudioClient</a> interface. All calls to this method will fail with the error AUDCLNT_E_NOT_INITIALIZED until the client initializes the audio stream by successfully calling the <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-iaudioclient-initialize">IAudioClient::Initialize</a> method.
     * 
     * The <b>GetService</b> method supports the following service interfaces:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nn-audioclient-iaudiocaptureclient">IAudioCaptureClient</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nn-audioclient-iaudioclock">IAudioClock</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nn-audioclient-iaudiorenderclient">IAudioRenderClient</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/audiopolicy/nn-audiopolicy-iaudiosessioncontrol">IAudioSessionControl</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nn-audioclient-iaudiostreamvolume">IAudioStreamVolume</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nn-audioclient-ichannelaudiovolume">IChannelAudioVolume</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imftrustedoutput">IMFTrustedOutput</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nn-audioclient-isimpleaudiovolume">ISimpleAudioVolume</a>
     * </li>
     * </ul>
     * In Windows 7, a new service identifier, <b>IID_IMFTrustedOutput</b>, has been added that facilitates the use of output trust authority (OTA) objects. These objects can operate inside or outside the Media Foundation's protected media path (PMP) and send content outside the Media Foundation pipeline. If the caller is outside PMP, then the OTA may not operate in the PMP,  and the protection settings are less robust. OTAs must implement the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imftrustedoutput">IMFTrustedOutput</a> interface.
     * By passing <b>IID_IMFTrustedOutput</b> in <b>GetService</b>, an application can retrieve a pointer to the object's <b>IMFTrustedOutput</b> interface. For more information about protected objects and <b>IMFTrustedOutput</b>, see "Protected Media Path" in  the Media Foundation SDK documentation. 
     * 
     * For information about using trusted audio drivers in OTAs, see <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/protected-user-mode-audio--puma-">Protected User Mode Audio (PUMA)</a>.
     * 
     * Note that activating IMFTrustedOutput through this mechanism works regardless of whether the caller is running in PMP. However, if the caller is not running in a protected process (that is, the caller is not within Media Foundation's PMP) then the audio OTA might not operate in the PMP and the protection settings are less robust.
     * 
     * To obtain the interface ID for a service interface, use the <b>__uuidof</b> operator. For example, the interface ID of <b>IAudioCaptureClient</b> is defined as follows:
     * 
     * 
     * ``` syntax
     * 
     * const IID IID_IAudioCaptureClient  __uuidof(IAudioCaptureClient)
     * 
     * ```
     * 
     * For information about the <b>__uuidof</b> operator, see the Windows SDK documentation.
     * 
     * To release the <b>IAudioClient</b> object and free all its associated resources, the client must release all references to any service objects that were created by calling <b>GetService</b>, in addition to calling <b>Release</b> on the <b>IAudioClient</b> interface itself. The client must release a service from the same thread that releases the <b>IAudioClient</b> object.
     * 
     * The <b>IAudioSessionControl</b>, <b>IAudioStreamVolume</b>, <b>IChannelAudioVolume</b>, and <b>ISimpleAudioVolume</b> interfaces control and monitor aspects of audio sessions and shared-mode streams. These interfaces do not work with exclusive-mode streams.
     * 
     * For code examples that call the <b>GetService</b> method, see the following topics:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/rendering-a-stream">Rendering a Stream</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/capturing-a-stream">Capturing a Stream</a>
     * </li>
     * </ul>
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
     * @returns {Pointer<Pointer<Void>>} Pointer to a pointer variable into which the method writes the address of an instance of the requested interface. Through this method, the caller obtains a counted reference to the interface. The caller is responsible for releasing the interface, when it is no longer needed, by calling the interface's <b>Release</b> method. If the <b>GetService</b> call fails, <i>*ppv</i> is <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api//content/audioclient/nf-audioclient-iaudioclient-getservice
     */
    GetService(riid) {
        result := ComCall(14, this, "ptr", riid, "ptr*", &ppv := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppv
    }
}
