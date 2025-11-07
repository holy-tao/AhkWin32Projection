#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Callback interface to receive data from the capture engine.
 * @remarks
 * 
 * To set the callback interface, call one of the following methods.
 * 
 * <ul>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/mfcaptureengine/nf-mfcaptureengine-imfcapturephotosink-setsamplecallback">IMFCapturePhotoSink::SetSampleCallback</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/mfcaptureengine/nf-mfcaptureengine-imfcapturepreviewsink-setsamplecallback">IMFCapturePreviewSink::SetSampleCallback</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/mfcaptureengine/nf-mfcaptureengine-imfcapturerecordsink-setsamplecallback">IMFCaptureRecordSink::SetSampleCallback</a>
 * </li>
 * </ul>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mfcaptureengine/nn-mfcaptureengine-imfcaptureengineonsamplecallback
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFCaptureEngineOnSampleCallback extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFCaptureEngineOnSampleCallback
     * @type {Guid}
     */
    static IID => Guid("{52150b82-ab39-4467-980f-e48bf0822ecd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnSample"]

    /**
     * 
     * @param {IMFSample} pSample 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfcaptureengine/nf-mfcaptureengine-imfcaptureengineonsamplecallback-onsample
     */
    OnSample(pSample) {
        result := ComCall(3, this, "ptr", pSample, "HRESULT")
        return result
    }
}
