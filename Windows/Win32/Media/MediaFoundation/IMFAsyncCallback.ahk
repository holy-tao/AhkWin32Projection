#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IMFAsyncResult.ahk" { IMFAsyncResult }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Callback interface to notify the application when an asynchronous method completes. (IMFAsyncCallback)
 * @remarks
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
 * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nn-mfobjects-imfasynccallback
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFAsyncCallback extends IUnknown {
    /**
     * The interface identifier for IMFAsyncCallback
     * @type {Guid}
     */
    static IID := Guid("{a27003cf-2354-4f2a-8d6a-ab7cff15437e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFAsyncCallback interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetParameters : IntPtr
        Invoke        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFAsyncCallback.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Provides configuration information to the dispatching thread for a callback. (IMFAsyncCallback.GetParameters)
     * @remarks
     * The <b>GetParameters</b> method returns information about the callback so that the dispatching thread can optimize the process that it uses to invoke the callback.
     *       
     * 
     * If the method returns a value other than zero in the <i>pdwFlags</i> parameter, your <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfasynccallback-invoke">Invoke</a> method must meet the requirements described here. Otherwise, the callback might delay the pipeline.
     * 
     * If you want default values for both parameters, return <b>E_NOTIMPL</b>. The default values are given in the parameter descriptions on this page.
     * 
     * This interface is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
     * 
     * <ul>
     * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
     * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
     * </ul>
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
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfasynccallback-getparameters
     */
    GetParameters(pdwFlags, pdwQueue) {
        pdwFlagsMarshal := pdwFlags is VarRef ? "uint*" : "ptr"
        pdwQueueMarshal := pdwQueue is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pdwFlagsMarshal, pdwFlags, pdwQueueMarshal, pdwQueue, "HRESULT")
        return result
    }

    /**
     * Called when an asynchronous operation is completed. (IMFAsyncCallback.Invoke)
     * @remarks
     * Within your implementation of <b>Invoke</b>, call the corresponding <b>End...</b> method.
     * 
     * This interface is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
     * 
     * <ul>
     * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
     * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
     * </ul>
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
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfasynccallback-invoke
     */
    Invoke(pAsyncResult) {
        result := ComCall(4, this, "ptr", pAsyncResult, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMFAsyncCallback.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetParameters := CallbackCreate(GetMethod(implObj, "GetParameters"), flags, 3)
        this.vtbl.Invoke := CallbackCreate(GetMethod(implObj, "Invoke"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetParameters)
        CallbackFree(this.vtbl.Invoke)
    }
}
