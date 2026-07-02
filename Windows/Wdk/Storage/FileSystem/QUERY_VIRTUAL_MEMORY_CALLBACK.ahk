#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\HEAP_MEMORY_INFO_CLASS.ahk" { HEAP_MEMORY_INFO_CLASS }
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct QUERY_VIRTUAL_MEMORY_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is QUERY_VIRTUAL_MEMORY_CALLBACK) {
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
     * @param {Pointer<Void>} BaseAddress 
     * @param {HEAP_MEMORY_INFO_CLASS} MemoryInformationClass 
     * @param {Integer} MemoryInformation 
     * @param {Pointer} MemoryInformationLength 
     * @param {Pointer<Pointer>} ReturnLength 
     * @returns {NTSTATUS} 
     */
    Call(CallbackContext, ProcessHandle, BaseAddress, MemoryInformationClass, MemoryInformation, MemoryInformationLength, ReturnLength) {
        BaseAddressMarshal := BaseAddress is VarRef ? "ptr" : "ptr"
        ReturnLengthMarshal := ReturnLength is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, HANDLE, CallbackContext, HANDLE, ProcessHandle, BaseAddressMarshal, BaseAddress, HEAP_MEMORY_INFO_CLASS, MemoryInformationClass, IntPtr, MemoryInformation, IntPtr, MemoryInformationLength, ReturnLengthMarshal, ReturnLength, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A QUERY_VIRTUAL_MEMORY_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends QUERY_VIRTUAL_MEMORY_CALLBACK {
        /**
         * Creates a QUERY_VIRTUAL_MEMORY_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, HANDLE, "ptr", HEAP_MEMORY_INFO_CLASS, IntPtr, IntPtr, "ptr*") => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 7)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 7 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, HANDLE, "ptr", HEAP_MEMORY_INFO_CLASS, IntPtr, IntPtr, "ptr*", NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
