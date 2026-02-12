#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFCaptureSink.ahk

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
 * @see https://learn.microsoft.com/windows/win32/api//content/mfcaptureengine/nn-mfcaptureengine-imfcapturerecordsink
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFCaptureRecordSink extends IMFCaptureSink{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFCaptureRecordSink
     * @type {Guid}
     */
    static IID => Guid("{3323b55a-f92a-4fe2-8edc-e9bfc0634d77}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetOutputByteStream", "SetOutputFileName", "SetSampleCallback", "SetCustomSink", "GetRotation", "SetRotation"]

    /**
     * Specifies a byte stream that will receive the data for the recording.
     * @remarks
     * Calling this method overrides any previous call to <a href="https://docs.microsoft.com/windows/desktop/api/mfcaptureengine/nf-mfcaptureengine-imfcapturerecordsink-setoutputfilename">IMFCaptureRecordSink::SetOutputFileName</a> or <a href="https://docs.microsoft.com/windows/desktop/api/mfcaptureengine/nf-mfcaptureengine-imfcapturerecordsink-setsamplecallback">IMFCaptureRecordSink::SetSampleCallback</a>.
     * @param {IMFByteStream} pByteStream A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfbytestream">IMFByteStream</a> interface of a byte stream. The byte stream must be writable.
     * @param {Pointer<Guid>} guidContainerType A GUID that specifies the file container type. Possible values are documented in the <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-transcode-containertype">MF_TRANSCODE_CONTAINERTYPE</a>  attribute.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/mfcaptureengine/nf-mfcaptureengine-imfcapturerecordsink-setoutputbytestream
     */
    SetOutputByteStream(pByteStream, guidContainerType) {
        result := ComCall(8, this, "ptr", pByteStream, "ptr", guidContainerType, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/mfcaptureengine/nf-mfcaptureengine-imfcapturerecordsink-setoutputfilename
     */
    SetOutputFileName(fileName) {
        fileName := fileName is String ? StrPtr(fileName) : fileName

        result := ComCall(9, this, "ptr", fileName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets a callback to receive the recording data for one stream.
     * @remarks
     * Calling this method overrides any previous call to <a href="https://docs.microsoft.com/windows/desktop/api/mfcaptureengine/nf-mfcaptureengine-imfcapturerecordsink-setoutputbytestream">IMFCaptureRecordSink::SetOutputByteStream</a> or  <a href="https://docs.microsoft.com/windows/desktop/api/mfcaptureengine/nf-mfcaptureengine-imfcapturerecordsink-setoutputfilename">IMFCaptureRecordSink::SetOutputFileName</a>.
     * @param {Integer} dwStreamSinkIndex The zero-based index of the stream. The index is returned in the <i>pdwSinkStreamIndex</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/mfcaptureengine/nf-mfcaptureengine-imfcapturesink-addstream">IMFCaptureSink::AddStream</a> method.
     * @param {IMFCaptureEngineOnSampleCallback} pCallback A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfcaptureengine/nn-mfcaptureengine-imfcaptureengineonsamplecallback">IMFCaptureEngineOnSampleCallback</a> interface. The caller must implement this interface.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/mfcaptureengine/nf-mfcaptureengine-imfcapturerecordsink-setsamplecallback
     */
    SetSampleCallback(dwStreamSinkIndex, pCallback) {
        result := ComCall(10, this, "uint", dwStreamSinkIndex, "ptr", pCallback, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets a custom media sink for recording.
     * @remarks
     * This method overrides the default selection of the media sink for recording.
     * @param {IMFMediaSink} pMediaSink A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfmediasink">IMFMediaSink</a> interface of the media sink.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/mfcaptureengine/nf-mfcaptureengine-imfcapturerecordsink-setcustomsink
     */
    SetCustomSink(pMediaSink) {
        result := ComCall(11, this, "ptr", pMediaSink, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets the rotation that is currently being applied to the recorded video stream.
     * @param {Integer} dwStreamIndex The zero-based index of the stream. You must specify a video stream.
     * @returns {Integer} Receives the image rotation, in degrees.
     * @see https://learn.microsoft.com/windows/win32/api//content/mfcaptureengine/nf-mfcaptureengine-imfcapturerecordsink-getrotation
     */
    GetRotation(dwStreamIndex) {
        result := ComCall(12, this, "uint", dwStreamIndex, "uint*", &pdwRotationValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pdwRotationValue
    }

    /**
     * Rotates the recorded video stream.
     * @param {Integer} dwStreamIndex The zero-based index of the stream to rotate. You must specify a video stream.
     * @param {Integer} dwRotationValue The amount to rotate the video, in degrees. Valid values are 0, 90, 180, and 270. The value zero restores the video to its original orientation.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/mfcaptureengine/nf-mfcaptureengine-imfcapturerecordsink-setrotation
     */
    SetRotation(dwStreamIndex, dwRotationValue) {
        result := ComCall(13, this, "uint", dwStreamIndex, "uint", dwRotationValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
