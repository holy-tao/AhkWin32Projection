#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DEVICE_OBJECT.ahk" { DEVICE_OBJECT }
#Import ".\ERESOURCE.ahk" { ERESOURCE }
#Import ".\FILE_OBJECT.ahk" { FILE_OBJECT }
#Import "..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.Foundation
 */
export default struct FAST_IO_RELEASE_FOR_MOD_WRITE {
    value : IntPtr

    __value {
        set {
            if (value is FAST_IO_RELEASE_FOR_MOD_WRITE) {
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
     * @param {Pointer<ERESOURCE>} ResourceToRelease 
     * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
     * @returns {NTSTATUS} 
     */
    Call(FileObject, ResourceToRelease, DeviceObject) {
        result := DllCall(this.value, FILE_OBJECT.Ptr, FileObject, ERESOURCE.Ptr, ResourceToRelease, DEVICE_OBJECT.Ptr, DeviceObject, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A FAST_IO_RELEASE_FOR_MOD_WRITE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends FAST_IO_RELEASE_FOR_MOD_WRITE {
        /**
         * Creates a FAST_IO_RELEASE_FOR_MOD_WRITE pointer that invokes the given AHK function when called.
         * @param {Func(FILE_OBJECT, ERESOURCE, DEVICE_OBJECT) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [FILE_OBJECT.Ptr, ERESOURCE.Ptr, DEVICE_OBJECT.Ptr, NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
