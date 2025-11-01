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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetOutputFileName", "SetSampleCallback", "SetOutputByteStream"]

    /**
     * 
     * @param {PWSTR} fileName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfcaptureengine/nf-mfcaptureengine-imfcapturephotosink-setoutputfilename
     */
    SetOutputFileName(fileName) {
        fileName := fileName is String ? StrPtr(fileName) : fileName

        result := ComCall(8, this, "ptr", fileName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMFCaptureEngineOnSampleCallback} pCallback 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfcaptureengine/nf-mfcaptureengine-imfcapturephotosink-setsamplecallback
     */
    SetSampleCallback(pCallback) {
        result := ComCall(9, this, "ptr", pCallback, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMFByteStream} pByteStream 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfcaptureengine/nf-mfcaptureengine-imfcapturephotosink-setoutputbytestream
     */
    SetOutputByteStream(pByteStream) {
        result := ComCall(10, this, "ptr", pByteStream, "HRESULT")
        return result
    }
}
