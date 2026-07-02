#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\DEVICE_OBJECT.ahk" { DEVICE_OBJECT }

/**
 * @namespace Windows.Wdk.Foundation
 */
export default struct DRIVER_FS_NOTIFICATION {
    value : IntPtr

    __value {
        set {
            if (value is DRIVER_FS_NOTIFICATION) {
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
     * @param {BOOLEAN} FsActive 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(DeviceObject, FsActive) {
        DllCall(this.value, DEVICE_OBJECT.Ptr, DeviceObject, BOOLEAN, FsActive)
    }

    /**
     * A DRIVER_FS_NOTIFICATION that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends DRIVER_FS_NOTIFICATION {
        /**
         * Creates a DRIVER_FS_NOTIFICATION pointer that invokes the given AHK function when called.
         * @param {Func(DEVICE_OBJECT, BOOLEAN) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DEVICE_OBJECT.Ptr, BOOLEAN, IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
