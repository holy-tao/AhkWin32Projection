#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Base interface that provides methods for controlling a spatial audio object render stream, including starting, stopping, and resetting the stream.
 * @see https://docs.microsoft.com/windows/win32/api//spatialaudioclient/nn-spatialaudioclient-ispatialaudioobjectrenderstreambase
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class ISpatialAudioObjectRenderStreamBase extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpatialAudioObjectRenderStreamBase
     * @type {Guid}
     */
    static IID => Guid("{feaaf403-c1d8-450d-aa05-e0ccee7502a8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetAvailableDynamicObjectCount", "GetService", "Start", "Stop", "Reset", "BeginUpdatingAudioObjects", "EndUpdatingAudioObjects"]

    /**
     * Gets the number of dynamic spatial audio objects that are currently available.
     * @returns {Integer} The number of dynamic spatial audio objects that are currently available.
     * @see https://docs.microsoft.com/windows/win32/api//spatialaudioclient/nf-spatialaudioclient-ispatialaudioobjectrenderstreambase-getavailabledynamicobjectcount
     */
    GetAvailableDynamicObjectCount() {
        result := ComCall(3, this, "uint*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Gets additional services from the ISpatialAudioObjectRenderStream.
     * @param {Pointer<Guid>} riid The interface ID for the requested service. The client should set this parameter to one of the following REFIID values:
     * 
     * IID_IAudioClock
     * 
     * IID_IAudioClock2
     * 
     * IID_IAudioStreamVolume
     * @returns {Pointer<Void>} Pointer to a pointer variable into which the method writes the address of an instance of the requested interface. Through this method, the caller obtains a counted reference to the interface. The caller is responsible for releasing the interface, when it is no longer needed, by calling the interface's <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> method. If the <b>GetService</b> call fails, <i>*ppv </i>is NULL.
     * @see https://docs.microsoft.com/windows/win32/api//spatialaudioclient/nf-spatialaudioclient-ispatialaudioobjectrenderstreambase-getservice
     */
    GetService(riid) {
        result := ComCall(4, this, "ptr", riid, "ptr*", &service := 0, "HRESULT")
        return service
    }

    /**
     * Starts the spatial audio stream.
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
     * <dt><b>SPTLAUDCLNT_E_STREAM_NOT_STOPPED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The audio stream has not been stopped. Stop the stream by calling <a href="/windows/desktop/api/audioclient/nf-audioclient-iaudioclient-stop">Stop</a>.
     * 
     * </td>
     * </tr>
     * 
     * 
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SPTLAUDCLNT_E_DESTROYED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <a href="/windows/win32/api/spatialaudioclient/nn-spatialaudioclient-ispatialaudioclient">ISpatialAudioClient</a> associated with the spatial audio stream has been destroyed.
     * 
     * </td>
     * </tr>
     * 
     * 
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
     * 
     * 
     * 
     * 
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SPTLAUDCLNT_E_INTERNAL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An internal error has occurred.
     * 
     * </td>
     * </tr>
     * 
     * 
     * 
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>AUDCLNT_E_UNSUPPORTED_FORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The media associated with the spatial audio stream uses an unsupported format.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//spatialaudioclient/nf-spatialaudioclient-ispatialaudioobjectrenderstreambase-start
     */
    Start() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * Stops a running audio stream.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * 
     * 
     * 
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SPTLAUDCLNT_E_DESTROYED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <a href="/windows/win32/api/spatialaudioclient/nn-spatialaudioclient-ispatialaudioclient">ISpatialAudioClient</a> associated with the spatial audio stream has been destroyed.
     * 
     * </td>
     * </tr>
     * 
     * 
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
     * 
     * 
     * 
     * 
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SPTLAUDCLNT_E_INTERNAL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An internal error has occurred.
     * 
     * </td>
     * </tr>
     * 
     * 
     * 
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>AUDCLNT_E_UNSUPPORTED_FORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The media associated with the spatial audio stream uses an unsupported format.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//spatialaudioclient/nf-spatialaudioclient-ispatialaudioobjectrenderstreambase-stop
     */
    Stop() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * Reset a stopped audio stream.
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
     * <dt><b>SPTLAUDCLNT_E_STREAM_NOT_STOPPED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The audio stream has not been stopped. Stop the stream by calling <a href="/windows/desktop/api/audioclient/nf-audioclient-iaudioclient-stop">Stop</a>.
     * 
     * </td>
     * </tr>
     * 
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SPTLAUDCLNT_E_DESTROYED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <a href="/windows/win32/api/spatialaudioclient/nn-spatialaudioclient-ispatialaudioclient">ISpatialAudioClient</a> associated with the spatial audio stream has been destroyed.
     * 
     * </td>
     * </tr>
     * 
     * 
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
     * 
     * 
     * 
     * 
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SPTLAUDCLNT_E_INTERNAL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An internal error has occurred.
     * 
     * </td>
     * </tr>
     * 
     * 
     * 
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>AUDCLNT_E_UNSUPPORTED_FORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The media associated with the spatial audio stream uses an unsupported format.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//spatialaudioclient/nf-spatialaudioclient-ispatialaudioobjectrenderstreambase-reset
     */
    Reset() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * Puts the system into the state where audio object data can be submitted for processing and the ISpatialAudioObject state can be modified.
     * @param {Pointer<Integer>} availableDynamicObjectCount The number of dynamic audio objects that are available to be rendered for the current processing pass. All allocated static audio objects can be rendered in every pass. For information on audio object types, see <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudioclient/ne-spatialaudioclient-audioobjecttype">AudioObjectType</a>.
     * @param {Pointer<Integer>} frameCountPerBuffer The size, in audio frames, of the buffer returned by <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudioclient/nf-spatialaudioclient-ispatialaudioobjectbase-getbuffer">GetBuffer</a>.
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
     * <dt><b>SPTLAUDCLNT_E_OUT_OF_ORDER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>BeginUpdatingAudioObjects</b> was called twice without a matching call to <a href="/windows/desktop/api/spatialaudioclient/nf-spatialaudioclient-ispatialaudioobjectrenderstreambase-endupdatingaudioobjects">EndUpdatingAudioObjects</a> between the two calls.
     * 
     * </td>
     * </tr>
     * 
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SPTLAUDCLNT_E_DESTROYED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <a href="/windows/win32/api/spatialaudioclient/nn-spatialaudioclient-ispatialaudioclient">ISpatialAudioClient</a> associated with the spatial audio stream has been destroyed.
     * 
     * </td>
     * </tr>
     * 
     * 
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
     * 
     * 
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>AUDCLNT_E_RESOURCES_INVALIDATED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A resource associated with the spatial audio stream is no longer valid.
     * 
     * </td>
     * </tr>
     * 
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SPTLAUDCLNT_E_INTERNAL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An internal error has occurred.
     * 
     * </td>
     * </tr>
     * 
     * 
     * 
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>AUDCLNT_E_UNSUPPORTED_FORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The media associated with the spatial audio stream uses an unsupported format.
     * 
     * </td>
     * </tr>
     * 
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//spatialaudioclient/nf-spatialaudioclient-ispatialaudioobjectrenderstreambase-beginupdatingaudioobjects
     */
    BeginUpdatingAudioObjects(availableDynamicObjectCount, frameCountPerBuffer) {
        availableDynamicObjectCountMarshal := availableDynamicObjectCount is VarRef ? "uint*" : "ptr"
        frameCountPerBufferMarshal := frameCountPerBuffer is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, availableDynamicObjectCountMarshal, availableDynamicObjectCount, frameCountPerBufferMarshal, frameCountPerBuffer, "HRESULT")
        return result
    }

    /**
     * Notifies the system that the app has finished supplying audio data for the spatial audio objects activated with ActivateSpatialAudioObject.
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
     * <dt><b>SPTLAUDCLNT_E_OUT_OF_ORDER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>EndUpdatingAudioObjects</b> was called before <a href="/windows/desktop/api/spatialaudioclient/nf-spatialaudioclient-ispatialaudioobjectrenderstreambase-beginupdatingaudioobjects">BeginUpdatingAudioObjects</a>.
     * 
     * </td>
     * </tr>
     * 
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SPTLAUDCLNT_E_DESTROYED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <a href="/windows/win32/api/spatialaudioclient/nn-spatialaudioclient-ispatialaudioclient">ISpatialAudioClient</a> associated with the spatial audio stream has been destroyed.
     * 
     * </td>
     * </tr>
     * 
     * 
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
     * 
     * 
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>AUDCLNT_E_RESOURCES_INVALIDATED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A resource associated with the spatial audio stream is no longer valid.
     * 
     * </td>
     * </tr>
     * 
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SPTLAUDCLNT_E_INTERNAL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An internal error has occurred.
     * 
     * </td>
     * </tr>
     * 
     * 
     * 
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>AUDCLNT_E_UNSUPPORTED_FORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The media associated with the spatial audio stream uses an unsupported format.
     * 
     * </td>
     * </tr>
     * 
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//spatialaudioclient/nf-spatialaudioclient-ispatialaudioobjectrenderstreambase-endupdatingaudioobjects
     */
    EndUpdatingAudioObjects() {
        result := ComCall(9, this, "HRESULT")
        return result
    }
}
