#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DEVICE_OBJECT.ahk" { DEVICE_OBJECT }
#Import ".\IRP.ahk" { IRP }

/**
 * @namespace Windows.Wdk.Foundation
 */
export default struct DRIVER_CANCEL {
    value : IntPtr

    __value {
        set {
            if (value is DRIVER_CANCEL) {
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
     * @returns {String} Nothing - always returns an empty string
     */
    Call(DeviceObject, _Irp) {
        DllCall(this.value, DEVICE_OBJECT.Ptr, DeviceObject, IRP.Ptr, _Irp)
    }

    /**
     * A DRIVER_CANCEL that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends DRIVER_CANCEL {
        /**
         * Creates a DRIVER_CANCEL pointer that invokes the given AHK function when called.
         * @param {Func(DEVICE_OBJECT, IRP) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DEVICE_OBJECT.Ptr, IRP.Ptr, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
