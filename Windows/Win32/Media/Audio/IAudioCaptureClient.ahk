#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IAudioCaptureClient interface enables a client to read input data from a capture endpoint buffer.
 * @see https://docs.microsoft.com/windows/win32/api//audioclient/nn-audioclient-iaudiocaptureclient
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
     * <b>Windows 7 and later</b>: <a href="/windows/desktop/api/audioclient/nf-audioclient-iaudiocaptureclient-getbuffer">GetBuffer</a> failed to retrieve a data buffer and *<i>ppData</i> points to <b>NULL</b>. For more information, see Remarks.
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
     * @see https://docs.microsoft.com/windows/win32/api//audioclient/nf-audioclient-iaudiocaptureclient-getbuffer
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
     * This call was not preceded by a corresponding <a href="/windows/desktop/api/audioclient/nf-audioclient-iaudiocaptureclient-getbuffer">IAudioCaptureClient::GetBuffer</a> call.
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
     * @see https://docs.microsoft.com/windows/win32/api//audioclient/nf-audioclient-iaudiocaptureclient-releasebuffer
     */
    ReleaseBuffer(NumFramesRead) {
        result := ComCall(4, this, "uint", NumFramesRead, "HRESULT")
        return result
    }

    /**
     * The GetNextPacketSize method retrieves the number of frames in the next data packet in the capture endpoint buffer.
     * @returns {Integer} Pointer to a <b>UINT32</b> variable into which the method writes the frame count (the number of audio frames in the next capture packet).
     * @see https://docs.microsoft.com/windows/win32/api//audioclient/nf-audioclient-iaudiocaptureclient-getnextpacketsize
     */
    GetNextPacketSize() {
        result := ComCall(5, this, "uint*", &pNumFramesInNextPacket := 0, "HRESULT")
        return pNumFramesInNextPacket
    }
}
