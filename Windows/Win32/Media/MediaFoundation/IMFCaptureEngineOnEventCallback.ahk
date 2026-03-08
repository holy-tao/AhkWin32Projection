#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Callback interface for receiving events from the capture engine.
 * @remarks
 * To set the callback interface on the capture engine, call the <a href="https://docs.microsoft.com/windows/desktop/api/mfcaptureengine/nf-mfcaptureengine-imfcaptureengine-initialize">IMFCaptureEngine::Initialize</a> method.
 * @see https://learn.microsoft.com/windows/win32/api/mfcaptureengine/nn-mfcaptureengine-imfcaptureengineoneventcallback
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFCaptureEngineOnEventCallback extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFCaptureEngineOnEventCallback
     * @type {Guid}
     */
    static IID => Guid("{aeda51c0-9025-4983-9012-de597b88b089}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnEvent"]

    /**
     * Called by the capture engine to notify the application of a capture event.
     * @remarks
     * To get the type of event, call <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfmediaevent-getextendedtype">IMFMediaEvent::GetExtendedType</a>. This method returns one of the following GUIDs.
     * 
     * <table>
     * <tr>
     * <th>GUID</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td><b>MF_CAPTURE_ENGINE_ALL_EFFECTS_REMOVED</b></td>
     * <td>The <a href="https://docs.microsoft.com/windows/desktop/api/mfcaptureengine/nf-mfcaptureengine-imfcapturesource-removealleffects">IMFCaptureSource::RemoveAllEffects</a> method completed.</td>
     * </tr>
     * <tr>
     * <td><b>MF_CAPTURE_ENGINE_CAMERA_STREAM_BLOCKED</b></td>
     * <td>Video capture has been blocked by the driver.</td>
     * </tr>
     * <tr>
     * <td><b>MF_CAPTURE_ENGINE_CAMERA_STREAM_UNBLOCKED</b></td>
     * <td>Video capture has been restored by the driver after having been blocked.</td>
     * </tr>
     * <tr>
     * <td><b>MF_CAPTURE_ENGINE_EFFECT_ADDED</b></td>
     * <td>The <a href="https://docs.microsoft.com/windows/desktop/api/mfcaptureengine/nf-mfcaptureengine-imfcapturesource-addeffect">IMFCaptureSource::AddEffect</a> method completed.</td>
     * </tr>
     * <tr>
     * <td><b>MF_CAPTURE_ENGINE_EFFECT_REMOVED</b></td>
     * <td>The <a href="https://docs.microsoft.com/windows/desktop/api/mfcaptureengine/nf-mfcaptureengine-imfcapturesource-removeeffect">IMFCaptureSource::RemoveEffect</a> method completed.</td>
     * </tr>
     * <tr>
     * <td><b>MF_CAPTURE_ENGINE_ERROR</b></td>
     * <td>An error occurred during capture.</td>
     * </tr>
     * <tr>
     * <td><b>MF_CAPTURE_ENGINE_INITIALIZED</b></td>
     * <td>The <a href="https://docs.microsoft.com/windows/desktop/api/mfcaptureengine/nf-mfcaptureengine-imfcaptureengine-initialize">IMFCaptureEngine::Initialize</a> method completed.</td>
     * </tr>
     * <tr>
     * <td><b>MF_CAPTURE_ENGINE_PHOTO_TAKEN</b></td>
     * <td>The <a href="https://docs.microsoft.com/windows/desktop/api/mfcaptureengine/nf-mfcaptureengine-imfcaptureengine-takephoto">IMFCaptureEngine::TakePhoto</a> method completed.</td>
     * </tr>
     * <tr>
     * <td><b>MF_CAPTURE_ENGINE_PREVIEW_STARTED</b></td>
     * <td>The <a href="https://docs.microsoft.com/windows/desktop/api/mfcaptureengine/nf-mfcaptureengine-imfcaptureengine-startpreview">IMFCaptureEngine::StartPreview</a> method completed.</td>
     * </tr>
     * <tr>
     * <td><b>MF_CAPTURE_ENGINE_PREVIEW_STOPPED</b></td>
     * <td>The <a href="https://docs.microsoft.com/windows/desktop/api/mfcaptureengine/nf-mfcaptureengine-imfcaptureengine-stoppreview">IMFCaptureEngine::StopPreview</a> method completed.</td>
     * </tr>
     * <tr>
     * <td><b>MF_CAPTURE_ENGINE_RECORD_STARTED</b></td>
     * <td>The <a href="https://docs.microsoft.com/windows/desktop/api/mfcaptureengine/nf-mfcaptureengine-imfcaptureengine-startrecord">IMFCaptureEngine::StartRecord</a> method completed.</td>
     * </tr>
     * <tr>
     * <td><b>MF_CAPTURE_ENGINE_RECORD_STOPPED</b></td>
     * <td>The <a href="https://docs.microsoft.com/windows/desktop/api/mfcaptureengine/nf-mfcaptureengine-imfcaptureengine-stoprecord">IMFCaptureEngine::StopRecord</a> method completed.</td>
     * </tr>
     * <tr>
     * <td><b>MF_CAPTURE_SINK_PREPARED</b></td>
     * <td>The <a href="https://docs.microsoft.com/windows/desktop/api/mfcaptureengine/nf-mfcaptureengine-imfcapturesink-prepare">IMFCaptureSink::Prepare</a> method completed.</td>
     * </tr>
     * <tr>
     * <td><b>MF_CAPTURE_SOURCE_CURRENT_DEVICE_MEDIA_TYPE_SET</b></td>
     * <td>The <a href="https://docs.microsoft.com/windows/desktop/api/mfcaptureengine/nf-mfcaptureengine-imfcapturesource-setcurrentdevicemediatype">IMFCaptureSource::SetCurrentDeviceMediaType</a>   method completed.</td>
     * </tr>
     * </table>
     *  
     * 
     * This method may be called from a worker thread. The implementation should be thread-safe.
     * 
     * To get the status code for the event, call <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfmediaevent-getstatus">IMFMediaEvent::GetStatus</a>. If the status code is an error code, it indicates that the requested operation failed.
     * 
     * In addition, the event object specified by <i>pEvent</i> might contain any of the following attributes.
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-capture-engine-event-generator-guid">MF_CAPTURE_ENGINE_EVENT_GENERATOR_GUID</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/hh162817(v=vs.85)">MF_CAPTURE_ENGINE_EVENT_STREAM_INDEX</a>
     * </li>
     * </ul>
     * To get event attributes, use the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfattributes">IMFAttributes</a> interface, which <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediaevent">IMFMediaEvent</a> inherits.
     * @param {IMFMediaEvent} pEvent A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediaevent">IMFMediaEvent</a> interface. Use this interface to get information about the event, as described in Remarks.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfcaptureengine/nf-mfcaptureengine-imfcaptureengineoneventcallback-onevent
     */
    OnEvent(pEvent) {
        result := ComCall(3, this, "ptr", pEvent, "HRESULT")
        return result
    }
}
