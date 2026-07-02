#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\RPC_STATUS.ahk" { RPC_STATUS }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.System.Rpc
 */
export default struct I_RpcProxyFilterIfFn {
    value : IntPtr

    __value {
        set {
            if (value is I_RpcProxyFilterIfFn) {
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
     * @param {Pointer<Guid>} IfUuid 
     * @param {Integer} IfMajorVersion 
     * @param {Pointer<Integer>} fAllow 
     * @returns {RPC_STATUS} 
     */
    Call(_Context, IfUuid, IfMajorVersion, fAllow) {
        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"
        fAllowMarshal := fAllow is VarRef ? "int*" : "ptr"

        result := DllCall(this.value, _ContextMarshal, _Context, Guid.Ptr, IfUuid, UInt16, IfMajorVersion, fAllowMarshal, fAllow, RPC_STATUS)
        return result
    }

    /**
     * A I_RpcProxyFilterIfFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends I_RpcProxyFilterIfFn {
        /**
         * Creates a I_RpcProxyFilterIfFn pointer that invokes the given AHK function when called.
         * @param {Func("ptr", Guid, UInt16, "int*") => RPC_STATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", Guid.Ptr, UInt16, "int*", RPC_STATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
