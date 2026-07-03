#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FAX_ROUTING_METHODW.ahk" { FAX_ROUTING_METHODW }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * @namespace Windows.Win32.Devices.Fax
 * @charset Unicode
 */
export default struct PFAXENUMROUTINGMETHODSW {
    value : IntPtr

    __value {
        set {
            if (value is PFAXENUMROUTINGMETHODSW) {
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
     * @param {Pointer<Pointer<FAX_ROUTING_METHODW>>} RoutingMethod 
     * @param {Pointer<Integer>} MethodsReturned 
     * @returns {BOOL} 
     */
    Call(FaxPortHandle, RoutingMethod, MethodsReturned) {
        RoutingMethodMarshal := RoutingMethod is VarRef ? "ptr*" : "ptr"
        MethodsReturnedMarshal := MethodsReturned is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, HANDLE, FaxPortHandle, RoutingMethodMarshal, RoutingMethod, MethodsReturnedMarshal, MethodsReturned, BOOL)
        return result
    }

    /**
     * A PFAXENUMROUTINGMETHODSW that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFAXENUMROUTINGMETHODSW {
        /**
         * Creates a PFAXENUMROUTINGMETHODSW pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, "ptr*", "uint*") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, "ptr*", "uint*", BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
