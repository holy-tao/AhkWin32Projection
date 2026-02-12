#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * The RPC_OBJECT_INQ_FN function is a prototype for a function that facilitates replacement of the default object UUID to type UUID mapping.
 * @remarks
 * You can replace the default mapping function that maps object UUIDs to type UUIDs by calling 
 * <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/nf-rpcdce-rpcobjectsetinqfn">RpcObjectSetInqFn</a> and supplying a pointer to a function of type RPC_OBJECT_INQ_FN. The supplied function must match the function prototype specified by the type definition: a function with three parameters and the function return value of void.
 * @see https://learn.microsoft.com/windows/win32/api//content/rpcdce/nc-rpcdce-rpc_object_inq_fn
 * @namespace Windows.Win32.System.Rpc
 * @version v4.0.30319
 */
class RPC_OBJECT_INQ_FN extends IUnknown {

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
     * @param {Pointer<Guid>} ObjectUuid 
     * @param {Pointer<Guid>} TypeUuid 
     * @param {Pointer<Integer>} Status_ 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(ObjectUuid, TypeUuid, Status_) {
        Status_Marshal := Status_ is VarRef ? "int*" : "ptr"

        ComCall(3, this, "ptr", ObjectUuid, "ptr", TypeUuid, Status_Marshal, Status_)
    }
}
