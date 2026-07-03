#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct FREE_VIRTUAL_MEMORY_EX_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is FREE_VIRTUAL_MEMORY_EX_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HANDLE} CallbackContext 
     * @param {HANDLE} ProcessHandle 
     * @param {Pointer<Pointer<Void>>} BaseAddress 
     * @param {Pointer<Pointer>} RegionSize 
     * @param {Integer} FreeType 
     * @returns {NTSTATUS} 
     */
    Call(CallbackContext, ProcessHandle, BaseAddress, RegionSize, FreeType) {
        BaseAddressMarshal := BaseAddress is VarRef ? "ptr*" : "ptr"
        RegionSizeMarshal := RegionSize is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, HANDLE, CallbackContext, HANDLE, ProcessHandle, BaseAddressMarshal, BaseAddress, RegionSizeMarshal, RegionSize, UInt32, FreeType, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A FREE_VIRTUAL_MEMORY_EX_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends FREE_VIRTUAL_MEMORY_EX_CALLBACK {
        /**
         * Creates a FREE_VIRTUAL_MEMORY_EX_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, HANDLE, "ptr*", "ptr*", UInt32) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, HANDLE, "ptr*", "ptr*", UInt32, NTSTATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}
