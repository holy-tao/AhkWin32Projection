#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import ".\FLT_RELATED_OBJECTS.ahk" { FLT_RELATED_OBJECTS }
#Import ".\FLT_IO_PARAMETER_BLOCK.ahk" { FLT_IO_PARAMETER_BLOCK }

/**
 * @namespace Windows.Wdk.Storage.FileSystem.Minifilters
 */
export default struct PFLT_GET_OPERATION_STATUS_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is PFLT_GET_OPERATION_STATUS_CALLBACK) {
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
     * @param {Pointer<FLT_IO_PARAMETER_BLOCK>} IopbSnapshot 
     * @param {NTSTATUS} OperationStatus 
     * @param {Pointer<Void>} RequesterContext 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(FltObjects, IopbSnapshot, OperationStatus, RequesterContext) {
        RequesterContextMarshal := RequesterContext is VarRef ? "ptr" : "ptr"

        DllCall(this.value, FLT_RELATED_OBJECTS.Ptr, FltObjects, FLT_IO_PARAMETER_BLOCK.Ptr, IopbSnapshot, NTSTATUS, OperationStatus, RequesterContextMarshal, RequesterContext)
    }

    /**
     * A PFLT_GET_OPERATION_STATUS_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFLT_GET_OPERATION_STATUS_CALLBACK {
        /**
         * Creates a PFLT_GET_OPERATION_STATUS_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(FLT_RELATED_OBJECTS, FLT_IO_PARAMETER_BLOCK, NTSTATUS, "ptr") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [FLT_RELATED_OBJECTS.Ptr, FLT_IO_PARAMETER_BLOCK.Ptr, NTSTATUS, "ptr", IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
