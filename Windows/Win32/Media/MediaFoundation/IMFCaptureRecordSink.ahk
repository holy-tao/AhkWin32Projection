#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFCaptureSink.ahk

/**
 * Controls the recording sink.
 * @remarks
 * 
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
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mfcaptureengine/nn-mfcaptureengine-imfcapturerecordsink
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
     * 
     * @param {IMFByteStream} pByteStream 
     * @param {Pointer<Guid>} guidContainerType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfcaptureengine/nf-mfcaptureengine-imfcapturerecordsink-setoutputbytestream
     */
    SetOutputByteStream(pByteStream, guidContainerType) {
        result := ComCall(8, this, "ptr", pByteStream, "ptr", guidContainerType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} fileName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfcaptureengine/nf-mfcaptureengine-imfcapturerecordsink-setoutputfilename
     */
    SetOutputFileName(fileName) {
        fileName := fileName is String ? StrPtr(fileName) : fileName

        result := ComCall(9, this, "ptr", fileName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwStreamSinkIndex 
     * @param {IMFCaptureEngineOnSampleCallback} pCallback 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfcaptureengine/nf-mfcaptureengine-imfcapturerecordsink-setsamplecallback
     */
    SetSampleCallback(dwStreamSinkIndex, pCallback) {
        result := ComCall(10, this, "uint", dwStreamSinkIndex, "ptr", pCallback, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMFMediaSink} pMediaSink 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfcaptureengine/nf-mfcaptureengine-imfcapturerecordsink-setcustomsink
     */
    SetCustomSink(pMediaSink) {
        result := ComCall(11, this, "ptr", pMediaSink, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwStreamIndex 
     * @param {Pointer<Integer>} pdwRotationValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfcaptureengine/nf-mfcaptureengine-imfcapturerecordsink-getrotation
     */
    GetRotation(dwStreamIndex, pdwRotationValue) {
        result := ComCall(12, this, "uint", dwStreamIndex, "uint*", pdwRotationValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwStreamIndex 
     * @param {Integer} dwRotationValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfcaptureengine/nf-mfcaptureengine-imfcapturerecordsink-setrotation
     */
    SetRotation(dwStreamIndex, dwRotationValue) {
        result := ComCall(13, this, "uint", dwStreamIndex, "uint", dwRotationValue, "HRESULT")
        return result
    }
}
