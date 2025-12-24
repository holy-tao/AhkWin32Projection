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
     * Begins saving a Windows Media file to the application's byte stream.
     * @param {IMFByteStream} pStream Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfbytestream">IMFByteStream</a> interface of the application's byte stream. The data from the source byte stream is written to this byte stream.
     * @param {IMFAsyncCallback} pCallback Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfasynccallback">IMFAsyncCallback</a> interface of a callback object. The caller must implement this interface
     * @param {IUnknown} pState Pointer to the <b>IUnknown</b> interface of a state object, defined by the caller. This parameter can be <b>NULL</b>. You can use this object to hold state information. The object is returned to the caller when the callback is invoked.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfsavejob-beginsave
     */
    BeginSave(pStream, pCallback, pState) {
        result := ComCall(3, this, "ptr", pStream, "ptr", pCallback, "ptr", pState, "HRESULT")
        return result
    }

    /**
     * Completes the operation started by IMFSaveJob::BeginSave.
     * @param {IMFAsyncResult} pResult Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfasyncresult">IMFAsyncResult</a> interface. Pass in the same pointer that your callback object received in the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfasynccallback-invoke">IMFAsyncCallback::Invoke</a> method.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfsavejob-endsave
     */
    EndSave(pResult) {
        result := ComCall(4, this, "ptr", pResult, "HRESULT")
        return result
    }

    /**
     * Cancels the operation started by IMFSaveJob::BeginSave.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfsavejob-cancelsave
     */
    CancelSave() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * Retrieves the percentage of content saved to the provided byte stream.
     * @returns {Integer} Receives the percentage of completion.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfsavejob-getprogress
     */
    GetProgress() {
        result := ComCall(6, this, "uint*", &pdwPercentComplete := 0, "HRESULT")
        return pdwPercentComplete
    }
}
