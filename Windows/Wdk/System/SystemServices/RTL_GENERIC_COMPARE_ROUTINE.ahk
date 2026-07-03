#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\RTL_GENERIC_COMPARE_RESULTS.ahk" { RTL_GENERIC_COMPARE_RESULTS }
#Import ".\RTL_GENERIC_TABLE.ahk" { RTL_GENERIC_TABLE }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct RTL_GENERIC_COMPARE_ROUTINE {
    value : IntPtr

    __value {
        set {
            if (value is RTL_GENERIC_COMPARE_ROUTINE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<RTL_GENERIC_TABLE>} Table 
     * @param {Pointer<Void>} FirstStruct 
     * @param {Pointer<Void>} SecondStruct 
     * @returns {RTL_GENERIC_COMPARE_RESULTS} 
     */
    Call(Table, FirstStruct, SecondStruct) {
        FirstStructMarshal := FirstStruct is VarRef ? "ptr" : "ptr"
        SecondStructMarshal := SecondStruct is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, RTL_GENERIC_TABLE.Ptr, Table, FirstStructMarshal, FirstStruct, SecondStructMarshal, SecondStruct, RTL_GENERIC_COMPARE_RESULTS)
        return result
    }

    /**
     * A RTL_GENERIC_COMPARE_ROUTINE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends RTL_GENERIC_COMPARE_ROUTINE {
        /**
         * Creates a RTL_GENERIC_COMPARE_ROUTINE pointer that invokes the given AHK function when called.
         * @param {Func(RTL_GENERIC_TABLE, "ptr", "ptr") => RTL_GENERIC_COMPARE_RESULTS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [RTL_GENERIC_TABLE.Ptr, "ptr", "ptr", RTL_GENERIC_COMPARE_RESULTS])
        }

        __Delete() => CallbackFree(this.value)
    }
}
