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
     * 
     * @param {HANDLE} handle 
     * @returns {HRESULT} 
     */
    SetRenderHandle(handle) {
        handle := handle is Win32Handle ? NumGet(handle, "ptr") : handle

        result := ComCall(8, this, "ptr", handle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} pSurface 
     * @returns {HRESULT} 
     */
    SetRenderSurface(pSurface) {
        result := ComCall(9, this, "ptr", pSurface, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<MFVideoNormalizedRect>} pSrc 
     * @param {Pointer<RECT>} pDst 
     * @param {Pointer<COLORREF>} pBorderClr 
     * @returns {HRESULT} 
     */
    UpdateVideo(pSrc, pDst, pBorderClr) {
        result := ComCall(10, this, "ptr", pSrc, "ptr", pDst, "ptr", pBorderClr, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwStreamSinkIndex 
     * @param {Pointer<IMFCaptureEngineOnSampleCallback>} pCallback 
     * @returns {HRESULT} 
     */
    SetSampleCallback(dwStreamSinkIndex, pCallback) {
        result := ComCall(11, this, "uint", dwStreamSinkIndex, "ptr", pCallback, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfMirrorState 
     * @returns {HRESULT} 
     */
    GetMirrorState(pfMirrorState) {
        result := ComCall(12, this, "ptr", pfMirrorState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} fMirrorState 
     * @returns {HRESULT} 
     */
    SetMirrorState(fMirrorState) {
        result := ComCall(13, this, "int", fMirrorState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwStreamIndex 
     * @param {Pointer<UInt32>} pdwRotationValue 
     * @returns {HRESULT} 
     */
    GetRotation(dwStreamIndex, pdwRotationValue) {
        result := ComCall(14, this, "uint", dwStreamIndex, "uint*", pdwRotationValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwStreamIndex 
     * @param {Integer} dwRotationValue 
     * @returns {HRESULT} 
     */
    SetRotation(dwStreamIndex, dwRotationValue) {
        result := ComCall(15, this, "uint", dwStreamIndex, "uint", dwRotationValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMFMediaSink>} pMediaSink 
     * @returns {HRESULT} 
     */
    SetCustomSink(pMediaSink) {
        result := ComCall(16, this, "ptr", pMediaSink, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
