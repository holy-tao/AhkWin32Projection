#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DEVICE_OBJECT.ahk" { DEVICE_OBJECT }
#Import ".\IRP.ahk" { IRP }
#Import "..\System\SystemServices\IO_ALLOCATION_ACTION.ahk" { IO_ALLOCATION_ACTION }

/**
 * @namespace Windows.Wdk.Foundation
 */
export default struct DRIVER_CONTROL {
    value : IntPtr

    __value {
        set {
            if (value is DRIVER_CONTROL) {
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
     * @param {Pointer<Void>} MapRegisterBase 
     * @param {Pointer<Void>} _Context 
     * @returns {IO_ALLOCATION_ACTION} 
     */
    Call(DeviceObject, _Irp, MapRegisterBase, _Context) {
        MapRegisterBaseMarshal := MapRegisterBase is VarRef ? "ptr" : "ptr"
        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, DEVICE_OBJECT.Ptr, DeviceObject, IRP.Ptr, _Irp, MapRegisterBaseMarshal, MapRegisterBase, _ContextMarshal, _Context, IO_ALLOCATION_ACTION)
        return result
    }

    /**
     * A DRIVER_CONTROL that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends DRIVER_CONTROL {
        /**
         * Creates a DRIVER_CONTROL pointer that invokes the given AHK function when called.
         * @param {Func(DEVICE_OBJECT, IRP, "ptr", "ptr") => IO_ALLOCATION_ACTION} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DEVICE_OBJECT.Ptr, IRP.Ptr, "ptr", "ptr", IO_ALLOCATION_ACTION])
        }

        __Delete() => CallbackFree(this.value)
    }
}
