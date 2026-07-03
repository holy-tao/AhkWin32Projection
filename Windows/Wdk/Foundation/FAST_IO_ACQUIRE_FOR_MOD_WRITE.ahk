#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DEVICE_OBJECT.ahk" { DEVICE_OBJECT }
#Import ".\ERESOURCE.ahk" { ERESOURCE }
#Import ".\FILE_OBJECT.ahk" { FILE_OBJECT }
#Import "..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.Foundation
 */
export default struct FAST_IO_ACQUIRE_FOR_MOD_WRITE {
    value : IntPtr

    __value {
        set {
            if (value is FAST_IO_ACQUIRE_FOR_MOD_WRITE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {Pointer<Integer>} EndingOffset 
     * @param {Pointer<Pointer<ERESOURCE>>} ResourceToRelease 
     * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
     * @returns {NTSTATUS} 
     */
    Call(FileObject, EndingOffset, ResourceToRelease, DeviceObject) {
        EndingOffsetMarshal := EndingOffset is VarRef ? "int64*" : "ptr"
        ResourceToReleaseMarshal := ResourceToRelease is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, FILE_OBJECT.Ptr, FileObject, EndingOffsetMarshal, EndingOffset, ResourceToReleaseMarshal, ResourceToRelease, DEVICE_OBJECT.Ptr, DeviceObject, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A FAST_IO_ACQUIRE_FOR_MOD_WRITE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends FAST_IO_ACQUIRE_FOR_MOD_WRITE {
        /**
         * Creates a FAST_IO_ACQUIRE_FOR_MOD_WRITE pointer that invokes the given AHK function when called.
         * @param {Func(FILE_OBJECT, "int64*", "ptr*", DEVICE_OBJECT) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [FILE_OBJECT.Ptr, "int64*", "ptr*", DEVICE_OBJECT.Ptr, NTSTATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}
