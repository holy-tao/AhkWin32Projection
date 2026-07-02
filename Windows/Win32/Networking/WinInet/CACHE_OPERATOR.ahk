#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\INTERNET_CACHE_ENTRY_INFOA.ahk" { INTERNET_CACHE_ENTRY_INFOA }

/**
 * @namespace Windows.Win32.Networking.WinInet
 */
export default struct CACHE_OPERATOR {
    value : IntPtr

    __value {
        set {
            if (value is CACHE_OPERATOR) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<INTERNET_CACHE_ENTRY_INFOA>} pcei 
     * @param {Pointer<Integer>} pcbcei 
     * @param {Pointer<Void>} pOpData 
     * @returns {BOOL} 
     */
    Call(pcei, pcbcei, pOpData) {
        pcbceiMarshal := pcbcei is VarRef ? "uint*" : "ptr"
        pOpDataMarshal := pOpData is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, INTERNET_CACHE_ENTRY_INFOA.Ptr, pcei, pcbceiMarshal, pcbcei, pOpDataMarshal, pOpData, BOOL)
        return result
    }

    /**
     * A CACHE_OPERATOR that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends CACHE_OPERATOR {
        /**
         * Creates a CACHE_OPERATOR pointer that invokes the given AHK function when called.
         * @param {Func(INTERNET_CACHE_ENTRY_INFOA, "uint*", "ptr") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [INTERNET_CACHE_ENTRY_INFOA.Ptr, "uint*", "ptr", BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
