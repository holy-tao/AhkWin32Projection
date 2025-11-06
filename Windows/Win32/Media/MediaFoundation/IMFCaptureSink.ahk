#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFMediaType.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Controls a capture sink, which is an object that receives one or more streams from a capture device.
 * @remarks
 * 
  * The capture engine creates the following capture sinks.
  * 
  * <ul>
  * <li>Photo sink. Encodes still image files.</li>
  * <li>Preview sink. Previews live audio or video.</li>
  * <li>Recording sink. Creates compressed audio/video files or compressed audio/video streams.</li>
  * </ul>
  * To get a pointer to a capture sink, call <a href="https://docs.microsoft.com/windows/desktop/api/mfcaptureengine/nf-mfcaptureengine-imfcaptureengine-getsink">IMFCaptureEngine::GetSink</a>. Each capture sink implements an interface that derives from <b>IMFCaptureSink</b>. Call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> to get a pointer to the derived interface.<table>
  * <tr>
  * <th>Sink</th>
  * <th>Interface</th>
  * </tr>
  * <tr>
  * <td>Photo sink</td>
  * <td>
  * <a href="https://docs.microsoft.com/windows/desktop/api/mfcaptureengine/nn-mfcaptureengine-imfcapturephotosink">IMFCapturePhotoSink</a>
  * </td>
  * </tr>
  * <tr>
  * <td>Preview sink</td>
  * <td>
  * <a href="https://docs.microsoft.com/windows/desktop/api/mfcaptureengine/nn-mfcaptureengine-imfcapturepreviewsink">IMFCapturePreviewSink</a>
  * </td>
  * </tr>
  * <tr>
  * <td>Recording sink</td>
  * <td>
  * <a href="https://docs.microsoft.com/windows/desktop/api/mfcaptureengine/nn-mfcaptureengine-imfcapturerecordsink">IMFCaptureRecordSink</a>
  * </td>
  * </tr>
  * </table>
  *  
  * 
  * 
  * 
  * Applications cannot directly create the capture sinks.
  * 
  * If an image stream native media type is set to JPEG, the photo sink should be configured with a format identical to native source format. JPEG native type is passthrough only.
  * 
  * If an image stream native type is set to JPEG, to add an effect, change the native type on the image stream to an uncompressed video media type (such as NV12 or RGB32) and then add the effect.
  * 
  * If the native type is H.264 for the record stream, the record sink should be configured with the same media type. H.264 native type is passthrough only and cannot be decoded.
  * 
  * Record streams that expose H.264 do not  expose any other type. H.264 record streams cannot be used in conjunction with effects. To add effects, instead connect the preview stream to the recordsink using <a href="https://docs.microsoft.com/windows/desktop/api/mfcaptureengine/nf-mfcaptureengine-imfcapturesink-addstream">AddStream</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mfcaptureengine/nn-mfcaptureengine-imfcapturesink
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFCaptureSink extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFCaptureSink
     * @type {Guid}
     */
    static IID => Guid("{72d6135b-35e9-412c-b926-fd5265f2a885}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetOutputMediaType", "GetService", "AddStream", "Prepare", "RemoveAllStreams"]

    /**
     * 
     * @param {Integer} dwSinkStreamIndex 
     * @returns {IMFMediaType} 
     * @see https://learn.microsoft.com/windows/win32/api/mfcaptureengine/nf-mfcaptureengine-imfcapturesink-getoutputmediatype
     */
    GetOutputMediaType(dwSinkStreamIndex) {
        result := ComCall(3, this, "uint", dwSinkStreamIndex, "ptr*", &ppMediaType := 0, "HRESULT")
        return IMFMediaType(ppMediaType)
    }

    /**
     * 
     * @param {Integer} dwSinkStreamIndex 
     * @param {Pointer<Guid>} rguidService 
     * @param {Pointer<Guid>} riid 
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/mfcaptureengine/nf-mfcaptureengine-imfcapturesink-getservice
     */
    GetService(dwSinkStreamIndex, rguidService, riid) {
        result := ComCall(4, this, "uint", dwSinkStreamIndex, "ptr", rguidService, "ptr", riid, "ptr*", &ppUnknown := 0, "HRESULT")
        return IUnknown(ppUnknown)
    }

    /**
     * 
     * @param {Integer} dwSourceStreamIndex 
     * @param {IMFMediaType} pMediaType 
     * @param {IMFAttributes} pAttributes 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mfcaptureengine/nf-mfcaptureengine-imfcapturesink-addstream
     */
    AddStream(dwSourceStreamIndex, pMediaType, pAttributes) {
        result := ComCall(5, this, "uint", dwSourceStreamIndex, "ptr", pMediaType, "ptr", pAttributes, "uint*", &pdwSinkStreamIndex := 0, "HRESULT")
        return pdwSinkStreamIndex
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfcaptureengine/nf-mfcaptureengine-imfcapturesink-prepare
     */
    Prepare() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfcaptureengine/nf-mfcaptureengine-imfcapturesink-removeallstreams
     */
    RemoveAllStreams() {
        result := ComCall(7, this, "HRESULT")
        return result
    }
}
