#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\DEVICE_OBJECT.ahk" { DEVICE_OBJECT }
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import "..\..\Foundation\IRP.ahk" { IRP }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct IO_COMPLETION_ROUTINE {
    value : IntPtr

    __value {
        set {
            if (value is IO_COMPLETION_ROUTINE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
     * @param {Pointer<IRP>} _Irp 
     * @param {Pointer<Void>} _Context 
     * @returns {NTSTATUS} 
     */
    Call(DeviceObject, _Irp, _Context) {
        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, DEVICE_OBJECT.Ptr, DeviceObject, IRP.Ptr, _Irp, _ContextMarshal, _Context, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A IO_COMPLETION_ROUTINE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends IO_COMPLETION_ROUTINE {
        /**
         * Creates a IO_COMPLETION_ROUTINE pointer that invokes the given AHK function when called.
         * @param {Func(DEVICE_OBJECT, IRP, "ptr") => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DEVICE_OBJECT.Ptr, IRP.Ptr, "ptr", NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
