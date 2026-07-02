#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\Diagnostics\Debug\IMAGE_RUNTIME_FUNCTION_ENTRY.ahk" { IMAGE_RUNTIME_FUNCTION_ENTRY }

/**
 * @namespace Windows.Win32.System.SystemServices
 * @architecture X64
 */
export default struct POUT_OF_PROCESS_FUNCTION_TABLE_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is POUT_OF_PROCESS_FUNCTION_TABLE_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HANDLE} Process 
     * @param {Pointer<Void>} TableAddress 
     * @param {Pointer<Integer>} Entries 
     * @param {Pointer<Pointer<IMAGE_RUNTIME_FUNCTION_ENTRY>>} Functions 
     * @returns {Integer} 
     */
    Call(Process, TableAddress, Entries, Functions) {
        TableAddressMarshal := TableAddress is VarRef ? "ptr" : "ptr"
        EntriesMarshal := Entries is VarRef ? "uint*" : "ptr"
        FunctionsMarshal := Functions is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, HANDLE, Process, TableAddressMarshal, TableAddress, EntriesMarshal, Entries, FunctionsMarshal, Functions, UInt32)
        return result
    }

    /**
     * A POUT_OF_PROCESS_FUNCTION_TABLE_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends POUT_OF_PROCESS_FUNCTION_TABLE_CALLBACK {
        /**
         * Creates a POUT_OF_PROCESS_FUNCTION_TABLE_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, "ptr", "uint*", "ptr*") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, "ptr", "uint*", "ptr*", UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
