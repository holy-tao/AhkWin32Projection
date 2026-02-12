#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The WS_CERTIFICATE_VALIDATION_CALLBACK callback is invoked to validate a certificate when a connection to an HTTP server has been established and headers sent.
 * @remarks
 * If <i>WS_CERTIFICATE_VALIDATION_CALLBACK</i> returns any value other than <b>S_OK</b>, the channel will be aborted. The service proxy will also be aborted if this property was passed to <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wscreateserviceproxy">WsCreateServiceProxy</a>.
 * 
 * The callback implementation must avoid long computation times or long blocking calls so that it returns to the caller quickly.
 * @see https://learn.microsoft.com/windows/win32/api//content/webservices/nc-webservices-ws_certificate_validation_callback
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_CERTIFICATE_VALIDATION_CALLBACK extends IUnknown {

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
     * @param {Pointer<CERT_CONTEXT>} certContext 
     * @param {Pointer<Void>} state 
     * @returns {HRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(certContext, state) {
        stateMarshal := state is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, "ptr", certContext, stateMarshal, state, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
