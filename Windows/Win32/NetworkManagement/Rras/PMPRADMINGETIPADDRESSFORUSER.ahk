#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct PMPRADMINGETIPADDRESSFORUSER {
    value : IntPtr

    __value {
        set {
            if (value is PMPRADMINGETIPADDRESSFORUSER) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PWSTR} param0 
     * @param {PWSTR} param1 
     * @param {Pointer<Integer>} param2 
     * @param {Pointer<BOOL>} param3 
     * @returns {Integer} 
     */
    Call(param0, param1, param2, param3) {
        param0 := param0 is String ? StrPtr(param0) : param0
        param1 := param1 is String ? StrPtr(param1) : param1

        param2Marshal := param2 is VarRef ? "uint*" : "ptr"
        param3Marshal := param3 is VarRef ? "int*" : "ptr"

        result := DllCall(this.value, "ptr", param0, "ptr", param1, param2Marshal, param2, param3Marshal, param3, UInt32)
        return result
    }

    /**
     * A PMPRADMINGETIPADDRESSFORUSER that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PMPRADMINGETIPADDRESSFORUSER {
        /**
         * Creates a PMPRADMINGETIPADDRESSFORUSER pointer that invokes the given AHK function when called.
         * @param {Func(PWSTR, PWSTR, "uint*", BOOL) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PWSTR, PWSTR, "uint*", BOOL.Ptr, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
