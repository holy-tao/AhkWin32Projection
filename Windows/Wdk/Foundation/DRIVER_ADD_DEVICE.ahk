#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DEVICE_OBJECT.ahk" { DEVICE_OBJECT }
#Import ".\DRIVER_OBJECT.ahk" { DRIVER_OBJECT }
#Import "..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.Foundation
 */
export default struct DRIVER_ADD_DEVICE {
    value : IntPtr

    __value {
        set {
            if (value is DRIVER_ADD_DEVICE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DRIVER_OBJECT>} DriverObject 
     * @param {Pointer<DEVICE_OBJECT>} PhysicalDeviceObject 
     * @returns {NTSTATUS} 
     */
    Call(DriverObject, PhysicalDeviceObject) {
        result := DllCall(this.value, DRIVER_OBJECT.Ptr, DriverObject, DEVICE_OBJECT.Ptr, PhysicalDeviceObject, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A DRIVER_ADD_DEVICE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends DRIVER_ADD_DEVICE {
        /**
         * Creates a DRIVER_ADD_DEVICE pointer that invokes the given AHK function when called.
         * @param {Func(DRIVER_OBJECT, DEVICE_OBJECT) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DRIVER_OBJECT.Ptr, DEVICE_OBJECT.Ptr, NTSTATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}
