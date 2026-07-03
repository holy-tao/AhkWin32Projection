#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\OPLOCK_NOTIFY_PARAMS.ahk" { OPLOCK_NOTIFY_PARAMS }
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct POPLOCK_NOTIFY_ROUTINE {
    value : IntPtr

    __value {
        set {
            if (value is POPLOCK_NOTIFY_ROUTINE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<OPLOCK_NOTIFY_PARAMS>} NotifyParams 
     * @returns {NTSTATUS} 
     */
    Call(NotifyParams) {
        result := DllCall(this.value, OPLOCK_NOTIFY_PARAMS.Ptr, NotifyParams, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A POPLOCK_NOTIFY_ROUTINE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends POPLOCK_NOTIFY_ROUTINE {
        /**
         * Creates a POPLOCK_NOTIFY_ROUTINE pointer that invokes the given AHK function when called.
         * @param {Func(OPLOCK_NOTIFY_PARAMS) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [OPLOCK_NOTIFY_PARAMS.Ptr, NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
