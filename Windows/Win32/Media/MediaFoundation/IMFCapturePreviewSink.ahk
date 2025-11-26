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
     * Specifies a window for preview.
     * @param {HANDLE} handle A handle to the window. The preview sink draws the video frames inside this window.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfcaptureengine/nf-mfcaptureengine-imfcapturepreviewsink-setrenderhandle
     */
    SetRenderHandle(handle) {
        handle := handle is Win32Handle ? NumGet(handle, "ptr") : handle

        result := ComCall(8, this, "ptr", handle, "HRESULT")
        return result
    }

    /**
     * Specifies a Microsoft DirectComposition visual for preview.
     * @param {IUnknown} pSurface A pointer to a DirectComposition visual that implements the <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositionvisual">IDCompositionVisual</a> interface.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfcaptureengine/nf-mfcaptureengine-imfcapturepreviewsink-setrendersurface
     */
    SetRenderSurface(pSurface) {
        result := ComCall(9, this, "ptr", pSurface, "HRESULT")
        return result
    }

    /**
     * Updates the video frame.
     * @param {Pointer<MFVideoNormalizedRect>} pSrc A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/evr/ns-evr-mfvideonormalizedrect">MFVideoNormalizedRect</a> structure that specifies the source rectangle. The source rectangle defines the area of the video frame that is displayed. If this parameter is <b>NULL</b>, the entire video frame is displayed.
     * @param {Pointer<RECT>} pDst A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that specifies the destination rectangle. The destination rectangle defines the area of the window or DirectComposition visual where the video is drawn.
     * @param {Pointer<COLORREF>} pBorderClr The border color. Use the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-rgb">RGB</a> macro to create this value.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfcaptureengine/nf-mfcaptureengine-imfcapturepreviewsink-updatevideo
     */
    UpdateVideo(pSrc, pDst, pBorderClr) {
        pBorderClrMarshal := pBorderClr is VarRef ? "uint*" : "ptr"

        result := ComCall(10, this, "ptr", pSrc, "ptr", pDst, pBorderClrMarshal, pBorderClr, "HRESULT")
        return result
    }

    /**
     * Sets a callback to receive the preview data for one stream.
     * @param {Integer} dwStreamSinkIndex The zero-based index of the stream. The index is returned in the <i>pdwSinkStreamIndex</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/mfcaptureengine/nf-mfcaptureengine-imfcapturesink-addstream">IMFCaptureSink::AddStream</a> method.
     * @param {IMFCaptureEngineOnSampleCallback} pCallback A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfcaptureengine/nn-mfcaptureengine-imfcaptureengineonsamplecallback">IMFCaptureEngineOnSampleCallback</a> interface. The caller must implement this interface.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfcaptureengine/nf-mfcaptureengine-imfcapturepreviewsink-setsamplecallback
     */
    SetSampleCallback(dwStreamSinkIndex, pCallback) {
        result := ComCall(11, this, "uint", dwStreamSinkIndex, "ptr", pCallback, "HRESULT")
        return result
    }

    /**
     * Gets the current mirroring state of the video preview stream.
     * @returns {BOOL} Receives the value <b>TRUE</b> if mirroring is enabled, or <b>FALSE</b> if mirroring is disabled.
     * @see https://docs.microsoft.com/windows/win32/api//mfcaptureengine/nf-mfcaptureengine-imfcapturepreviewsink-getmirrorstate
     */
    GetMirrorState() {
        result := ComCall(12, this, "int*", &pfMirrorState := 0, "HRESULT")
        return pfMirrorState
    }

    /**
     * Enables or disables mirroring of the video preview stream.
     * @param {BOOL} fMirrorState If   <b>TRUE</b>, mirroring is enabled. If <b>FALSE</b>, mirror is disabled.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfcaptureengine/nf-mfcaptureengine-imfcapturepreviewsink-setmirrorstate
     */
    SetMirrorState(fMirrorState) {
        result := ComCall(13, this, "int", fMirrorState, "HRESULT")
        return result
    }

    /**
     * Gets the rotation of the video preview stream.
     * @param {Integer} dwStreamIndex The zero-based index of the stream. You must specify a video stream.
     * @returns {Integer} Receives the image rotation, in degrees.
     * @see https://docs.microsoft.com/windows/win32/api//mfcaptureengine/nf-mfcaptureengine-imfcapturepreviewsink-getrotation
     */
    GetRotation(dwStreamIndex) {
        result := ComCall(14, this, "uint", dwStreamIndex, "uint*", &pdwRotationValue := 0, "HRESULT")
        return pdwRotationValue
    }

    /**
     * Rotates the video preview stream.
     * @param {Integer} dwStreamIndex The zero-based index of the stream to rotate. You must specify a video stream.
     * @param {Integer} dwRotationValue The amount to rotate the video, in degrees. Valid values are 0, 90, 180, and 270. The value zero restores the video to its original orientation.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfcaptureengine/nf-mfcaptureengine-imfcapturepreviewsink-setrotation
     */
    SetRotation(dwStreamIndex, dwRotationValue) {
        result := ComCall(15, this, "uint", dwStreamIndex, "uint", dwRotationValue, "HRESULT")
        return result
    }

    /**
     * Sets a custom media sink for preview.
     * @param {IMFMediaSink} pMediaSink A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfmediasink">IMFMediaSink</a> interface of the media sink.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfcaptureengine/nf-mfcaptureengine-imfcapturepreviewsink-setcustomsink
     */
    SetCustomSink(pMediaSink) {
        result := ComCall(16, this, "ptr", pMediaSink, "HRESULT")
        return result
    }
}
