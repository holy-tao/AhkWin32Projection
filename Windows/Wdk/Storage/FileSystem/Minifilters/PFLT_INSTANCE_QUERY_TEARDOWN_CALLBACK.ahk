#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FLT_RELATED_OBJECTS.ahk" { FLT_RELATED_OBJECTS }
#Import "..\..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.Storage.FileSystem.Minifilters
 */
export default struct PFLT_INSTANCE_QUERY_TEARDOWN_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is PFLT_INSTANCE_QUERY_TEARDOWN_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<FLT_RELATED_OBJECTS>} FltObjects 
     * @param {Integer} Flags 
     * @returns {NTSTATUS} 
     */
    Call(FltObjects, Flags) {
        result := DllCall(this.value, FLT_RELATED_OBJECTS.Ptr, FltObjects, UInt32, Flags, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A PFLT_INSTANCE_QUERY_TEARDOWN_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFLT_INSTANCE_QUERY_TEARDOWN_CALLBACK {
        /**
         * Creates a PFLT_INSTANCE_QUERY_TEARDOWN_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(FLT_RELATED_OBJECTS, UInt32) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [FLT_RELATED_OBJECTS.Ptr, UInt32, NTSTATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}
