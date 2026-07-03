#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\DEVICE_OBJECT.ahk" { DEVICE_OBJECT }
#Import "..\..\Foundation\IRP.ahk" { IRP }
#Import "..\..\Foundation\KDPC.ahk" { KDPC }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct IO_DPC_ROUTINE {
    value : IntPtr

    __value {
        set {
            if (value is IO_DPC_ROUTINE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<KDPC>} Dpc 
     * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
     * @param {Pointer<IRP>} _Irp 
     * @param {Pointer<Void>} _Context 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(Dpc, DeviceObject, _Irp, _Context) {
        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

        DllCall(this.value, KDPC.Ptr, Dpc, DEVICE_OBJECT.Ptr, DeviceObject, IRP.Ptr, _Irp, _ContextMarshal, _Context)
    }

    /**
     * A IO_DPC_ROUTINE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends IO_DPC_ROUTINE {
        /**
         * Creates a IO_DPC_ROUTINE pointer that invokes the given AHK function when called.
         * @param {Func(KDPC, DEVICE_OBJECT, IRP, "ptr") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [KDPC.Ptr, DEVICE_OBJECT.Ptr, IRP.Ptr, "ptr", IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
