#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\RAS_CONNECTION_0.ahk" { RAS_CONNECTION_0 }
#Import ".\RAS_CONNECTION_1.ahk" { RAS_CONNECTION_1 }
#Import ".\RAS_CONNECTION_2.ahk" { RAS_CONNECTION_2 }

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct PMPRADMINACCEPTNEWCONNECTION2 {
    value : IntPtr

    __value {
        set {
            if (value is PMPRADMINACCEPTNEWCONNECTION2) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<RAS_CONNECTION_0>} param0 
     * @param {Pointer<RAS_CONNECTION_1>} param1 
     * @param {Pointer<RAS_CONNECTION_2>} param2 
     * @returns {BOOL} 
     */
    Call(param0, param1, param2) {
        result := DllCall(this.value, RAS_CONNECTION_0.Ptr, param0, RAS_CONNECTION_1.Ptr, param1, RAS_CONNECTION_2.Ptr, param2, BOOL)
        return result
    }

    /**
     * A PMPRADMINACCEPTNEWCONNECTION2 that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PMPRADMINACCEPTNEWCONNECTION2 {
        /**
         * Creates a PMPRADMINACCEPTNEWCONNECTION2 pointer that invokes the given AHK function when called.
         * @param {Func(RAS_CONNECTION_0, RAS_CONNECTION_1, RAS_CONNECTION_2) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [RAS_CONNECTION_0.Ptr, RAS_CONNECTION_1.Ptr, RAS_CONNECTION_2.Ptr, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
