#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DEVICE_OBJECT.ahk" { DEVICE_OBJECT }
#Import ".\IRP.ahk" { IRP }
#Import "..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.Foundation
 */
export default struct DRIVER_DISPATCH_PAGED {
    value : IntPtr

    __value {
        set {
            if (value is DRIVER_DISPATCH_PAGED) {
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
     * @returns {NTSTATUS} 
     */
    Call(DeviceObject, _Irp) {
        result := DllCall(this.value, DEVICE_OBJECT.Ptr, DeviceObject, IRP.Ptr, _Irp, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A DRIVER_DISPATCH_PAGED that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends DRIVER_DISPATCH_PAGED {
        /**
         * Creates a DRIVER_DISPATCH_PAGED pointer that invokes the given AHK function when called.
         * @param {Func(DEVICE_OBJECT, IRP) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DEVICE_OBJECT.Ptr, IRP.Ptr, NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
