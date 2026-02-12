#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Base interface that provides methods for controlling a spatial audio object render stream, including starting, stopping, and resetting the stream.
 * @see https://learn.microsoft.com/windows/win32/api//content/spatialaudioclient/nn-spatialaudioclient-ispatialaudioobjectrenderstreambase
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
     * @remarks
     * A dynamic <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudioclient/nn-spatialaudioclient-ispatialaudioobject">ISpatialAudioObject</a> is one that was activated by setting the <i>type</i> parameter to the  <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudioclient/nf-spatialaudioclient-ispatialaudioobjectrenderstream-activatespatialaudioobject">ActivateSpatialAudioObject</a> method to <b>AudioObjectType_Dynamic</b>. The system has a limit of the maximum number of dynamic spatial audio objects that can be activated at one time. Call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> on an <b>ISpatialAudioObject</b>  when it is no longer being used to free up the resource to create new dynamic spatial audio objects.
     * 
     * 
     * You should not call this method after streaming has started, as the value is already provided by [ISpatialAudioObjectRenderStreamBase::BeginUpdatingAudioObjects](./nf-spatialaudioclient-ispatialaudioobjectrenderstreambase-beginupdatingaudioobjects.md). This method should only be called before streaming has started, which occurs after [ISpatialAudioObjectRenderStreamBase::Start](./nf-spatialaudioclient-ispatialaudioobjectrenderstreambase-start.md) is called.
     * @returns {Integer} The number of dynamic spatial audio objects that are currently available.
     * @see https://learn.microsoft.com/windows/win32/api//content/spatialaudioclient/nf-spatialaudioclient-ispatialaudioobjectrenderstreambase-getavailabledynamicobjectcount
     */
    GetAvailableDynamicObjectCount() {
        result := ComCall(3, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Gets additional services from the ISpatialAudioObjectRenderStream.
     * @remarks
     * The <b>GetService</b> method supports the following service interfaces:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nn-audioclient-iaudioclock">IAudioClock</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nn-audioclient-iaudioclock2">IAudioClock2</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nn-audioclient-iaudiostreamvolume">IAudioStreamVolume</a>
     * </li>
     * </ul>
     * @param {Pointer<Guid>} riid The interface ID for the requested service. The client should set this parameter to one of the following REFIID values:
     * 
     * IID_IAudioClock
     * 
     * IID_IAudioClock2
     * 
     * IID_IAudioStreamVolume
     * @returns {Pointer<Pointer<Void>>} Pointer to a pointer variable into which the method writes the address of an instance of the requested interface. Through this method, the caller obtains a counted reference to the interface. The caller is responsible for releasing the interface, when it is no longer needed, by calling the interface's <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> method. If the <b>GetService</b> call fails, <i>*ppv </i> is NULL.
     * @see https://learn.microsoft.com/windows/win32/api//content/spatialaudioclient/nf-spatialaudioclient-ispatialaudioobjectrenderstreambase-getservice
     */
    GetService(riid) {
        result := ComCall(4, this, "ptr", riid, "ptr*", &service := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return service
    }

    /**
     * Starts the spatial audio stream.
     * @remarks
     * Starting the stream causes data flow between the endpoint buffer and the audio engine.  
     *     The first time this method is called, the stream's audio clock position will be at 0.  
     *     Otherwise, the clock resumes from its position at the time that the stream was last paused with a call to <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudioclient/nf-spatialaudioclient-ispatialaudioobjectrenderstreambase-stop">Stop</a>.  
     * Call <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudioclient/nf-spatialaudioclient-ispatialaudioobjectrenderstreambase-reset">Reset</a> to  reset the clock position to 0 and cause all active <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudioclient/nn-spatialaudioclient-ispatialaudioobject">ISpatialAudioObject</a> instances to be revoked. 
     * 
     * The stream must have been previously stopped with a call to <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudioclient/nf-spatialaudioclient-ispatialaudioobjectrenderstreambase-stop">Stop</a> or the method will fail and return SPTLAUDCLNT_E_STREAM_NOT_STOPPED.
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
     * The audio stream has not been stopped. Stop the stream by calling <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-iaudioclient-stop">Stop</a>.
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
     * The <a href="https://docs.microsoft.com/windows/win32/api/spatialaudioclient/nn-spatialaudioclient-ispatialaudioclient">ISpatialAudioClient</a> associated with the spatial audio stream has been destroyed.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/spatialaudioclient/nf-spatialaudioclient-ispatialaudioobjectrenderstreambase-start
     */
    Start() {
        result := ComCall(5, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Stops a running audio stream.
     * @remarks
     * Stopping stream causes data to stop flowing between the endpoint buffer and the audio engine.  
     *     You can consider this operation to pause the stream because it leaves the stream's audio clock at its current stream position and does not reset it to 0. A subsequent call to <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudioclient/nf-spatialaudioclient-ispatialaudioobjectrenderstreambase-start">Start</a> causes the stream to resume running from the current position.  
     *     Call <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudioclient/nf-spatialaudioclient-ispatialaudioobjectrenderstreambase-reset">Reset</a> to  reset the clock position to 0 and cause all active <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudioclient/nn-spatialaudioclient-ispatialaudioobject">ISpatialAudioObject</a> instances to be revoked.
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
     * The <a href="https://docs.microsoft.com/windows/win32/api/spatialaudioclient/nn-spatialaudioclient-ispatialaudioclient">ISpatialAudioClient</a> associated with the spatial audio stream has been destroyed.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/spatialaudioclient/nf-spatialaudioclient-ispatialaudioobjectrenderstreambase-stop
     */
    Stop() {
        result := ComCall(6, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Reset a stopped audio stream.
     * @remarks
     * Resetting the audio stream flushes all pending data and resets the audio clock stream position to 0. Resetting the stream also causes all active <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudioclient/nn-spatialaudioclient-ispatialaudioobject">ISpatialAudioObject</a> instances to be revoked.  
     *     A subsequent call to <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudioclient/nf-spatialaudioclient-ispatialaudioobjectrenderstreambase-start">Start</a> causes the stream to start from 0 position.  
     * 
     * The stream must have been previously stopped with a call to <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudioclient/nf-spatialaudioclient-ispatialaudioobjectrenderstreambase-stop">Stop</a> or the method will fail and return SPTLAUDCLNT_E_STREAM_NOT_STOPPED.
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
     * The audio stream has not been stopped. Stop the stream by calling <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-iaudioclient-stop">Stop</a>.
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
     * The <a href="https://docs.microsoft.com/windows/win32/api/spatialaudioclient/nn-spatialaudioclient-ispatialaudioclient">ISpatialAudioClient</a> associated with the spatial audio stream has been destroyed.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/spatialaudioclient/nf-spatialaudioclient-ispatialaudioobjectrenderstreambase-reset
     */
    Reset() {
        result := ComCall(7, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Puts the system into the state where audio object data can be submitted for processing and the ISpatialAudioObject state can be modified.
     * @remarks
     * This method must be called each time the event passed in the <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudioclient/ns-spatialaudioclient-spatialaudioobjectrenderstreamactivationparams">SpatialAudioObjectRenderStreamActivationParams</a> to <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudioclient/nf-spatialaudioclient-ispatialaudioclient-activatespatialaudiostream">ISpatialAudioClient::ActivateSpatialAudioStream</a> is signaled,  
     *      even if there no audio object data to submit.
     * 
     * For each <b>BeginUpdatingAudioObjects</b> call, there should be a corresponding call to <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudioclient/nf-spatialaudioclient-ispatialaudioobjectrenderstreambase-endupdatingaudioobjects">EndUpdatingAudioObjects</a> call.  
     *     If <b>BeginUpdatingAudioObjects</b> is called twice without a call <b>EndUpdatingAudioObjects</b> between them, the second call to  
     *     <b>BeginUpdatingAudioObjects</b> will return SPTLAUDCLNT_E_OUT_OF_ORDER.
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
     * <b>BeginUpdatingAudioObjects</b> was called twice without a matching call to <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudioclient/nf-spatialaudioclient-ispatialaudioobjectrenderstreambase-endupdatingaudioobjects">EndUpdatingAudioObjects</a> between the two calls.
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
     * The <a href="https://docs.microsoft.com/windows/win32/api/spatialaudioclient/nn-spatialaudioclient-ispatialaudioclient">ISpatialAudioClient</a> associated with the spatial audio stream has been destroyed.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/spatialaudioclient/nf-spatialaudioclient-ispatialaudioobjectrenderstreambase-beginupdatingaudioobjects
     */
    BeginUpdatingAudioObjects(availableDynamicObjectCount, frameCountPerBuffer) {
        availableDynamicObjectCountMarshal := availableDynamicObjectCount is VarRef ? "uint*" : "ptr"
        frameCountPerBufferMarshal := frameCountPerBuffer is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, availableDynamicObjectCountMarshal, availableDynamicObjectCount, frameCountPerBufferMarshal, frameCountPerBuffer, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Notifies the system that the app has finished supplying audio data for the spatial audio objects activated with ActivateSpatialAudioObject.
     * @remarks
     * The pointers retrieved with <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudioclient/nf-spatialaudioclient-ispatialaudioobjectbase-getbuffer">ISpatialAudioObjectBase::GetBuffer</a> can no longer be used after this method is called.
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
     * <b>EndUpdatingAudioObjects</b> was called before <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudioclient/nf-spatialaudioclient-ispatialaudioobjectrenderstreambase-beginupdatingaudioobjects">BeginUpdatingAudioObjects</a>.
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
     * The <a href="https://docs.microsoft.com/windows/win32/api/spatialaudioclient/nn-spatialaudioclient-ispatialaudioclient">ISpatialAudioClient</a> associated with the spatial audio stream has been destroyed.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/spatialaudioclient/nf-spatialaudioclient-ispatialaudioobjectrenderstreambase-endupdatingaudioobjects
     */
    EndUpdatingAudioObjects() {
        result := ComCall(9, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
