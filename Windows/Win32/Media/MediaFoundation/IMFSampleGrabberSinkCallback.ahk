#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFClockStateSink.ahk

/**
 * Callback interface to get media data from the sample-grabber sink.
 * @remarks
 * 
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
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfsamplegrabbersinkcallback
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
     * 
     * @param {IMFPresentationClock} pPresentationClock 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsamplegrabbersinkcallback-onsetpresentationclock
     */
    OnSetPresentationClock(pPresentationClock) {
        result := ComCall(8, this, "ptr", pPresentationClock, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guidMajorMediaType 
     * @param {Integer} dwSampleFlags 
     * @param {Integer} llSampleTime 
     * @param {Integer} llSampleDuration 
     * @param {Pointer} pSampleBuffer 
     * @param {Integer} dwSampleSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsamplegrabbersinkcallback-onprocesssample
     */
    OnProcessSample(guidMajorMediaType, dwSampleFlags, llSampleTime, llSampleDuration, pSampleBuffer, dwSampleSize) {
        result := ComCall(9, this, "ptr", guidMajorMediaType, "uint", dwSampleFlags, "int64", llSampleTime, "int64", llSampleDuration, "ptr", pSampleBuffer, "uint", dwSampleSize, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsamplegrabbersinkcallback-onshutdown
     */
    OnShutdown() {
        result := ComCall(10, this, "HRESULT")
        return result
    }
}
