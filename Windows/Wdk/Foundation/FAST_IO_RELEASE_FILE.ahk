#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FILE_OBJECT.ahk" { FILE_OBJECT }

/**
 * @namespace Windows.Wdk.Foundation
 */
export default struct FAST_IO_RELEASE_FILE {
    value : IntPtr

    __value {
        set {
            if (value is FAST_IO_RELEASE_FILE) {
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
     * @returns {String} Nothing - always returns an empty string
     */
    Call(FileObject) {
        DllCall(this.value, FILE_OBJECT.Ptr, FileObject)
    }

    /**
     * A FAST_IO_RELEASE_FILE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends FAST_IO_RELEASE_FILE {
        /**
         * Creates a FAST_IO_RELEASE_FILE pointer that invokes the given AHK function when called.
         * @param {Func(FILE_OBJECT) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [FILE_OBJECT.Ptr, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
