#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FAX_DEVICE_STATUSW.ahk" { FAX_DEVICE_STATUSW }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * @namespace Windows.Win32.Devices.Fax
 * @charset Unicode
 */
export default struct PFAXGETDEVICESTATUSW {
    value : IntPtr

    __value {
        set {
            if (value is PFAXGETDEVICESTATUSW) {
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
     * @param {Pointer<Pointer<FAX_DEVICE_STATUSW>>} DeviceStatus 
     * @returns {BOOL} 
     */
    Call(FaxPortHandle, DeviceStatus) {
        DeviceStatusMarshal := DeviceStatus is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, HANDLE, FaxPortHandle, DeviceStatusMarshal, DeviceStatus, BOOL)
        return result
    }

    /**
     * A PFAXGETDEVICESTATUSW that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFAXGETDEVICESTATUSW {
        /**
         * Creates a PFAXGETDEVICESTATUSW pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, "ptr*") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, "ptr*", BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
