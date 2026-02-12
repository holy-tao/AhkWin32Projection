#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Invoked when a WS_MESSAGE is received on an endpoint configured with a WS_SERVICE_CONTRACT which has defaultMessageHandlerCallback set.
 * @remarks
 * When defined, callback would disallow all concurrency on a session based channel. If concurrency on a session based channel is desirable an application should not define <i>WS_SERVICE_MESSAGE_RECEIVE_CALLBACK</i> on the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_service_contract">WS_SERVICE_CONTRACT</a>.
 *                 
 * 
 * At the time of the invocation of the callback, service model has performed <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsreadmessagestart">WsReadMessageStart</a> on the receiving <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-message">WS_MESSAGE</a>. It is the responsibility of the application implementing <i>WS_SERVICE_MESSAGE_RECEIVE_CALLBACK</i> to process the body and perform <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsreadmessageend">WsReadMessageEnd</a> operation.
 *  
 * If the callback fails, the underlying channel is aborted.
 *                 
 * See also, <a href="https://docs.microsoft.com/windows/desktop/wsw/untypedserviceexample">UnTypedServiceExample</a>
 * @see https://learn.microsoft.com/windows/win32/api//content/webservices/nc-webservices-ws_service_message_receive_callback
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_SERVICE_MESSAGE_RECEIVE_CALLBACK extends IUnknown {

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
     * @param {Pointer<WS_ERROR>} error 
     * @returns {HRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(context_, asyncContext, error) {
        result := ComCall(3, this, "ptr", context_, "ptr", asyncContext, "ptr", error, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
