#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FILE_LOCK_INFO.ahk" { FILE_LOCK_INFO }

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct PUNLOCK_ROUTINE {
    value : IntPtr

    __value {
        set {
            if (value is PUNLOCK_ROUTINE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} _Context 
     * @param {Pointer<FILE_LOCK_INFO>} FileLockInfo 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(_Context, FileLockInfo) {
        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

        DllCall(this.value, _ContextMarshal, _Context, FILE_LOCK_INFO.Ptr, FileLockInfo)
    }

    /**
     * A PUNLOCK_ROUTINE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PUNLOCK_ROUTINE {
        /**
         * Creates a PUNLOCK_ROUTINE pointer that invokes the given AHK function when called.
         * @param {Func("ptr", FILE_LOCK_INFO) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", FILE_LOCK_INFO.Ptr, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
