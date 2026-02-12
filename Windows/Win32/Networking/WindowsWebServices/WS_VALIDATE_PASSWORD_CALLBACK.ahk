#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Validates a username/password pair on the receiver side.
 * @see https://learn.microsoft.com/windows/win32/api//content/webservices/nc-webservices-ws_validate_password_callback
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_VALIDATE_PASSWORD_CALLBACK extends IUnknown {

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
     * @param {Pointer<Void>} passwordValidatorCallbackState 
     * @param {Pointer<WS_STRING>} username 
     * @param {Pointer<WS_STRING>} password 
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
    Invoke(passwordValidatorCallbackState, username, password, asyncContext, error) {
        passwordValidatorCallbackStateMarshal := passwordValidatorCallbackState is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, passwordValidatorCallbackStateMarshal, passwordValidatorCallbackState, "ptr", username, "ptr", password, "ptr", asyncContext, "ptr", error, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
