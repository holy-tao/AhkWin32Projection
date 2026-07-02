#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\RAS_CONNECTION_EX.ahk" { RAS_CONNECTION_EX }

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct PMPRADMINACCEPTTUNNELENDPOINTCHANGEEX {
    value : IntPtr

    __value {
        set {
            if (value is PMPRADMINACCEPTTUNNELENDPOINTCHANGEEX) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<RAS_CONNECTION_EX>} param0 
     * @returns {BOOL} 
     */
    Call(param0) {
        result := DllCall(this.value, RAS_CONNECTION_EX.Ptr, param0, BOOL)
        return result
    }

    /**
     * A PMPRADMINACCEPTTUNNELENDPOINTCHANGEEX that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PMPRADMINACCEPTTUNNELENDPOINTCHANGEEX {
        /**
         * Creates a PMPRADMINACCEPTTUNNELENDPOINTCHANGEEX pointer that invokes the given AHK function when called.
         * @param {Func(RAS_CONNECTION_EX) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [RAS_CONNECTION_EX.Ptr, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
