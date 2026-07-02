#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\DEVICE_OBJECT.ahk" { DEVICE_OBJECT }
#Import ".\SCATTER_GATHER_LIST.ahk" { SCATTER_GATHER_LIST }
#Import "..\..\Foundation\IRP.ahk" { IRP }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct DRIVER_LIST_CONTROL {
    value : IntPtr

    __value {
        set {
            if (value is DRIVER_LIST_CONTROL) {
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
     * @param {Pointer<SCATTER_GATHER_LIST>} ScatterGather 
     * @param {Pointer<Void>} _Context 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(DeviceObject, _Irp, ScatterGather, _Context) {
        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

        DllCall(this.value, DEVICE_OBJECT.Ptr, DeviceObject, IRP.Ptr, _Irp, SCATTER_GATHER_LIST.Ptr, ScatterGather, _ContextMarshal, _Context)
    }

    /**
     * A DRIVER_LIST_CONTROL that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends DRIVER_LIST_CONTROL {
        /**
         * Creates a DRIVER_LIST_CONTROL pointer that invokes the given AHK function when called.
         * @param {Func(DEVICE_OBJECT, IRP, SCATTER_GATHER_LIST, "ptr") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DEVICE_OBJECT.Ptr, IRP.Ptr, SCATTER_GATHER_LIST.Ptr, "ptr", IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
