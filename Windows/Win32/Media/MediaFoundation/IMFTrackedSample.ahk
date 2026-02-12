#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Tracks the reference counts on a video media sample.
 * @remarks
 * Use this interface to determine whether it is safe to delete or re-use the buffer contained in a sample. One object assigns itself as the owner of the video sample by calling <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imftrackedsample-setallocator">SetAllocator</a>. When all objects release their reference counts on the sample, the owner's callback method is invoked.
 * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nn-mfidl-imftrackedsample
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFTrackedSample extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFTrackedSample
     * @type {Guid}
     */
    static IID => Guid("{245bf8e9-0755-40f7-88a5-ae0f18d55e17}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetAllocator"]

    /**
     * Sets the owner for the sample.
     * @remarks
     * When this method is called, the sample holds an additional reference count on itself. When every other object releases its reference counts on the sample, the sample invokes the <i>pSampleAllocator</i> callback method. To get a pointer to the sample, call <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfasyncresult-getobject">IMFAsyncResult::GetObject</a> on the asynchronous result object given to the callback's <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfasynccallback-invoke">IMFAsyncCallback::Invoke</a> method.
     * 
     * After the callback is invoked, the sample clears the callback. To reinstate the callback, you must call <b>SetAllocator</b> again.
     * 
     * It is safe to pass in the sample's <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfsample">IMFSample</a> interface pointer as the state object (<i>pUnkState</i>) for the callback. If <i>pUnkState</i> points to the sample, the <b>SetAllocator</b> method accounts for the additional reference count on <i>pUnkState</i>.
     * @param {IMFAsyncCallback} pSampleAllocator Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfasynccallback">IMFAsyncCallback</a> interface of a callback object. The caller must implement this interface.
     * @param {IUnknown} pUnkState Pointer to the <b>IUnknown</b> interface of a state object, defined by the caller. This parameter can be <b>NULL</b>. You can use this object to hold state information. The object is returned to the caller when the callback is invoked.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_NOTACCEPTING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The owner was already set. This method cannot be called twice on the sample.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nf-mfidl-imftrackedsample-setallocator
     */
    SetAllocator(pSampleAllocator, pUnkState) {
        result := ComCall(3, this, "ptr", pSampleAllocator, "ptr", pUnkState, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
