#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\FAX_DEVICE_STATUSA.ahk" { FAX_DEVICE_STATUSA }

/**
 * @namespace Windows.Win32.Devices.Fax
 * @charset ANSI
 */
export default struct PFAXGETDEVICESTATUSA {
    value : IntPtr

    __value {
        set {
            if (value is PFAXGETDEVICESTATUSA) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HANDLE} FaxPortHandle 
     * @param {Pointer<Pointer<FAX_DEVICE_STATUSA>>} DeviceStatus 
     * @returns {BOOL} 
     */
    Call(FaxPortHandle, DeviceStatus) {
        DeviceStatusMarshal := DeviceStatus is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, HANDLE, FaxPortHandle, DeviceStatusMarshal, DeviceStatus, BOOL)
        return result
    }

    /**
     * A PFAXGETDEVICESTATUSA that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFAXGETDEVICESTATUSA {
        /**
         * Creates a PFAXGETDEVICESTATUSA pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, "ptr*") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, "ptr*", BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
