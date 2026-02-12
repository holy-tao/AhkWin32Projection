#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * The RPC_MGMT_AUTHORIZATION_FN enables server programs to implement custom RPC authorization techniques.
 * @remarks
 * When a client requests one of the server's remote management functions, the server run-time library calls the authorization function with <i>ClientBinding</i> and <i>RequestedMgmtOperation</i>. The authorization function uses these parameters to determine whether the calling client can execute the requested management function.
 * @see https://learn.microsoft.com/windows/win32/api//content/rpcdce/nc-rpcdce-rpc_mgmt_authorization_fn
 * @namespace Windows.Win32.System.Rpc
 * @version v4.0.30319
 */
class RPC_MGMT_AUTHORIZATION_FN extends IUnknown {

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
     * @param {Pointer<Void>} ClientBinding 
     * @param {Integer} RequestedMgmtOperation 
     * @param {Pointer<Integer>} Status_ 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(ClientBinding, RequestedMgmtOperation, Status_) {
        ClientBindingMarshal := ClientBinding is VarRef ? "ptr" : "ptr"
        Status_Marshal := Status_ is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, ClientBindingMarshal, ClientBinding, "uint", RequestedMgmtOperation, Status_Marshal, Status_, "int")
        return result
    }
}
