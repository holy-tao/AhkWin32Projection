#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\FA_ENTRY.ahk" { FA_ENTRY }
#Import ".\IDebugClient4.ahk" { IDebugClient4 }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct EXT_GET_FA_ENTRIES_DATA {
    value : IntPtr

    __value {
        set {
            if (value is EXT_GET_FA_ENTRIES_DATA) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {IDebugClient4} Client 
     * @param {Pointer<Integer>} Count 
     * @param {Pointer<Pointer<FA_ENTRY>>} Entries 
     * @returns {HRESULT} 
     */
    Call(Client, Count, Entries) {
        CountMarshal := Count is VarRef ? "uint*" : "ptr"
        EntriesMarshal := Entries is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, "ptr", Client, CountMarshal, Count, EntriesMarshal, Entries, "HRESULT")
        return result
    }

    /**
     * A EXT_GET_FA_ENTRIES_DATA that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends EXT_GET_FA_ENTRIES_DATA {
        /**
         * Creates a EXT_GET_FA_ENTRIES_DATA pointer that invokes the given AHK function when called.
         * @param {Func("ptr", "uint*", "ptr*") => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", "uint*", "ptr*", "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
