#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.Storage.FileSystem.Minifilters
 */
export default struct PFLT_FILTER_UNLOAD_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is PFLT_FILTER_UNLOAD_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} Flags 
     * @returns {NTSTATUS} 
     */
    Call(Flags) {
        result := DllCall(this.value, UInt32, Flags, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A PFLT_FILTER_UNLOAD_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFLT_FILTER_UNLOAD_CALLBACK {
        /**
         * Creates a PFLT_FILTER_UNLOAD_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(UInt32) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, NTSTATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}
