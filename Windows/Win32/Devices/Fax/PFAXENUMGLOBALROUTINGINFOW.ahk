#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\FAX_GLOBAL_ROUTING_INFOW.ahk" { FAX_GLOBAL_ROUTING_INFOW }

/**
 * @namespace Windows.Win32.Devices.Fax
 * @charset Unicode
 */
export default struct PFAXENUMGLOBALROUTINGINFOW {
    value : IntPtr

    __value {
        set {
            if (value is PFAXENUMGLOBALROUTINGINFOW) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HANDLE} FaxHandle 
     * @param {Pointer<Pointer<FAX_GLOBAL_ROUTING_INFOW>>} RoutingInfo 
     * @param {Pointer<Integer>} MethodsReturned 
     * @returns {BOOL} 
     */
    Call(FaxHandle, RoutingInfo, MethodsReturned) {
        RoutingInfoMarshal := RoutingInfo is VarRef ? "ptr*" : "ptr"
        MethodsReturnedMarshal := MethodsReturned is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, HANDLE, FaxHandle, RoutingInfoMarshal, RoutingInfo, MethodsReturnedMarshal, MethodsReturned, BOOL)
        return result
    }

    /**
     * A PFAXENUMGLOBALROUTINGINFOW that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFAXENUMGLOBALROUTINGINFOW {
        /**
         * Creates a PFAXENUMGLOBALROUTINGINFOW pointer that invokes the given AHK function when called.
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
