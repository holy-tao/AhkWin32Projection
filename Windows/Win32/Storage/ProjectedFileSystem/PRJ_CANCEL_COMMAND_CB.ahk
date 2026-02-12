#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Notifies the provider that an operation by an earlier invocation of a callback should be canceled.
 * @remarks
 * Every invocation of a provider callback has a <i>callbackData</i> parameter with a <b>CommandId</b> field. If a provider supplies an implementation of this callback, it should keep track of the <b>CommandId</b> values of callbacks that it processes asynchronously, i.e. callbacks from which it has returned <b>HRESULT_FROM_WIN32(ERROR_IO_PENDING)</b> but not yet completed by calling <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/nf-projectedfslib-prjcompletecommand">PrjCompleteCommand</a>. If the provider receives this callback, it indicates that the I/O that caused the earlier callback to be invoked was canceled, either explicitly or because the thread it was issued on terminated. The provider should cancel processing the callback invocation identified by <b>CommandId</b> as soon as possible. 
 * 
 * 
 * Calling <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/nf-projectedfslib-prjcompletecommand">PrjCompleteCommand</a> for the <b>CommandId</b> in this callback's callbackData is not an error, however it is a no-op because the I/O that caused the callback invocation identified by <b>CommandId</b> has already ended. 
 * 
 * 
 * ProjFS will invoke <i>PRJ_CANCEL_COMMAND_CB</i> for a given <b>CommandId</b> only after the callback to be canceled is invoked. However if the provider is configured to allow more than one concurrently running worker thread, the cancellation and original invocation may run concurrently. The provider must be able to handle this situation.
 * 
 *  
 * This callback is optional. If the provider does not supply an implementation of this callback, none of the other callbacks will be cancellable. The provider will process all callbacks synchronously.
 * @see https://learn.microsoft.com/windows/win32/api//content/projectedfslib/nc-projectedfslib-prj_cancel_command_cb
 * @namespace Windows.Win32.Storage.ProjectedFileSystem
 * @version v4.0.30319
 */
class PRJ_CANCEL_COMMAND_CB extends IUnknown {

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {Pointer<PRJ_CALLBACK_DATA>} callbackData 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(callbackData) {
        ComCall(3, this, "ptr", callbackData)
    }
}
