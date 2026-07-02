#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Devices.Fax
 * @charset ANSI
 */
export default struct PFAXENABLEROUTINGMETHODA {
    value : IntPtr

    __value {
        set {
            if (value is PFAXENABLEROUTINGMETHODA) {
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
     * @param {PSTR} RoutingGuid 
     * @param {BOOL} Enabled 
     * @returns {BOOL} 
     */
    Call(FaxPortHandle, RoutingGuid, Enabled) {
        RoutingGuid := RoutingGuid is String ? StrPtr(RoutingGuid) : RoutingGuid

        result := DllCall(this.value, HANDLE, FaxPortHandle, "ptr", RoutingGuid, BOOL, Enabled, BOOL)
        return result
    }

    /**
     * A PFAXENABLEROUTINGMETHODA that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFAXENABLEROUTINGMETHODA {
        /**
         * Creates a PFAXENABLEROUTINGMETHODA pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, PSTR, BOOL) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, PSTR, BOOL, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
