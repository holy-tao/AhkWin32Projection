#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFMediaSink.ahk

/**
 * Optionally supported by media sinks to perform required tasks before shutdown.
 * @remarks
 * 
  * If a media sink exposes this interface, the Media Session will call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imffinalizablemediasink-beginfinalize">BeginFinalize</a> on the sink before the session closes.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imffinalizablemediasink
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFFinalizableMediaSink extends IMFMediaSink{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFFinalizableMediaSink
     * @type {Guid}
     */
    static IID => Guid("{eaecb74a-9a50-42ce-9541-6a7f57aa4ad7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 12

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["BeginFinalize", "EndFinalize"]

    /**
     * 
     * @param {IMFAsyncCallback} pCallback 
     * @param {IUnknown} punkState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imffinalizablemediasink-beginfinalize
     */
    BeginFinalize(pCallback, punkState) {
        result := ComCall(12, this, "ptr", pCallback, "ptr", punkState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMFAsyncResult} pResult 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imffinalizablemediasink-endfinalize
     */
    EndFinalize(pResult) {
        result := ComCall(13, this, "ptr", pResult, "HRESULT")
        return result
    }
}
