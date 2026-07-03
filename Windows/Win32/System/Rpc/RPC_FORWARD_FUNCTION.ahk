#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Guid.ahk" { Guid }
#Import ".\RPC_STATUS.ahk" { RPC_STATUS }
#Import ".\RPC_VERSION.ahk" { RPC_VERSION }

/**
 * @namespace Windows.Win32.System.Rpc
 */
export default struct RPC_FORWARD_FUNCTION {
    value : IntPtr

    __value {
        set {
            if (value is RPC_FORWARD_FUNCTION) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Guid>} InterfaceId 
     * @param {Pointer<RPC_VERSION>} InterfaceVersion 
     * @param {Pointer<Guid>} _ObjectId 
     * @param {Pointer<Integer>} Rpcpro 
     * @param {Pointer<Pointer<Void>>} ppDestEndpoint 
     * @returns {RPC_STATUS} 
     */
    Call(InterfaceId, InterfaceVersion, _ObjectId, Rpcpro, ppDestEndpoint) {
        RpcproMarshal := Rpcpro is VarRef ? "char*" : "ptr"
        ppDestEndpointMarshal := ppDestEndpoint is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, Guid.Ptr, InterfaceId, RPC_VERSION.Ptr, InterfaceVersion, Guid.Ptr, _ObjectId, RpcproMarshal, Rpcpro, ppDestEndpointMarshal, ppDestEndpoint, RPC_STATUS)
        return result
    }

    /**
     * A RPC_FORWARD_FUNCTION that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends RPC_FORWARD_FUNCTION {
        /**
         * Creates a RPC_FORWARD_FUNCTION pointer that invokes the given AHK function when called.
         * @param {Func(Guid, RPC_VERSION, Guid, "char*", "ptr*") => RPC_STATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [Guid.Ptr, RPC_VERSION.Ptr, Guid.Ptr, "char*", "ptr*", RPC_STATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
