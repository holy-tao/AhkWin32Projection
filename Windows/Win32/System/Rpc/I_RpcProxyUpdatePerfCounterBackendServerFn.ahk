#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Rpc
 */
export default struct I_RpcProxyUpdatePerfCounterBackendServerFn {
    value : IntPtr

    __value {
        set {
            if (value is I_RpcProxyUpdatePerfCounterBackendServerFn) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Integer>} MachineName 
     * @param {Integer} IsConnectEvent 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(MachineName, IsConnectEvent) {
        MachineNameMarshal := MachineName is VarRef ? "ushort*" : "ptr"

        DllCall(this.value, MachineNameMarshal, MachineName, Int32, IsConnectEvent)
    }

    /**
     * A I_RpcProxyUpdatePerfCounterBackendServerFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends I_RpcProxyUpdatePerfCounterBackendServerFn {
        /**
         * Creates a I_RpcProxyUpdatePerfCounterBackendServerFn pointer that invokes the given AHK function when called.
         * @param {Func("ushort*", Int32) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ushort*", Int32, IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
