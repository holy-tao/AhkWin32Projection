#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IO_CSQ.ahk" { IO_CSQ }
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import "..\..\Foundation\IRP.ahk" { IRP }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct IO_CSQ_INSERT_IRP_EX {
    value : IntPtr

    __value {
        set {
            if (value is IO_CSQ_INSERT_IRP_EX) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<IO_CSQ>} Csq 
     * @param {Pointer<IRP>} _Irp 
     * @param {Pointer<Void>} InsertContext 
     * @returns {NTSTATUS} 
     */
    Call(Csq, _Irp, InsertContext) {
        InsertContextMarshal := InsertContext is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, IO_CSQ.Ptr, Csq, IRP.Ptr, _Irp, InsertContextMarshal, InsertContext, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A IO_CSQ_INSERT_IRP_EX that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends IO_CSQ_INSERT_IRP_EX {
        /**
         * Creates a IO_CSQ_INSERT_IRP_EX pointer that invokes the given AHK function when called.
         * @param {Func(IO_CSQ, IRP, "ptr") => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IO_CSQ.Ptr, IRP.Ptr, "ptr", NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
