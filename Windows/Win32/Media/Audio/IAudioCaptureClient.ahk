#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IAudioCaptureClient interface enables a client to read input data from a capture endpoint buffer.
 * @see https://learn.microsoft.com/windows/win32/api/audioclient/nn-audioclient-iaudiocaptureclient
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class IAudioCaptureClient extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAudioCaptureClient
     * @type {Guid}
     */
    static IID => Guid("{c8adbd64-e71e-48a0-a4de-185c395cd317}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetBuffer", "ReleaseBuffer", "GetNextPacketSize"]

    /**
     * Retrieves a pointer to the next available packet of data in the capture endpoint buffer.
     * @remarks
     * This method retrieves the next data packet from the capture endpoint buffer. At a particular time, the buffer might contain zero, one, or more packets that are ready to read. Typically, a buffer-processing thread that reads data from a capture endpoint buffer reads all of the available packets each time the thread executes.
     * 
     * During processing of an audio capture stream, the client application alternately calls <b>GetBuffer</b> and the <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-iaudiocaptureclient-releasebuffer">IAudioCaptureClient::ReleaseBuffer</a> method. The client can read no more than a single data packet with each <b>GetBuffer</b> call. Following each <b>GetBuffer</b> call, the client must call <b>ReleaseBuffer</b> to release the packet before the client can call <b>GetBuffer</b> again to get the next packet.
     * 
     * Two or more consecutive calls either to <b>GetBuffer</b> or to <b>ReleaseBuffer</b> are not permitted and will fail with error code AUDCLNT_E_OUT_OF_ORDER. To ensure the correct ordering of calls, a <b>GetBuffer</b> call and its corresponding <b>ReleaseBuffer</b> call must occur in the same thread.
     * 
     * During each <b>GetBuffer</b> call, the caller must either obtain the entire packet or none of it. Before reading the packet, the caller can check the packet size (available through the <i>pNumFramesToRead</i> parameter) to make sure that it has enough room to store the entire packet.
     * 
     * During each <b>ReleaseBuffer</b> call, the caller reports the number of audio frames that it read from the buffer. This number must be either the (nonzero) packet size or 0. If the number is 0, then the next <b>GetBuffer</b> call will present the caller with the same packet as in the previous <b>GetBuffer</b> call.
     * 
     * Following each <b>GetBuffer</b> call, the data in the packet remains valid until the next <b>ReleaseBuffer</b> call releases the buffer.
     * 
     * The client must call <b>ReleaseBuffer</b> after a <b>GetBuffer</b> call that successfully obtains a packet of any size other than 0. The client has the option of calling or not calling <b>ReleaseBuffer</b> to release a packet of size 0.
     * 
     * The method outputs the device position and performance counter through the <i>pu64DevicePosition</i> and <i>pu64QPCPosition</i> output parameters. These values provide a time stamp for the first audio frame in the data packet. Through the <i>pdwFlags</i> output parameter, the method indicates whether the reported device position is valid.
     * 
     * The device position that the method writes to  <i>*pu64DevicePosition</i> is the stream-relative position of the audio frame that is currently playing through the speakers (for a rendering stream) or being recorded through the microphone (for a capture stream). The position is expressed as the number of frames from the start of the stream. The size of a frame in an audio stream is specified by the <b>nBlockAlign</b> member of the <b>WAVEFORMATEX</b> (or <b>WAVEFORMATEXTENSIBLE</b>) structure that specifies the stream format. The size, in bytes, of an audio frame equals the number of channels in the stream multiplied by the sample size per channel. For example, for a stereo (2-channel) stream with 16-bit samples, the frame size is four bytes.
     * 
     * The performance counter value that <b>GetBuffer</b> writes to <i>*pu64QPCPosition</i> is not the raw counter value obtained from the <b>QueryPerformanceCounter</b> function. If <i>t</i> is the raw counter value, and if <i>f</i> is the frequency obtained from the <b>QueryPerformanceFrequency</b> function, <b>GetBuffer</b> calculates the performance counter value as follows:
     * 
     * <i>*pu64QPCPosition</i> = 10,000,000<sup>.</sup><i>t</i>/<i>f</i>
     * 
     * The result is expressed in 100-nanosecond units. For more information about <b>QueryPerformanceCounter</b> and <b>QueryPerformanceFrequency</b>, see the Windows SDK documentation.
     * 
     * If no new packet is currently available, the method sets <i>*pNumFramesToRead</i> = 0 and returns status code AUDCLNT_S_BUFFER_EMPTY. In this case, the method does not write to the variables that are pointed to by the <i>ppData</i>, <i>pu64DevicePosition</i>, and <i>pu64QPCPosition</i> parameters.
     * 
     * Clients should avoid excessive delays between the <b>GetBuffer</b> call that acquires a packet and the <b>ReleaseBuffer</b> call that releases the packet. The implementation of the audio engine assumes that the <b>GetBuffer</b> call and the corresponding <b>ReleaseBuffer</b> call occur within the same buffer-processing period. Clients that delay releasing a packet for more than one period risk losing sample data.
     * 
     * In Windows 7 and later, <b>GetBuffer</b> can return the <b>AUDCLNT_E_BUFFER_ERROR</b> error code for an audio client that uses the endpoint buffer in the exclusive mode. This error indicates that the data buffer was not retrieved because a data packet wasn't available (*<i>ppData</i> received <b>NULL</b>).   
     * 
     * If <b>GetBuffer</b> returns <b>AUDCLNT_E_BUFFER_ERROR</b>, the thread consuming the audio samples must wait for the next processing pass. The client might benefit from keeping a count of the failed <b>GetBuffer</b> calls. If <b>GetBuffer</b> returns this error repeatedly, the client can start a new processing loop after shutting down the current client by calling <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-iaudioclient-stop">IAudioClient::Stop</a>, <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-iaudioclient-reset">IAudioClient::Reset</a>, and releasing the audio client.
     * @param {Pointer<Pointer<Integer>>} ppData Pointer to a pointer variable into which the method writes the starting address of the next data packet that is available for the client to read.
     * @param {Pointer<Integer>} pNumFramesToRead Pointer to a <b>UINT32</b> variable into which the method writes the frame count (the number of audio frames available in the data packet). The client should either read the entire data packet or none of it.
     * @param {Pointer<Integer>} pdwFlags Pointer to a <b>DWORD</b> variable into which the method writes the buffer-status flags. The method writes either 0 or the bitwise-OR combination of one or more of the following <a href="https://docs.microsoft.com/windows/win32/api/audioclient/ne-audioclient-_audclnt_bufferflags">_AUDCLNT_BUFFERFLAGS</a> enumeration values:
     * 
     * AUDCLNT_BUFFERFLAGS_SILENT
     * 
     * AUDCLNT_BUFFERFLAGS_DATA_DISCONTINUITY
     * 
     * AUDCLNT_BUFFERFLAGS_TIMESTAMP_ERROR
     * 
     * <div class="alert"><b>Note</b>   The AUDCLNT_BUFFERFLAGS_DATA_DISCONTINUITY flag is not supported in Windows Vista.<p class="note">In Windows 7 and later OS releases, this flag can be used for glitch detection. To start the capture stream, the client application must call <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-iaudioclient-start">IAudioClient::Start</a> followed by calls to <b>GetBuffer</b> in a loop to read data packets until all of the available packets in the endpoint buffer have been read. <b>GetBuffer</b> sets the AUDCLNT_BUFFERFLAGS_DATA_DISCONTINUITY flag to indicate a glitch in the  buffer pointed by <i>ppData</i>.
     * 
     * </div>
     * <div> </div>
     * @param {Pointer<Integer>} pu64DevicePosition Pointer to a <b>UINT64</b> variable into which the method writes the device position of the first audio frame in the data packet. The device position is expressed as the number of audio frames from the start of the stream. This parameter can be <b>NULL</b> if the client does not require the device position. For more information, see Remarks.
     * @param {Pointer<Integer>} pu64QPCPosition Pointer to a <b>UINT64</b> variable into which the method writes the value of the performance counter at the time that the audio endpoint device recorded the device position of the first audio frame in the data packet. The method converts the counter value to 100-nanosecond units before writing it to <i>*pu64QPCPosition.</i> This parameter can be <b>NULL</b> if the client does not require the performance counter value. For more information, see Remarks.
     * @returns {HRESULT} Possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded and <i>*pNumFramesToRead</i> is nonzero, indicating that a packet is ready to be read.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>AUDCLNT_S_BUFFER_EMPTY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded and <i>*pNumFramesToRead</i> is 0, indicating that no capture data is available to be read.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>AUDCLNT_E_BUFFER_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>Windows 7 and later</b>: <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-iaudiocaptureclient-getbuffer">GetBuffer</a> failed to retrieve a data buffer and *<i>ppData</i> points to <b>NULL</b>. For more information, see Remarks.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>AUDCLNT_E_OUT_OF_ORDER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A previous <b>IAudioCaptureClient::GetBuffer</b> call is still in effect.
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
     * <dt><b>AUDCLNT_E_BUFFER_OPERATION_PENDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Buffer cannot be accessed because a stream reset is in progress.
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
     * Parameter ppData, pNumFramesToRead, or pdwFlags is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/audioclient/nf-audioclient-iaudiocaptureclient-getbuffer
     */
    GetBuffer(ppData, pNumFramesToRead, pdwFlags, pu64DevicePosition, pu64QPCPosition) {
        ppDataMarshal := ppData is VarRef ? "ptr*" : "ptr"
        pNumFramesToReadMarshal := pNumFramesToRead is VarRef ? "uint*" : "ptr"
        pdwFlagsMarshal := pdwFlags is VarRef ? "uint*" : "ptr"
        pu64DevicePositionMarshal := pu64DevicePosition is VarRef ? "uint*" : "ptr"
        pu64QPCPositionMarshal := pu64QPCPosition is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, ppDataMarshal, ppData, pNumFramesToReadMarshal, pNumFramesToRead, pdwFlagsMarshal, pdwFlags, pu64DevicePositionMarshal, pu64DevicePosition, pu64QPCPositionMarshal, pu64QPCPosition, "HRESULT")
        return result
    }

    /**
     * The ReleaseBuffer method releases the buffer.
     * @remarks
     * The client should call this method when it finishes reading a data packet that it obtained previously by calling the <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-iaudiocaptureclient-getbuffer">IAudioCaptureClient::GetBuffer</a> method.
     * 
     * The data in the packet that the client obtained from a <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-iaudiocaptureclient-getbuffer">GetBuffer</a> call is guaranteed to remain valid until the client calls <b>ReleaseBuffer</b> to release the packet.
     * 
     * Between each <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-iaudiocaptureclient-getbuffer">GetBuffer</a> call and its corresponding <b>ReleaseBuffer</b> call, the client must either read the entire data packet or none of it. If the client reads the entire packet following the <b>GetBuffer</b> call, then it should call <b>ReleaseBuffer</b> with <i>NumFramesRead</i> set to the total number of frames in the data packet. In this case, the next call to <b>GetBuffer</b> will produce a new data packet. If the client reads none of the data from the packet following the call to <b>GetBuffer</b>, then it should call <b>ReleaseBuffer</b> with <i>NumFramesRead</i> set to 0. In this case, the next <b>GetBuffer</b> call will produce the same data packet as in the previous <b>GetBuffer</b> call.
     * 
     * If the client calls <b>ReleaseBuffer</b> with <i>NumFramesRead</i> set to any value other than the packet size or 0, then the call fails and returns error code AUDCLNT_E_INVALID_SIZE.
     * 
     * Clients should avoid excessive delays between the <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-iaudiocaptureclient-getbuffer">GetBuffer</a> call that acquires a buffer and the <b>ReleaseBuffer</b> call that releases the buffer. The implementation of the audio engine assumes that the <b>GetBuffer</b> call and the corresponding <b>ReleaseBuffer</b> call occur within the same buffer-processing period. Clients that delay releasing a buffer for more than one period risk losing sample data.
     * 
     * For a code example that calls the <b>ReleaseBuffer</b> method, see <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/capturing-a-stream">Capturing a Stream</a>.
     * @param {Integer} NumFramesRead The number of audio frames that the client read from the capture buffer. This parameter must be either equal to the number of frames in the previously acquired data packet or 0.
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
     * <dt><b>AUDCLNT_E_INVALID_SIZE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>NumFramesRead</i> parameter is set to a value other than the data packet size or 0.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>AUDCLNT_E_OUT_OF_ORDER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This call was not preceded by a corresponding <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-iaudiocaptureclient-getbuffer">IAudioCaptureClient::GetBuffer</a> call.
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
     * @see https://learn.microsoft.com/windows/win32/api/audioclient/nf-audioclient-iaudiocaptureclient-releasebuffer
     */
    ReleaseBuffer(NumFramesRead) {
        result := ComCall(4, this, "uint", NumFramesRead, "HRESULT")
        return result
    }

    /**
     * The GetNextPacketSize method retrieves the number of frames in the next data packet in the capture endpoint buffer.
     * @remarks
     * Use this method only with shared-mode streams. It does not work with exclusive-mode streams.
     * 
     * Before calling the <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-iaudiocaptureclient-getbuffer">IAudioCaptureClient::GetBuffer</a> method to retrieve the next data packet, the client can call <b>GetNextPacketSize</b> to retrieve the number of audio frames in the next packet. The count reported by <b>GetNextPacketSize</b> matches the count retrieved in the <b>GetBuffer</b> call (through the <i>pNumFramesToRead</i> output parameter) that follows the <b>GetNextPacketSize</b> call.
     * 
     * A packet always consists of an integral number of audio frames.
     * 
     * <b>GetNextPacketSize</b> must be called in the same thread as the <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-iaudiocaptureclient-getbuffer">GetBuffer</a> and <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-iaudiocaptureclient-releasebuffer">IAudioCaptureClient::ReleaseBuffer</a> method calls that get and release the packets in the capture endpoint buffer.
     * 
     * For a code example that uses the <b>GetNextPacketSize</b> method, see <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/capturing-a-stream">Capturing a Stream</a>.
     * @returns {Integer} Pointer to a <b>UINT32</b> variable into which the method writes the frame count (the number of audio frames in the next capture packet).
     * @see https://learn.microsoft.com/windows/win32/api/audioclient/nf-audioclient-iaudiocaptureclient-getnextpacketsize
     */
    GetNextPacketSize() {
        result := ComCall(5, this, "uint*", &pNumFramesInNextPacket := 0, "HRESULT")
        return pNumFramesInNextPacket
    }
}
