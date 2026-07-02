#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\FAX_GLOBAL_ROUTING_INFOA.ahk" { FAX_GLOBAL_ROUTING_INFOA }

/**
 * @namespace Windows.Win32.Devices.Fax
 * @charset ANSI
 */
export default struct PFAXSETGLOBALROUTINGINFOA {
    value : IntPtr

    __value {
        set {
            if (value is PFAXSETGLOBALROUTINGINFOA) {
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
     * @param {Pointer<FAX_GLOBAL_ROUTING_INFOA>} RoutingInfo 
     * @returns {BOOL} 
     */
    Call(FaxPortHandle, RoutingInfo) {
        result := DllCall(this.value, HANDLE, FaxPortHandle, FAX_GLOBAL_ROUTING_INFOA.Ptr, RoutingInfo, BOOL)
        return result
    }

    /**
     * A PFAXSETGLOBALROUTINGINFOA that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFAXSETGLOBALROUTINGINFOA {
        /**
         * Creates a PFAXSETGLOBALROUTINGINFOA pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, FAX_GLOBAL_ROUTING_INFOA) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, FAX_GLOBAL_ROUTING_INFOA.Ptr, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
