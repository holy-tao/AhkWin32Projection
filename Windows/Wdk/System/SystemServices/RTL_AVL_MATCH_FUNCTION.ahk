#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\RTL_AVL_TABLE.ahk" { RTL_AVL_TABLE }
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct RTL_AVL_MATCH_FUNCTION {
    value : IntPtr

    __value {
        set {
            if (value is RTL_AVL_MATCH_FUNCTION) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<RTL_AVL_TABLE>} Table 
     * @param {Pointer<Void>} _UserData 
     * @param {Pointer<Void>} MatchData 
     * @returns {NTSTATUS} 
     */
    Call(Table, _UserData, MatchData) {
        _UserDataMarshal := _UserData is VarRef ? "ptr" : "ptr"
        MatchDataMarshal := MatchData is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, RTL_AVL_TABLE.Ptr, Table, _UserDataMarshal, _UserData, MatchDataMarshal, MatchData, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A RTL_AVL_MATCH_FUNCTION that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends RTL_AVL_MATCH_FUNCTION {
        /**
         * Creates a RTL_AVL_MATCH_FUNCTION pointer that invokes the given AHK function when called.
         * @param {Func(RTL_AVL_TABLE, "ptr", "ptr") => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [RTL_AVL_TABLE.Ptr, "ptr", "ptr", NTSTATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}
