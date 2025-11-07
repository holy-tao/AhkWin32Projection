#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFCaptureSink.ahk
#Include .\IMFCaptureSource.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Controls one or more capture devices.
 * @remarks
 * 
 * <b>IMFCaptureEngine</b> only supports one pass CBR encoding.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mfcaptureengine/nn-mfcaptureengine-imfcaptureengine
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFCaptureEngine extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFCaptureEngine
     * @type {Guid}
     */
    static IID => Guid("{a6bba433-176b-48b2-b375-53aa03473207}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "StartPreview", "StopPreview", "StartRecord", "StopRecord", "TakePhoto", "GetSink", "GetSource"]

    /**
     * Initializes a thread to use Windows Runtime APIs.
     * @param {IMFCaptureEngineOnEventCallback} pEventCallback 
     * @param {IMFAttributes} pAttributes 
     * @param {IUnknown} pAudioSource 
     * @param {IUnknown} pVideoSource 
     * @returns {HRESULT} <ul>
     * <li><b>S_OK</b> - Successfully initialized for the first time on the current thread</li>
     * <li><b>S_FALSE</b> - Successful nested initialization (current thread was already 
     *         initialized for the specified apartment type)</li>
     * <li><b>E_INVALIDARG</b> - Invalid <i>initType</i> value</li>
     * <li><b>CO_E_INIT_TLS</b> - Failed to allocate COM's internal TLS structure</li>
     * <li><b>E_OUTOFMEMORY</b> - Failed to allocate per-thread/per-apartment structures other 
     *         than the TLS</li>
     * <li><b>RPC_E_CHANGED_MODE</b> - The current thread is already initialized for a different 
     *         apartment type from what is specified.</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//roapi/nf-roapi-initialize
     */
    Initialize(pEventCallback, pAttributes, pAudioSource, pVideoSource) {
        result := ComCall(3, this, "ptr", pEventCallback, "ptr", pAttributes, "ptr", pAudioSource, "ptr", pVideoSource, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfcaptureengine/nf-mfcaptureengine-imfcaptureengine-startpreview
     */
    StartPreview() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfcaptureengine/nf-mfcaptureengine-imfcaptureengine-stoppreview
     */
    StopPreview() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfcaptureengine/nf-mfcaptureengine-imfcaptureengine-startrecord
     */
    StartRecord() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} bFinalize 
     * @param {BOOL} bFlushUnprocessedSamples 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfcaptureengine/nf-mfcaptureengine-imfcaptureengine-stoprecord
     */
    StopRecord(bFinalize, bFlushUnprocessedSamples) {
        result := ComCall(7, this, "int", bFinalize, "int", bFlushUnprocessedSamples, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfcaptureengine/nf-mfcaptureengine-imfcaptureengine-takephoto
     */
    TakePhoto() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} mfCaptureEngineSinkType 
     * @returns {IMFCaptureSink} 
     * @see https://learn.microsoft.com/windows/win32/api/mfcaptureengine/nf-mfcaptureengine-imfcaptureengine-getsink
     */
    GetSink(mfCaptureEngineSinkType) {
        result := ComCall(9, this, "int", mfCaptureEngineSinkType, "ptr*", &ppSink := 0, "HRESULT")
        return IMFCaptureSink(ppSink)
    }

    /**
     * 
     * @returns {IMFCaptureSource} 
     * @see https://learn.microsoft.com/windows/win32/api/mfcaptureengine/nf-mfcaptureengine-imfcaptureengine-getsource
     */
    GetSource() {
        result := ComCall(10, this, "ptr*", &ppSource := 0, "HRESULT")
        return IMFCaptureSource(ppSource)
    }
}
