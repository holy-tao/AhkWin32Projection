#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Notifies the client of the list of certificate issuers that are acceptable to the server.
 * @see https://learn.microsoft.com/windows/win32/api//content/webservices/nc-webservices-ws_cert_issuer_list_notification_callback
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_CERT_ISSUER_LIST_NOTIFICATION_CALLBACK extends IUnknown {

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
     * @param {Pointer<Void>} certIssuerListNotificationCallbackState 
     * @param {Pointer<SecPkgContext_IssuerListInfoEx>} issuerList 
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
    Invoke(certIssuerListNotificationCallbackState, issuerList, error) {
        certIssuerListNotificationCallbackStateMarshal := certIssuerListNotificationCallbackState is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, certIssuerListNotificationCallbackStateMarshal, certIssuerListNotificationCallbackState, "ptr", issuerList, "ptr", error, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
