#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Persists media data from a source byte stream to an application-provided byte stream.
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfsavejob
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFSaveJob extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFSaveJob
     * @type {Guid}
     */
    static IID => Guid("{e9931663-80bf-4c6e-98af-5dcf58747d1f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["BeginSave", "EndSave", "CancelSave", "GetProgress"]

    /**
     * 
     * @param {IMFByteStream} pStream 
     * @param {IMFAsyncCallback} pCallback 
     * @param {IUnknown} pState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsavejob-beginsave
     */
    BeginSave(pStream, pCallback, pState) {
        result := ComCall(3, this, "ptr", pStream, "ptr", pCallback, "ptr", pState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMFAsyncResult} pResult 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsavejob-endsave
     */
    EndSave(pResult) {
        result := ComCall(4, this, "ptr", pResult, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsavejob-cancelsave
     */
    CancelSave() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwPercentComplete 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsavejob-getprogress
     */
    GetProgress(pdwPercentComplete) {
        pdwPercentCompleteMarshal := pdwPercentComplete is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, pdwPercentCompleteMarshal, pdwPercentComplete, "HRESULT")
        return result
    }
}
