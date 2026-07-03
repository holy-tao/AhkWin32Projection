#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\RDR_CALLOUT_STATE.ahk" { RDR_CALLOUT_STATE }
#Import ".\RPC_HTTP_REDIRECTOR_STAGE.ahk" { RPC_HTTP_REDIRECTOR_STAGE }
#Import ".\RPC_STATUS.ahk" { RPC_STATUS }

/**
 * @namespace Windows.Win32.System.Rpc
 */
export default struct I_RpcPerformCalloutFn {
    value : IntPtr

    __value {
        set {
            if (value is I_RpcPerformCalloutFn) {
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
     * @param {Pointer<RDR_CALLOUT_STATE>} CallOutState 
     * @param {RPC_HTTP_REDIRECTOR_STAGE} Stage 
     * @returns {RPC_STATUS} 
     */
    Call(_Context, CallOutState, Stage) {
        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, _ContextMarshal, _Context, RDR_CALLOUT_STATE.Ptr, CallOutState, RPC_HTTP_REDIRECTOR_STAGE, Stage, RPC_STATUS)
        return result
    }

    /**
     * A I_RpcPerformCalloutFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends I_RpcPerformCalloutFn {
        /**
         * Creates a I_RpcPerformCalloutFn pointer that invokes the given AHK function when called.
         * @param {Func("ptr", RDR_CALLOUT_STATE, RPC_HTTP_REDIRECTOR_STAGE) => RPC_STATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", RDR_CALLOUT_STATE.Ptr, RPC_HTTP_REDIRECTOR_STAGE, RPC_STATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
