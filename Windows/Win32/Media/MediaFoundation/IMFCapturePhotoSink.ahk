#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IMFCaptureEngineOnSampleCallback.ahk" { IMFCaptureEngineOnSampleCallback }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMFCaptureSink.ahk" { IMFCaptureSink }
#Import ".\IMFByteStream.ahk" { IMFByteStream }

/**
 * Controls the photo sink.
 * @remarks
 * The photo sink can deliver samples to one of the following destinations:
 * 
 * <ul>
 * <li>Byte stream.</li>
 * <li>Output file.</li>
 * <li>Application-provided callback interface.</li>
 * </ul>
 * The application must specify a single destination. Multiple destinations are not supported.
 * 
 * To capture an image, call <a href="https://docs.microsoft.com/windows/desktop/api/mfcaptureengine/nf-mfcaptureengine-imfcaptureengine-takephoto">IMFCaptureEngine::TakePhoto</a>.
 * @see https://learn.microsoft.com/windows/win32/api/mfcaptureengine/nn-mfcaptureengine-imfcapturephotosink
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFCapturePhotoSink extends IMFCaptureSink {
    /**
     * The interface identifier for IMFCapturePhotoSink
     * @type {Guid}
     */
    static IID := Guid("{d2d43cc8-48bb-4aa7-95db-10c06977e777}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFCapturePhotoSink interfaces
    */
    struct Vtbl extends IMFCaptureSink.Vtbl {
        SetOutputFileName   : IntPtr
        SetSampleCallback   : IntPtr
        SetOutputByteStream : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFCapturePhotoSink.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Specifies the name of the output file for the still image.
     * @remarks
     * Calling this method overrides any previous call to <a href="https://docs.microsoft.com/windows/desktop/api/mfcaptureengine/nf-mfcaptureengine-imfcapturephotosink-setoutputbytestream">IMFCapturePhotoSink::SetOutputByteStream</a> or <a href="https://docs.microsoft.com/windows/desktop/api/mfcaptureengine/nf-mfcaptureengine-imfcapturephotosink-setsamplecallback">IMFCapturePhotoSink::SetSampleCallback</a>.
     * @param {PWSTR} fileName A null-terminated string that contains the URL of the output file.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfcaptureengine/nf-mfcaptureengine-imfcapturephotosink-setoutputfilename
     */
    SetOutputFileName(fileName) {
        fileName := fileName is String ? StrPtr(fileName) : fileName

        result := ComCall(8, this, "ptr", fileName, "HRESULT")
        return result
    }

    /**
     * Sets a callback to receive the still-image data.
     * @remarks
     * Calling this method overrides any previous call to <a href="https://docs.microsoft.com/windows/desktop/api/mfcaptureengine/nf-mfcaptureengine-imfcapturephotosink-setoutputbytestream">IMFCapturePhotoSink::SetOutputByteStream</a> or  <a href="https://docs.microsoft.com/windows/desktop/api/mfcaptureengine/nf-mfcaptureengine-imfcapturephotosink-setoutputfilename">IMFCapturePhotoSink::SetOutputFileName</a>.
     * @param {IMFCaptureEngineOnSampleCallback} pCallback A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfcaptureengine/nn-mfcaptureengine-imfcaptureengineonsamplecallback">IMFCaptureEngineOnSampleCallback</a> interface. The caller must implement this interface.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfcaptureengine/nf-mfcaptureengine-imfcapturephotosink-setsamplecallback
     */
    SetSampleCallback(pCallback) {
        result := ComCall(9, this, "ptr", pCallback, "HRESULT")
        return result
    }

    /**
     * Specifies a byte stream that will receive the still image data.
     * @remarks
     * Calling this method overrides any previous call to <a href="https://docs.microsoft.com/windows/desktop/api/mfcaptureengine/nf-mfcaptureengine-imfcapturephotosink-setoutputfilename">IMFCapturePhotoSink::SetOutputFileName</a> or <a href="https://docs.microsoft.com/windows/desktop/api/mfcaptureengine/nf-mfcaptureengine-imfcapturephotosink-setsamplecallback">IMFCapturePhotoSink::SetSampleCallback</a>.
     * @param {IMFByteStream} pByteStream A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfbytestream">IMFByteStream</a> interface of a byte stream. The byte stream must be writable.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfcaptureengine/nf-mfcaptureengine-imfcapturephotosink-setoutputbytestream
     */
    SetOutputByteStream(pByteStream) {
        result := ComCall(10, this, "ptr", pByteStream, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMFCapturePhotoSink.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetOutputFileName := CallbackCreate(GetMethod(implObj, "SetOutputFileName"), flags, 2)
        this.vtbl.SetSampleCallback := CallbackCreate(GetMethod(implObj, "SetSampleCallback"), flags, 2)
        this.vtbl.SetOutputByteStream := CallbackCreate(GetMethod(implObj, "SetOutputByteStream"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetOutputFileName)
        CallbackFree(this.vtbl.SetSampleCallback)
        CallbackFree(this.vtbl.SetOutputByteStream)
    }
}
