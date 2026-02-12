#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFClockStateSink.ahk

/**
 * Callback interface to get media data from the sample-grabber sink.
 * @remarks
 * The sample-grabber sink enables an application to get data from the Media Foundation pipeline without implementing a custom media sink. To use the sample-grabber sink, the application must perform the following steps:
 * 
 * <ol>
 * <li>
 * Implement the <b>IMFSampleGrabberSinkCallback</b> interface.
 * 
 * </li>
 * <li>
 * Call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-mfcreatesamplegrabbersinkactivate">MFCreateSampleGrabberSinkActivate</a>, passing in the <b>IMFSampleGrabberSinkCallback</b> interface pointer. This function returns an <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfactivate">IMFActivate</a> object.
 * 
 * </li>
 * <li>
 * Create a topology that includes an output node with the sink's <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfactivate">IMFActivate</a> object.
 * 
 * </li>
 * <li>
 * Pass this topology to the Media Session.
 * 
 * </li>
 * </ol>
 * During playback, the sample-grabber sink calls methods on the application's callback.
 * 
 * You cannot use the sample-grabber sink to get protected content.
 * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nn-mfidl-imfsamplegrabbersinkcallback
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFSampleGrabberSinkCallback extends IMFClockStateSink{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFSampleGrabberSinkCallback
     * @type {Guid}
     */
    static IID => Guid("{8c7b80bf-ee42-4b59-b1df-55668e1bdca8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnSetPresentationClock", "OnProcessSample", "OnShutdown"]

    /**
     * Called when the presentation clock is set on the sample-grabber sink.
     * @remarks
     * This method should return quickly, or it might interfere with playback. Do not block the thread, wait on events, or perform other lengthy operations inside this method.
     * @param {IMFPresentationClock} pPresentationClock Pointer to the presentation clock's <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfpresentationclock">IMFPresentationClock</a> interface.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nf-mfidl-imfsamplegrabbersinkcallback-onsetpresentationclock
     */
    OnSetPresentationClock(pPresentationClock) {
        result := ComCall(8, this, "ptr", pPresentationClock, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Called when the sample-grabber sink receives a new media sample. (IMFSampleGrabberSinkCallback.OnProcessSample)
     * @remarks
     * If you use the sample-grabber sink in a playback topology, this method should return quickly, or it might interfere with playback. Do not block the thread, wait on events, or perform other lengthy operations inside this method.
     * @param {Pointer<Guid>} guidMajorMediaType The major type that specifies the format of the data. For a list of possible values, see <a href="https://docs.microsoft.com/windows/desktop/medfound/media-type-guids">Major Media Types</a>.
     * @param {Integer} dwSampleFlags Reserved.
     * @param {Integer} llSampleTime The presentation time for this sample, in 100-nanosecond units.
     *           If the sample does not have a presentation time, the value of this parameter is <b>_I64_MAX</b>.
     * @param {Integer} llSampleDuration The duration of the sample, in 100-nanosecond units.
     *           If the sample does not have a duration, the value of this parameter is <b>_I64_MAX</b>.
     * @param {Pointer} pSampleBuffer A pointer to a buffer that contains the sample data.
     * @param {Integer} dwSampleSize Size of the <i>pSampleBuffer</i> buffer, in bytes.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nf-mfidl-imfsamplegrabbersinkcallback-onprocesssample
     */
    OnProcessSample(guidMajorMediaType, dwSampleFlags, llSampleTime, llSampleDuration, pSampleBuffer, dwSampleSize) {
        result := ComCall(9, this, "ptr", guidMajorMediaType, "uint", dwSampleFlags, "int64", llSampleTime, "int64", llSampleDuration, "ptr", pSampleBuffer, "uint", dwSampleSize, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Called when the sample-grabber sink is shut down.
     * @remarks
     * This method is called when the sink's <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfmediasink-shutdown">IMFMediaSink::Shutdown</a> method is called.
     * 
     * The <b>OnShutdown</b> method should return quickly, or it might interfere with playback. Do not block the thread, wait on events, or perform other lengthy operations inside this method.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nf-mfidl-imfsamplegrabbersinkcallback-onshutdown
     */
    OnShutdown() {
        result := ComCall(10, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
