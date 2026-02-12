#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * The RPC_IF_CALLBACK_FN is a prototype for a security-callback function that your application supplies. Your program can provide a callback function for each interface it defines.
 * @remarks
 * In some cases, the RPC run time may call the security-callback function more than once per client per interface. Be sure your callback function can handle this possibility.
 * 
 * The security callback must be declared as RPC_ENTRY.
 * @see https://learn.microsoft.com/windows/win32/api//content/rpcdce/nc-rpcdce-rpc_if_callback_fn
 * @namespace Windows.Win32.System.Rpc
 * @version v4.0.30319
 */
class RPC_IF_CALLBACK_FN extends IUnknown {

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
     * @param {Pointer<Void>} InterfaceUuid 
     * @param {Pointer<Void>} Context_ 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(InterfaceUuid, Context_) {
        InterfaceUuidMarshal := InterfaceUuid is VarRef ? "ptr" : "ptr"
        Context_Marshal := Context_ is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, InterfaceUuidMarshal, InterfaceUuid, Context_Marshal, Context_, "int")
        return result
    }
}
