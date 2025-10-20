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
     * 
     * @param {Pointer<IMFMediaEvent>} pEvent 
     * @returns {HRESULT} 
     */
    OnSynchronizedEvent(pEvent) {
        result := ComCall(4, this, "ptr", pEvent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
