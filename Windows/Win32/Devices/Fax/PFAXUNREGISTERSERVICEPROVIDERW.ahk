#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Devices.Fax
 */
export default struct PFAXUNREGISTERSERVICEPROVIDERW {
    value : IntPtr

    __value {
        set {
            if (value is PFAXUNREGISTERSERVICEPROVIDERW) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PWSTR} DeviceProvider 
     * @returns {BOOL} 
     */
    Call(DeviceProvider) {
        DeviceProvider := DeviceProvider is String ? StrPtr(DeviceProvider) : DeviceProvider

        result := DllCall(this.value, "ptr", DeviceProvider, BOOL)
        return result
    }

    /**
     * A PFAXUNREGISTERSERVICEPROVIDERW that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFAXUNREGISTERSERVICEPROVIDERW {
        /**
         * Creates a PFAXUNREGISTERSERVICEPROVIDERW pointer that invokes the given AHK function when called.
         * @param {Func(PWSTR) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PWSTR, BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
