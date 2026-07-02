#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\RPC_STATUS.ahk" { RPC_STATUS }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.System.Rpc
 */
export default struct I_RpcProxyGetClientSessionAndResourceUUID {
    value : IntPtr

    __value {
        set {
            if (value is I_RpcProxyGetClientSessionAndResourceUUID) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} _Context 
     * @param {Pointer<Integer>} SessionIdPresent 
     * @param {Pointer<Guid>} SessionId 
     * @param {Pointer<Integer>} ResourceIdPresent 
     * @param {Pointer<Guid>} ResourceId 
     * @returns {RPC_STATUS} 
     */
    Call(_Context, SessionIdPresent, SessionId, ResourceIdPresent, ResourceId) {
        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"
        SessionIdPresentMarshal := SessionIdPresent is VarRef ? "int*" : "ptr"
        ResourceIdPresentMarshal := ResourceIdPresent is VarRef ? "int*" : "ptr"

        result := DllCall(this.value, _ContextMarshal, _Context, SessionIdPresentMarshal, SessionIdPresent, Guid.Ptr, SessionId, ResourceIdPresentMarshal, ResourceIdPresent, Guid.Ptr, ResourceId, RPC_STATUS)
        return result
    }

    /**
     * A I_RpcProxyGetClientSessionAndResourceUUID that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends I_RpcProxyGetClientSessionAndResourceUUID {
        /**
         * Creates a I_RpcProxyGetClientSessionAndResourceUUID pointer that invokes the given AHK function when called.
         * @param {Func("ptr", "int*", Guid, "int*", Guid) => RPC_STATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", "int*", Guid.Ptr, "int*", Guid.Ptr, RPC_STATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
