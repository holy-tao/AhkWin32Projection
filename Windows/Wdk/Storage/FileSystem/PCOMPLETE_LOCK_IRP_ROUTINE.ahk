#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\IRP.ahk" { IRP }
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct PCOMPLETE_LOCK_IRP_ROUTINE {
    value : IntPtr

    __value {
        set {
            if (value is PCOMPLETE_LOCK_IRP_ROUTINE) {
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
     * @returns {NTSTATUS} 
     */
    Call(_Context, _Irp) {
        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, _ContextMarshal, _Context, IRP.Ptr, _Irp, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A PCOMPLETE_LOCK_IRP_ROUTINE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCOMPLETE_LOCK_IRP_ROUTINE {
        /**
         * Creates a PCOMPLETE_LOCK_IRP_ROUTINE pointer that invokes the given AHK function when called.
         * @param {Func("ptr", IRP) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", IRP.Ptr, NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
