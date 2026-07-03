#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DRIVER_OBJECT.ahk" { DRIVER_OBJECT }
#Import "..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import "..\..\Win32\Foundation\UNICODE_STRING.ahk" { UNICODE_STRING }

/**
 * @namespace Windows.Wdk.Foundation
 */
export default struct DRIVER_INITIALIZE {
    value : IntPtr

    __value {
        set {
            if (value is DRIVER_INITIALIZE) {
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
     * @param {Pointer<UNICODE_STRING>} RegistryPath 
     * @returns {NTSTATUS} 
     */
    Call(DriverObject, RegistryPath) {
        result := DllCall(this.value, DRIVER_OBJECT.Ptr, DriverObject, UNICODE_STRING.Ptr, RegistryPath, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A DRIVER_INITIALIZE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends DRIVER_INITIALIZE {
        /**
         * Creates a DRIVER_INITIALIZE pointer that invokes the given AHK function when called.
         * @param {Func(DRIVER_OBJECT, UNICODE_STRING) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DRIVER_OBJECT.Ptr, UNICODE_STRING.Ptr, NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
