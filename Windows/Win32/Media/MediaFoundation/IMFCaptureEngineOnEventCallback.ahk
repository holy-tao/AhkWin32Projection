#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Callback interface for receiving events from the capture engine.
 * @remarks
 * 
 * To set the callback interface on the capture engine, call the <a href="https://docs.microsoft.com/windows/desktop/api/mfcaptureengine/nf-mfcaptureengine-imfcaptureengine-initialize">IMFCaptureEngine::Initialize</a> method.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mfcaptureengine/nn-mfcaptureengine-imfcaptureengineoneventcallback
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFCaptureEngineOnEventCallback extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFCaptureEngineOnEventCallback
     * @type {Guid}
     */
    static IID => Guid("{aeda51c0-9025-4983-9012-de597b88b089}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnEvent"]

    /**
     * 
     * @param {IMFMediaEvent} pEvent 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfcaptureengine/nf-mfcaptureengine-imfcaptureengineoneventcallback-onevent
     */
    OnEvent(pEvent) {
        result := ComCall(3, this, "ptr", pEvent, "HRESULT")
        return result
    }
}
