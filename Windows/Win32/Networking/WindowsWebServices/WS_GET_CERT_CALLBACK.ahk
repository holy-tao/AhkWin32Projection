#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides a certificate to the security runtime.
 * @see https://learn.microsoft.com/windows/win32/api//content/webservices/nc-webservices-ws_get_cert_callback
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_GET_CERT_CALLBACK extends IUnknown {

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
     * @param {Pointer<Void>} getCertCallbackState 
     * @param {Pointer<WS_ENDPOINT_ADDRESS>} targetAddress 
     * @param {Pointer<WS_STRING>} viaUri 
     * @param {Pointer<WS_ERROR>} error 
     * @returns {Pointer<CERT_CONTEXT>} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(getCertCallbackState, targetAddress, viaUri, error) {
        getCertCallbackStateMarshal := getCertCallbackState is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, getCertCallbackStateMarshal, getCertCallbackState, "ptr", targetAddress, "ptr", viaUri, "ptr*", &cert := 0, "ptr", error, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return cert
    }
}
