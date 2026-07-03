#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\IRP.ahk" { IRP }

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct POPLOCK_FS_PREPOST_IRP {
    value : IntPtr

    __value {
        set {
            if (value is POPLOCK_FS_PREPOST_IRP) {
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
     * @param {Pointer<IRP>} _Irp 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(_Context, _Irp) {
        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

        DllCall(this.value, _ContextMarshal, _Context, IRP.Ptr, _Irp)
    }

    /**
     * A POPLOCK_FS_PREPOST_IRP that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends POPLOCK_FS_PREPOST_IRP {
        /**
         * Creates a POPLOCK_FS_PREPOST_IRP pointer that invokes the given AHK function when called.
         * @param {Func("ptr", IRP) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", IRP.Ptr, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
