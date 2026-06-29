#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IMFCaptureEngineOnSampleCallback.ahk" { IMFCaptureEngineOnSampleCallback }
#Import ".\IMFMediaSink.ahk" { IMFMediaSink }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMFCaptureSink.ahk" { IMFCaptureSink }
#Import ".\IMFByteStream.ahk" { IMFByteStream }

/**
 * Controls the recording sink.
 * @remarks
 * The recording sink can deliver samples to one of the following destinations:
 * 
 * <ul>
 * <li>Byte stream.</li>
 * <li>Output file.</li>
 * <li>Application-provided callback interface.</li>
 * </ul>
 * The application must specify a single destination. Multiple destinations are not supported. (However, if a callback is used, you can provide a separate callback for each stream.)
 * 
 * If the destination is a byte stream or an output file, the application specifies a container type, such as MP4 or ASF. The capture engine then multiplexes the audio and video to produce the format defined by the container type. If the destination is a callback interface, however, the capture engine does not multiplex or otherwise interleave the samples. The callback option gives you the most control over the recorded output, but requires more work by the application.
 * 
 * To start the recording, call <a href="https://docs.microsoft.com/windows/desktop/api/mfcaptureengine/nf-mfcaptureengine-imfcaptureengine-startrecord">IMFCaptureEngine::StartRecord</a>.
 * @see https://learn.microsoft.com/windows/win32/api/mfcaptureengine/nn-mfcaptureengine-imfcapturerecordsink
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFCaptureRecordSink extends IMFCaptureSink {
    /**
     * The interface identifier for IMFCaptureRecordSink
     * @type {Guid}
     */
    static IID := Guid("{3323b55a-f92a-4fe2-8edc-e9bfc0634d77}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFCaptureRecordSink interfaces
    */
    struct Vtbl extends IMFCaptureSink.Vtbl {
        SetOutputByteStream : IntPtr
        SetOutputFileName   : IntPtr
        SetSampleCallback   : IntPtr
        SetCustomSink       : IntPtr
        GetRotation         : IntPtr
        SetRotation         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFCaptureRecordSink.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Specifies a byte stream that will receive the data for the recording.
     * @remarks
     * Calling this method overrides any previous call to <a href="https://docs.microsoft.com/windows/desktop/api/mfcaptureengine/nf-mfcaptureengine-imfcapturerecordsink-setoutputfilename">IMFCaptureRecordSink::SetOutputFileName</a> or <a href="https://docs.microsoft.com/windows/desktop/api/mfcaptureengine/nf-mfcaptureengine-imfcapturerecordsink-setsamplecallback">IMFCaptureRecordSink::SetSampleCallback</a>.
     * @param {IMFByteStream} pByteStream A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfbytestream">IMFByteStream</a> interface of a byte stream. The byte stream must be writable.
     * @param {Pointer<Guid>} guidContainerType A GUID that specifies the file container type. Possible values are documented in the <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-transcode-containertype">MF_TRANSCODE_CONTAINERTYPE</a>  attribute.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfcaptureengine/nf-mfcaptureengine-imfcapturerecordsink-setoutputbytestream
     */
    SetOutputByteStream(pByteStream, guidContainerType) {
        result := ComCall(8, this, "ptr", pByteStream, Guid.Ptr, guidContainerType, "HRESULT")
        return result
    }

    /**
     * Specifies the name of the output file for the recording.
     * @remarks
     * The capture engine uses the file name extension to select the container type for the output file. For example, if the file name extension is ."mp4", the capture engine creates an MP4 file.
     * 
     * Calling this method overrides any previous call to <a href="https://docs.microsoft.com/windows/desktop/api/mfcaptureengine/nf-mfcaptureengine-imfcapturerecordsink-setoutputbytestream">IMFCaptureRecordSink::SetOutputByteStream</a> or <a href="https://docs.microsoft.com/windows/desktop/api/mfcaptureengine/nf-mfcaptureengine-imfcapturerecordsink-setsamplecallback">IMFCaptureRecordSink::SetSampleCallback</a>.
     * @param {PWSTR} fileName A null-terminated string that contains the URL of the output file.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfcaptureengine/nf-mfcaptureengine-imfcapturerecordsink-setoutputfilename
     */
    SetOutputFileName(fileName) {
        fileName := fileName is String ? StrPtr(fileName) : fileName

        result := ComCall(9, this, "ptr", fileName, "HRESULT")
        return result
    }

    /**
     * Sets a callback to receive the recording data for one stream.
     * @remarks
     * Calling this method overrides any previous call to <a href="https://docs.microsoft.com/windows/desktop/api/mfcaptureengine/nf-mfcaptureengine-imfcapturerecordsink-setoutputbytestream">IMFCaptureRecordSink::SetOutputByteStream</a> or  <a href="https://docs.microsoft.com/windows/desktop/api/mfcaptureengine/nf-mfcaptureengine-imfcapturerecordsink-setoutputfilename">IMFCaptureRecordSink::SetOutputFileName</a>.
     * @param {Integer} dwStreamSinkIndex The zero-based index of the stream. The index is returned in the <i>pdwSinkStreamIndex</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/mfcaptureengine/nf-mfcaptureengine-imfcapturesink-addstream">IMFCaptureSink::AddStream</a> method.
     * @param {IMFCaptureEngineOnSampleCallback} pCallback A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfcaptureengine/nn-mfcaptureengine-imfcaptureengineonsamplecallback">IMFCaptureEngineOnSampleCallback</a> interface. The caller must implement this interface.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfcaptureengine/nf-mfcaptureengine-imfcapturerecordsink-setsamplecallback
     */
    SetSampleCallback(dwStreamSinkIndex, pCallback) {
        result := ComCall(10, this, "uint", dwStreamSinkIndex, "ptr", pCallback, "HRESULT")
        return result
    }

    /**
     * Sets a custom media sink for recording.
     * @remarks
     * This method overrides the default selection of the media sink for recording.
     * @param {IMFMediaSink} pMediaSink A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfmediasink">IMFMediaSink</a> interface of the media sink.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfcaptureengine/nf-mfcaptureengine-imfcapturerecordsink-setcustomsink
     */
    SetCustomSink(pMediaSink) {
        result := ComCall(11, this, "ptr", pMediaSink, "HRESULT")
        return result
    }

    /**
     * Gets the rotation that is currently being applied to the recorded video stream.
     * @param {Integer} dwStreamIndex The zero-based index of the stream. You must specify a video stream.
     * @returns {Integer} Receives the image rotation, in degrees.
     * @see https://learn.microsoft.com/windows/win32/api/mfcaptureengine/nf-mfcaptureengine-imfcapturerecordsink-getrotation
     */
    GetRotation(dwStreamIndex) {
        result := ComCall(12, this, "uint", dwStreamIndex, "uint*", &pdwRotationValue := 0, "HRESULT")
        return pdwRotationValue
    }

    /**
     * Rotates the recorded video stream.
     * @param {Integer} dwStreamIndex The zero-based index of the stream to rotate. You must specify a video stream.
     * @param {Integer} dwRotationValue The amount to rotate the video, in degrees. Valid values are 0, 90, 180, and 270. The value zero restores the video to its original orientation.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfcaptureengine/nf-mfcaptureengine-imfcapturerecordsink-setrotation
     */
    SetRotation(dwStreamIndex, dwRotationValue) {
        result := ComCall(13, this, "uint", dwStreamIndex, "uint", dwRotationValue, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMFCaptureRecordSink.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetOutputByteStream := CallbackCreate(GetMethod(implObj, "SetOutputByteStream"), flags, 3)
        this.vtbl.SetOutputFileName := CallbackCreate(GetMethod(implObj, "SetOutputFileName"), flags, 2)
        this.vtbl.SetSampleCallback := CallbackCreate(GetMethod(implObj, "SetSampleCallback"), flags, 3)
        this.vtbl.SetCustomSink := CallbackCreate(GetMethod(implObj, "SetCustomSink"), flags, 2)
        this.vtbl.GetRotation := CallbackCreate(GetMethod(implObj, "GetRotation"), flags, 3)
        this.vtbl.SetRotation := CallbackCreate(GetMethod(implObj, "SetRotation"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetOutputByteStream)
        CallbackFree(this.vtbl.SetOutputFileName)
        CallbackFree(this.vtbl.SetSampleCallback)
        CallbackFree(this.vtbl.SetCustomSink)
        CallbackFree(this.vtbl.GetRotation)
        CallbackFree(this.vtbl.SetRotation)
    }
}
