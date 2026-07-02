#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\RpcPerfCounters.ahk" { RpcPerfCounters }

/**
 * @namespace Windows.Win32.System.Rpc
 */
export default struct I_RpcProxyUpdatePerfCounterFn {
    value : IntPtr

    __value {
        set {
            if (value is I_RpcProxyUpdatePerfCounterFn) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {RpcPerfCounters} Counter 
     * @param {Integer} ModifyTrend 
     * @param {Integer} _Size 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(Counter, ModifyTrend, _Size) {
        DllCall(this.value, RpcPerfCounters, Counter, Int32, ModifyTrend, UInt32, _Size)
    }

    /**
     * A I_RpcProxyUpdatePerfCounterFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends I_RpcProxyUpdatePerfCounterFn {
        /**
         * Creates a I_RpcProxyUpdatePerfCounterFn pointer that invokes the given AHK function when called.
         * @param {Func(RpcPerfCounters, Int32, UInt32) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [RpcPerfCounters, Int32, UInt32, IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
