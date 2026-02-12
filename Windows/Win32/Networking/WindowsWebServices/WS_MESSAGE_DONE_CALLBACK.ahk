#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Notifies the caller that the message has completed its use of either the WS_XML_READER structure that was supplied to WsReadEnvelopeStartfunction, or of the WS_XML_WRITER structure supplied to the WsWriteEnvelopeStart function.
 * @remarks
 * This callback can be used as an indicator that the message object is no
 *                 longer using the reader or writer.
 *             
 * 
 * The callback is specified when <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsreadenvelopestart">WsReadEnvelopeStart</a> or
 *                 <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wswriteenvelopestart">WsWriteEnvelopeStart</a> is called.
 *             
 * 
 * The callback should assume that it is invoked as a 
 *                 <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_callback_model">WS_SHORT_CALLBACK</a>, since it will be invoked on the same 
 *                 thread that calls <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsfreemessage">WsFreeMessage</a> or <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsresetmessage">WsResetMessage</a>.
 * @see https://learn.microsoft.com/windows/win32/api//content/webservices/nc-webservices-ws_message_done_callback
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_MESSAGE_DONE_CALLBACK extends IUnknown {

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
     * @param {Pointer<Void>} doneCallbackState 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(doneCallbackState) {
        doneCallbackStateMarshal := doneCallbackState is VarRef ? "ptr" : "ptr"

        ComCall(3, this, doneCallbackStateMarshal, doneCallbackState)
    }
}
