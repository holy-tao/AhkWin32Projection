#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\RPC_STATUS.ahk" { RPC_STATUS }

/**
 * @namespace Windows.Win32.System.Rpc
 */
export default struct I_RpcProxyIsValidMachineFn {
    value : IntPtr

    __value {
        set {
            if (value is I_RpcProxyIsValidMachineFn) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PWSTR} Machine 
     * @param {PWSTR} DotMachine 
     * @param {Integer} PortNumber 
     * @returns {RPC_STATUS} 
     */
    Call(Machine, DotMachine, PortNumber) {
        Machine := Machine is String ? StrPtr(Machine) : Machine
        DotMachine := DotMachine is String ? StrPtr(DotMachine) : DotMachine

        result := DllCall(this.value, "ptr", Machine, "ptr", DotMachine, UInt32, PortNumber, RPC_STATUS)
        return result
    }

    /**
     * A I_RpcProxyIsValidMachineFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends I_RpcProxyIsValidMachineFn {
        /**
         * Creates a I_RpcProxyIsValidMachineFn pointer that invokes the given AHK function when called.
         * @param {Func(PWSTR, PWSTR, UInt32) => RPC_STATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PWSTR, PWSTR, UInt32, RPC_STATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
