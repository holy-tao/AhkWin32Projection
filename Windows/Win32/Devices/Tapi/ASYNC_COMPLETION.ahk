#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Completion_Proc is a callback function implemented by TAPI and supplied to the service provider as a parameter to TSPI_providerInit.
 * @remarks
 * The call state when calling this function can be any state.
 * 
 * This procedure is supplied by TAPI at the time a service provider is initialized with the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/tspi/nf-tspi-tspi_providerinit">TSPI_providerInit</a> function. Some of the TSPI procedures that operate on line, call, and phone devices specify asynchronous operation. These procedures include a <i>dwRequestID</i> parameter to identify the request. When such a procedure is called, the service provider can return a negative number for an error if one is detected immediately, or the positive <i>dwRequestID</i> if the operation continues asynchronously. The service provider must report completion exactly once for each request it executes asynchronously. It does so by calling this procedure. The service provider is not permitted to call this procedure or the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/tspi/nc-tspi-lineevent">Line_Event</a> or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/tspi/nc-tspi-phoneevent">Phone_Event</a> procedure again until this procedure returns.
 * 
 * The service provider is permitted to call the 
 * <i>Completion_Proc</i> function before it returns from the first request. TAPI guarantees not to call the service provider from within the 
 * <i>Completion_Proc</i> context except where noted.
 * 
 * This does not have any direct correspondence at the TAPI level because at that level asynchronous function completions are reported as a message passed through the same callback interface that is used for spontaneous event messages. At the TSPI level, spontaneous events are reported through the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/tspi/nc-tspi-lineevent">Line_Event</a> and 
 * <a href="https://docs.microsoft.com/windows/desktop/api/tspi/nc-tspi-phoneevent">Phone_Event</a> callback procedures.
 * @see https://learn.microsoft.com/windows/win32/api//content/tspi/nc-tspi-async_completion
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ASYNC_COMPLETION extends IUnknown {

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
     * @param {Integer} dwRequestID 
     * @param {Integer} lResult_ 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(dwRequestID, lResult_) {
        ComCall(3, this, "uint", dwRequestID, "int", lResult_)
    }
}
