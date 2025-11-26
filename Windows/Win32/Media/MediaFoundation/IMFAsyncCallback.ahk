#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Callback interface to notify the application when an asynchronous method completes.
 * @remarks
 * 
 * For more information about asynchronous methods in Microsoft Media Foundation, see <a href="https://docs.microsoft.com/windows/desktop/medfound/asynchronous-callback-methods">Asynchronous Callback Methods</a>.
 *       
 * 
 * This interface is also used to perform  a work item in a Media Foundation work-queue. For more information, see <a href="https://docs.microsoft.com/windows/desktop/medfound/work-queues">Work Queues</a>. 
 * 
 * This interface is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
 * 
 * <ul>
 * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
 * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
 * </ul>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mfobjects/nn-mfobjects-imfasynccallback
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFAsyncCallback extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFAsyncCallback
     * @type {Guid}
     */
    static IID => Guid("{a27003cf-2354-4f2a-8d6a-ab7cff15437e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetParameters", "Invoke"]

    /**
     * Provides configuration information to the dispatching thread for a callback.
     * @param {Pointer<Integer>} pdwFlags Receives a flag indicating the behavior of the callback object's <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfasynccallback-invoke">IMFAsyncCallback::Invoke</a> method. The following values are defined. The default value is zero.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="Zero"></a><a id="zero"></a><a id="ZERO"></a><dl>
     * <dt><b>Zero</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The callback does not take a long time to complete, but has no specific restrictions on what system calls it makes. The callback generally takes less than 30 milliseconds to complete.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MFASYNC_FAST_IO_PROCESSING_CALLBACK"></a><a id="mfasync_fast_io_processing_callback"></a><dl>
     * <dt><b><b>MFASYNC_FAST_IO_PROCESSING_CALLBACK</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The callback does very minimal processing. It takes less than 1 millisecond to complete.
     * 
     * The callback must be invoked from one of the following work queues:
     * 
     * <ul>
     * <li><b>MFASYNC_CALLBACK_QUEUE_IO</b></li>
     * <li><b>MFASYNC_CALLBACK_QUEUE_TIMER</b></li>
     * </ul>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MFASYNC_SIGNAL_CALLBACK"></a><a id="mfasync_signal_callback"></a><dl>
     * <dt><b><b>MFASYNC_SIGNAL_CALLBACK</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Implies <b>MFASYNC_FAST_IO_PROCESSING_CALLBACK</b>, with the additional restriction that the callback does no processing (less than 50 microseconds), and the only system call it makes is <b>SetEvent</b>.
     * 
     * The callback must be invoked from one of the following work queues:
     * 
     * <ul>
     * <li><b>MFASYNC_CALLBACK_QUEUE_IO</b></li>
     * <li><b>MFASYNC_CALLBACK_QUEUE_TIMER</b></li>
     * </ul>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MFASYNC_BLOCKING_CALLBACK"></a><a id="mfasync_blocking_callback"></a><dl>
     * <dt><b><b>MFASYNC_BLOCKING_CALLBACK</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Blocking callback.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MFASYNC_REPLY_CALLBACK"></a><a id="mfasync_reply_callback"></a><dl>
     * <dt><b><b>MFASYNC_REPLY_CALLBACK</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Reply callback.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Integer>} pdwQueue Receives the identifier of the work queue on which the callback is dispatched. 
     *           
     * 
     * This value can specify one of the standard Media Foundation work queues, or a work queue created by the application. For list of standard Media Foundation work queues, see <a href="https://docs.microsoft.com/windows/desktop/medfound/work-queue-identifiers">Work Queue Identifiers</a>. To create a new work queue, call <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfallocateworkqueue">MFAllocateWorkQueue</a>. The default value is <b>MFASYNC_CALLBACK_QUEUE_STANDARD</b>.
     * 
     * If the work queue is not compatible with the value returned in <i>pdwFlags</i>, the Media Foundation platform returns <b>MF_E_INVALID_WORKQUEUE</b> when it tries to dispatch the callback. (See <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfputworkitem">MFPutWorkItem</a>.)
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
     * <dt><b><b>S_OK</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>E_NOTIMPL</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not implemented. Assume the default behavior.
     *               
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfobjects/nf-mfobjects-imfasynccallback-getparameters
     */
    GetParameters(pdwFlags, pdwQueue) {
        pdwFlagsMarshal := pdwFlags is VarRef ? "uint*" : "ptr"
        pdwQueueMarshal := pdwQueue is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pdwFlagsMarshal, pdwFlags, pdwQueueMarshal, pdwQueue, "HRESULT")
        return result
    }

    /**
     * Called when an asynchronous operation is completed.
     * @param {IMFAsyncResult} pAsyncResult Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfasyncresult">IMFAsyncResult</a> interface. Pass this pointer to the asynchronous <b>End...</b> method to complete the asynchronous call.
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
     * @see https://docs.microsoft.com/windows/win32/api//mfobjects/nf-mfobjects-imfasynccallback-invoke
     */
    Invoke(pAsyncResult) {
        result := ComCall(4, this, "ptr", pAsyncResult, "HRESULT")
        return result
    }
}
