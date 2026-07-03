#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Networking\WinSock\IN6_ADDR.ahk" { IN6_ADDR }

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct PMPRADMINGETIPV6ADDRESSFORUSER {
    value : IntPtr

    __value {
        set {
            if (value is PMPRADMINGETIPV6ADDRESSFORUSER) {
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
     * @param {Pointer<IN6_ADDR>} param2 
     * @param {Pointer<BOOL>} param3 
     * @returns {Integer} 
     */
    Call(param0, param1, param2, param3) {
        param0 := param0 is String ? StrPtr(param0) : param0
        param1 := param1 is String ? StrPtr(param1) : param1

        param3Marshal := param3 is VarRef ? "int*" : "ptr"

        result := DllCall(this.value, "ptr", param0, "ptr", param1, IN6_ADDR.Ptr, param2, param3Marshal, param3, UInt32)
        return result
    }

    /**
     * A PMPRADMINGETIPV6ADDRESSFORUSER that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PMPRADMINGETIPV6ADDRESSFORUSER {
        /**
         * Creates a PMPRADMINGETIPV6ADDRESSFORUSER pointer that invokes the given AHK function when called.
         * @param {Func(PWSTR, PWSTR, IN6_ADDR, BOOL) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PWSTR, PWSTR, IN6_ADDR.Ptr, BOOL.Ptr, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
