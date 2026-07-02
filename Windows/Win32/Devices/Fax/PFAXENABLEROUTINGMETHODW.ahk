#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Devices.Fax
 * @charset Unicode
 */
export default struct PFAXENABLEROUTINGMETHODW {
    value : IntPtr

    __value {
        set {
            if (value is PFAXENABLEROUTINGMETHODW) {
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
     * @param {PWSTR} RoutingGuid 
     * @param {BOOL} Enabled 
     * @returns {BOOL} 
     */
    Call(FaxPortHandle, RoutingGuid, Enabled) {
        RoutingGuid := RoutingGuid is String ? StrPtr(RoutingGuid) : RoutingGuid

        result := DllCall(this.value, HANDLE, FaxPortHandle, "ptr", RoutingGuid, BOOL, Enabled, BOOL)
        return result
    }

    /**
     * A PFAXENABLEROUTINGMETHODW that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFAXENABLEROUTINGMETHODW {
        /**
         * Creates a PFAXENABLEROUTINGMETHODW pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, PWSTR, BOOL) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, PWSTR, BOOL, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
