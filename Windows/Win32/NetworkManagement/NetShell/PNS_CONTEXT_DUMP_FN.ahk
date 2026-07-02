#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.NetworkManagement.NetShell
 */
export default struct PNS_CONTEXT_DUMP_FN {
    value : IntPtr

    __value {
        set {
            if (value is PNS_CONTEXT_DUMP_FN) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PWSTR} pwszRouter 
     * @param {Pointer<PWSTR>} ppwcArguments 
     * @param {Integer} dwArgCount 
     * @param {Pointer<Void>} pvData 
     * @returns {Integer} 
     */
    Call(pwszRouter, ppwcArguments, dwArgCount, pvData) {
        pwszRouter := pwszRouter is String ? StrPtr(pwszRouter) : pwszRouter

        ppwcArgumentsMarshal := ppwcArguments is VarRef ? "ptr*" : "ptr"
        pvDataMarshal := pvData is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, "ptr", pwszRouter, ppwcArgumentsMarshal, ppwcArguments, UInt32, dwArgCount, pvDataMarshal, pvData, UInt32)
        return result
    }

    /**
     * A PNS_CONTEXT_DUMP_FN that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PNS_CONTEXT_DUMP_FN {
        /**
         * Creates a PNS_CONTEXT_DUMP_FN pointer that invokes the given AHK function when called.
         * @param {Func(PWSTR, PWSTR, UInt32, "ptr") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PWSTR, PWSTR.Ptr, UInt32, "ptr", UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
