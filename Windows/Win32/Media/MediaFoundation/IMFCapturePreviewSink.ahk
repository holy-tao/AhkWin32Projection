#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFCaptureSink.ahk

/**
 * Controls the preview sink.
 * @remarks
 * 
  * To start preview, call <a href="https://docs.microsoft.com/windows/desktop/api/mfcaptureengine/nf-mfcaptureengine-imfcaptureengine-startpreview">IMFCaptureEngine::StartPreview</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mfcaptureengine/nn-mfcaptureengine-imfcapturepreviewsink
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFCapturePreviewSink extends IMFCaptureSink{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFCapturePreviewSink
     * @type {Guid}
     */
    static IID => Guid("{77346cfd-5b49-4d73-ace0-5b52a859f2e0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetRenderHandle", "SetRenderSurface", "UpdateVideo", "SetSampleCallback", "GetMirrorState", "SetMirrorState", "GetRotation", "SetRotation", "SetCustomSink"]

    /**
     * 
     * @param {HANDLE} handle 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfcaptureengine/nf-mfcaptureengine-imfcapturepreviewsink-setrenderhandle
     */
    SetRenderHandle(handle) {
        handle := handle is Win32Handle ? NumGet(handle, "ptr") : handle

        result := ComCall(8, this, "ptr", handle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} pSurface 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfcaptureengine/nf-mfcaptureengine-imfcapturepreviewsink-setrendersurface
     */
    SetRenderSurface(pSurface) {
        result := ComCall(9, this, "ptr", pSurface, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<MFVideoNormalizedRect>} pSrc 
     * @param {Pointer<RECT>} pDst 
     * @param {Pointer<COLORREF>} pBorderClr 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfcaptureengine/nf-mfcaptureengine-imfcapturepreviewsink-updatevideo
     */
    UpdateVideo(pSrc, pDst, pBorderClr) {
        result := ComCall(10, this, "ptr", pSrc, "ptr", pDst, "ptr", pBorderClr, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwStreamSinkIndex 
     * @param {IMFCaptureEngineOnSampleCallback} pCallback 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfcaptureengine/nf-mfcaptureengine-imfcapturepreviewsink-setsamplecallback
     */
    SetSampleCallback(dwStreamSinkIndex, pCallback) {
        result := ComCall(11, this, "uint", dwStreamSinkIndex, "ptr", pCallback, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfMirrorState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfcaptureengine/nf-mfcaptureengine-imfcapturepreviewsink-getmirrorstate
     */
    GetMirrorState(pfMirrorState) {
        result := ComCall(12, this, "ptr", pfMirrorState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fMirrorState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfcaptureengine/nf-mfcaptureengine-imfcapturepreviewsink-setmirrorstate
     */
    SetMirrorState(fMirrorState) {
        result := ComCall(13, this, "int", fMirrorState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwStreamIndex 
     * @param {Pointer<Integer>} pdwRotationValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfcaptureengine/nf-mfcaptureengine-imfcapturepreviewsink-getrotation
     */
    GetRotation(dwStreamIndex, pdwRotationValue) {
        result := ComCall(14, this, "uint", dwStreamIndex, "uint*", pdwRotationValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwStreamIndex 
     * @param {Integer} dwRotationValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfcaptureengine/nf-mfcaptureengine-imfcapturepreviewsink-setrotation
     */
    SetRotation(dwStreamIndex, dwRotationValue) {
        result := ComCall(15, this, "uint", dwStreamIndex, "uint", dwRotationValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMFMediaSink} pMediaSink 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfcaptureengine/nf-mfcaptureengine-imfcapturepreviewsink-setcustomsink
     */
    SetCustomSink(pMediaSink) {
        result := ComCall(16, this, "ptr", pMediaSink, "HRESULT")
        return result
    }
}
