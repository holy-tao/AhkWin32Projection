#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Invoked when a channel is accepted on an endpoint listener by service host.
 * @remarks
 * See also <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nc-webservices-ws_service_close_channel_callback">WS_SERVICE_CLOSE_CHANNEL_CALLBACK</a> which can be used by the application to disassociate state,
 *                 and gets called on channel closure.
 *             
 * 
 * This callback is cancellable.
 * @see https://learn.microsoft.com/windows/win32/api//content/webservices/nc-webservices-ws_service_accept_channel_callback
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_SERVICE_ACCEPT_CHANNEL_CALLBACK extends IUnknown {

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
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(context_, asyncContext, error) {
        result := ComCall(3, this, "ptr", context_, "ptr*", &channelState := 0, "ptr", asyncContext, "ptr", error, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return channelState
    }
}
