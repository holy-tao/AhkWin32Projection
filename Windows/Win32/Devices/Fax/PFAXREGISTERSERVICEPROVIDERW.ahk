#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Devices.Fax
 */
export default struct PFAXREGISTERSERVICEPROVIDERW {
    value : IntPtr

    __value {
        set {
            if (value is PFAXREGISTERSERVICEPROVIDERW) {
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
     * @param {PWSTR} FriendlyName 
     * @param {PWSTR} ImageName 
     * @param {PWSTR} TspName 
     * @returns {BOOL} 
     */
    Call(DeviceProvider, FriendlyName, ImageName, TspName) {
        DeviceProvider := DeviceProvider is String ? StrPtr(DeviceProvider) : DeviceProvider
        FriendlyName := FriendlyName is String ? StrPtr(FriendlyName) : FriendlyName
        ImageName := ImageName is String ? StrPtr(ImageName) : ImageName
        TspName := TspName is String ? StrPtr(TspName) : TspName

        result := DllCall(this.value, "ptr", DeviceProvider, "ptr", FriendlyName, "ptr", ImageName, "ptr", TspName, BOOL)
        return result
    }

    /**
     * A PFAXREGISTERSERVICEPROVIDERW that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFAXREGISTERSERVICEPROVIDERW {
        /**
         * Creates a PFAXREGISTERSERVICEPROVIDERW pointer that invokes the given AHK function when called.
         * @param {Func(PWSTR, PWSTR, PWSTR, PWSTR) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PWSTR, PWSTR, PWSTR, PWSTR, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
