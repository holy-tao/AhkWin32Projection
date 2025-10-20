#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFCaptureSink.ahk

/**
 * Controls the photo sink.
 * @remarks
 * 
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
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mfcaptureengine/nn-mfcaptureengine-imfcapturephotosink
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFCapturePhotoSink extends IMFCaptureSink{
    /**
     * The interface identifier for IMFCapturePhotoSink
     * @type {Guid}
     */
    static IID => Guid("{d2d43cc8-48bb-4aa7-95db-10c06977e777}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * 
     * @param {PWSTR} fileName 
     * @returns {HRESULT} 
     */
    SetOutputFileName(fileName) {
        fileName := fileName is String ? StrPtr(fileName) : fileName

        result := ComCall(8, this, "ptr", fileName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMFCaptureEngineOnSampleCallback>} pCallback 
     * @returns {HRESULT} 
     */
    SetSampleCallback(pCallback) {
        result := ComCall(9, this, "ptr", pCallback, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMFByteStream>} pByteStream 
     * @returns {HRESULT} 
     */
    SetOutputByteStream(pByteStream) {
        result := ComCall(10, this, "ptr", pByteStream, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
