#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct RTL_HEAP_COMMIT_ROUTINE {
    value : IntPtr

    __value {
        set {
            if (value is RTL_HEAP_COMMIT_ROUTINE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} Base 
     * @param {Pointer<Pointer<Void>>} CommitAddress 
     * @param {Pointer<Pointer>} CommitSize 
     * @returns {NTSTATUS} 
     */
    Call(Base, CommitAddress, CommitSize) {
        BaseMarshal := Base is VarRef ? "ptr" : "ptr"
        CommitAddressMarshal := CommitAddress is VarRef ? "ptr*" : "ptr"
        CommitSizeMarshal := CommitSize is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, BaseMarshal, Base, CommitAddressMarshal, CommitAddress, CommitSizeMarshal, CommitSize, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A RTL_HEAP_COMMIT_ROUTINE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends RTL_HEAP_COMMIT_ROUTINE {
        /**
         * Creates a RTL_HEAP_COMMIT_ROUTINE pointer that invokes the given AHK function when called.
         * @param {Func("ptr", "ptr*", "ptr*") => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", "ptr*", "ptr*", NTSTATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}
