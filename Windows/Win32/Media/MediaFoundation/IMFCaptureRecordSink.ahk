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
     * 
     * @param {Pointer<IMFByteStream>} pByteStream 
     * @param {Pointer<Guid>} guidContainerType 
     * @returns {HRESULT} 
     */
    SetOutputByteStream(pByteStream, guidContainerType) {
        result := ComCall(8, this, "ptr", pByteStream, "ptr", guidContainerType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} fileName 
     * @returns {HRESULT} 
     */
    SetOutputFileName(fileName) {
        fileName := fileName is String ? StrPtr(fileName) : fileName

        result := ComCall(9, this, "ptr", fileName, "int")
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
        result := ComCall(10, this, "uint", dwStreamSinkIndex, "ptr", pCallback, "int")
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
        result := ComCall(11, this, "ptr", pMediaSink, "int")
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
        result := ComCall(12, this, "uint", dwStreamIndex, "uint*", pdwRotationValue, "int")
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
        result := ComCall(13, this, "uint", dwStreamIndex, "uint", dwRotationValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
