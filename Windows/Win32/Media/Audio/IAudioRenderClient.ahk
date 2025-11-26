#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IAudioRenderClient interface enables a client to write output data to a rendering endpoint buffer.
 * @see https://docs.microsoft.com/windows/win32/api//audioclient/nn-audioclient-iaudiorenderclient
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class IAudioRenderClient extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAudioRenderClient
     * @type {Guid}
     */
    static IID => Guid("{f294acfc-3146-4483-a7bf-addca7c260e2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetBuffer", "ReleaseBuffer"]

    /**
     * Retrieves a pointer to the next available space in the rendering endpoint buffer into which the caller can write a data packet.
     * @param {Integer} NumFramesRequested The number of audio frames in the data packet that the caller plans to write to the requested space in the buffer. If the call succeeds, the size of the buffer area pointed to by <i>*ppData</i> matches the size specified in <i>NumFramesRequested</i>.
     * @returns {Pointer<Integer>} Pointer to a pointer variable into which the method writes the starting address of the buffer area into which the caller will write the data packet.
     * @see https://docs.microsoft.com/windows/win32/api//audioclient/nf-audioclient-iaudiorenderclient-getbuffer
     */
    GetBuffer(NumFramesRequested) {
        result := ComCall(3, this, "uint", NumFramesRequested, "ptr*", &ppData := 0, "HRESULT")
        return ppData
    }

    /**
     * The ReleaseBuffer method releases the buffer space acquired in the previous call to the IAudioRenderClient::GetBuffer method.
     * @param {Integer} NumFramesWritten The number of audio frames written by the client to the data packet. The value of this parameter must be less than or equal to the size of the data packet, as specified in the <i>NumFramesRequested</i> parameter passed to the <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-iaudiorenderclient-getbuffer">IAudioRenderClient::GetBuffer</a> method.
     * @param {Integer} dwFlags The buffer-configuration flags. The caller can set this parameter either to 0 or to the following <a href="https://docs.microsoft.com/windows/win32/api/audioclient/ne-audioclient-_audclnt_bufferflags">_AUDCLNT_BUFFERFLAGS</a> enumeration value (a flag bit):
     * 
     * AUDCLNT_BUFFERFLAGS_SILENT
     * 
     * If this flag bit is set, the audio engine treats the data packet as though it contains silence regardless of the data values contained in the packet. This flag eliminates the need for the client to explicitly write silence data to the rendering buffer.
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
     * The <i>NumFramesWritten</i> value exceeds the <i>NumFramesRequested</i> value specified in the previous <a href="/windows/desktop/api/audioclient/nf-audioclient-iaudiorenderclient-getbuffer">IAudioRenderClient::GetBuffer</a> call.
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
     * The stream is exclusive mode and uses event-driven buffering, but the client attempted to release a packet that was not the size of the buffer.
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
     * This call was not preceded by a corresponding call to <a href="/windows/desktop/api/audioclient/nf-audioclient-iaudiorenderclient-getbuffer">IAudioRenderClient::GetBuffer</a>.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Parameter <i>dwFlags</i> is not a valid value.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//audioclient/nf-audioclient-iaudiorenderclient-releasebuffer
     */
    ReleaseBuffer(NumFramesWritten, dwFlags) {
        result := ComCall(4, this, "uint", NumFramesWritten, "uint", dwFlags, "HRESULT")
        return result
    }
}
