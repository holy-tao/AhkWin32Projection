#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Invoked when a channel is closed or aborted on an endpoint.
 * @remarks
 * The returned HRESULT is only used to see if the function is completing asynchronously. Failure or 
 *                 reporting failure through HRESULT does not in any way affects the service host infrastructure.
 *                 
 *             
 * 
 * Irrespective of whether <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nc-webservices-ws_service_accept_channel_callback">WS_SERVICE_ACCEPT_CHANNEL_CALLBACK</a> competed successfully or not. This function 
 *                 will always be fired.
 *             
 * 
 * See also <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nc-webservices-ws_service_accept_channel_callback">WS_SERVICE_ACCEPT_CHANNEL_CALLBACK</a> which can be used by the application to associate state,
 *                 and gets called when a channel gets accepted.
 *             
 * 
 * For an example implementation on how to use this callback for disassociating session state, see the session based calculator <a href="https://docs.microsoft.com/windows/desktop/wsw/sessionfullcalculatorserviceexample">sample</a>.
 *             
 * 
 * This callback is cancellable.
 * @see https://learn.microsoft.com/windows/win32/api//content/webservices/nc-webservices-ws_service_close_channel_callback
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_SERVICE_CLOSE_CHANNEL_CALLBACK extends IUnknown {

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
     * @param {Pointer<WS_OPERATION_CONTEXT>} context_ 
     * @param {Pointer<WS_ASYNC_CONTEXT>} asyncContext 
     * @returns {HRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(context_, asyncContext) {
        result := ComCall(3, this, "ptr", context_, "ptr", asyncContext, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
