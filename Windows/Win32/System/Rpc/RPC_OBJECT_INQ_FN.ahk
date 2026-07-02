#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\RPC_STATUS.ahk" { RPC_STATUS }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * The RPC_OBJECT_INQ_FN function is a prototype for a function that facilitates replacement of the default object UUID to type UUID mapping.
 * @remarks
 * You can replace the default mapping function that maps object UUIDs to type UUIDs by calling 
 * <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/nf-rpcdce-rpcobjectsetinqfn">RpcObjectSetInqFn</a> and supplying a pointer to a function of type RPC_OBJECT_INQ_FN. The supplied function must match the function prototype specified by the type definition: a function with three parameters and the function return value of void.
 * @see https://learn.microsoft.com/windows/win32/api/rpcdce/nc-rpcdce-rpc_object_inq_fn
 * @namespace Windows.Win32.System.Rpc
 */
export default struct RPC_OBJECT_INQ_FN {
    value : IntPtr

    __value {
        set {
            if (value is RPC_OBJECT_INQ_FN) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Guid>} ObjectUuid Pointer to the variable that specifies the object 
     * <a href="https://msdn.microsoft.com/">UUID</a> that is to be mapped to a type UUID.
     * @param {Pointer<Guid>} TypeUuid Pointer to the address of the variable that is to contain the type UUID derived from the object UUID. The type UUID is returned by the function.
     * @param {Pointer<RPC_STATUS>} _Status Pointer to a return value for the function.
     * @returns {String} Nothing - always returns an empty string
     */
    Call(ObjectUuid, TypeUuid, _Status) {
        _StatusMarshal := _Status is VarRef ? "int*" : "ptr"

        DllCall(this.value, Guid.Ptr, ObjectUuid, Guid.Ptr, TypeUuid, _StatusMarshal, _Status)
    }

    /**
     * A RPC_OBJECT_INQ_FN that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends RPC_OBJECT_INQ_FN {
        /**
         * Creates a RPC_OBJECT_INQ_FN pointer that invokes the given AHK function when called.
         * @param {Func(Guid, Guid, "int*") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [Guid.Ptr, Guid.Ptr, "int*", IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
