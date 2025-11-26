#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFCaptureEngineOnSampleCallback.ahk

/**
 * Extensions for the IMFCaptureEngineOnSampleCallback callback interface that is used to receive data from the capture engine.
 * @see https://docs.microsoft.com/windows/win32/api//mfcaptureengine/nn-mfcaptureengine-imfcaptureengineonsamplecallback2
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFCaptureEngineOnSampleCallback2 extends IMFCaptureEngineOnSampleCallback{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFCaptureEngineOnSampleCallback2
     * @type {Guid}
     */
    static IID => Guid("{e37ceed7-340f-4514-9f4d-9c2ae026100b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnSynchronizedEvent"]

    /**
     * Called by the capture sink when the format of the sample is changed.
     * @param {IMFMediaEvent} pEvent The new media type.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfcaptureengine/nf-mfcaptureengine-imfcaptureengineonsamplecallback2-onsynchronizedevent
     */
    OnSynchronizedEvent(pEvent) {
        result := ComCall(4, this, "ptr", pEvent, "HRESULT")
        return result
    }
}
