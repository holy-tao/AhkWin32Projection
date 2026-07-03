#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import "..\..\..\Win32\System\Memory\MEM_EXTENDED_PARAMETER.ahk" { MEM_EXTENDED_PARAMETER }

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct ALLOCATE_VIRTUAL_MEMORY_EX_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is ALLOCATE_VIRTUAL_MEMORY_EX_CALLBACK) {
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
     * @param {Integer} BaseAddress 
     * @param {Pointer<Pointer>} RegionSize 
     * @param {Integer} AllocationType 
     * @param {Integer} PageProtection 
     * @param {Pointer<MEM_EXTENDED_PARAMETER>} ExtendedParameters 
     * @param {Integer} ExtendedParameterCount 
     * @returns {NTSTATUS} 
     */
    Call(CallbackContext, ProcessHandle, BaseAddress, RegionSize, AllocationType, PageProtection, ExtendedParameters, ExtendedParameterCount) {
        RegionSizeMarshal := RegionSize is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, HANDLE, CallbackContext, HANDLE, ProcessHandle, IntPtr, BaseAddress, RegionSizeMarshal, RegionSize, UInt32, AllocationType, UInt32, PageProtection, MEM_EXTENDED_PARAMETER.Ptr, ExtendedParameters, UInt32, ExtendedParameterCount, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A ALLOCATE_VIRTUAL_MEMORY_EX_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends ALLOCATE_VIRTUAL_MEMORY_EX_CALLBACK {
        /**
         * Creates a ALLOCATE_VIRTUAL_MEMORY_EX_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, HANDLE, IntPtr, "ptr*", UInt32, UInt32, MEM_EXTENDED_PARAMETER, UInt32) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 8)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 8 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, HANDLE, IntPtr, "ptr*", UInt32, UInt32, MEM_EXTENDED_PARAMETER.Ptr, UInt32, NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
