#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Devices.Fax
 * @charset ANSI
 */
export default struct PFAXGETROUTINGINFOA {
    value : IntPtr

    __value {
        set {
            if (value is PFAXGETROUTINGINFOA) {
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
     * @param {Pointer<Pointer<Integer>>} RoutingInfoBuffer 
     * @param {Pointer<Integer>} RoutingInfoBufferSize 
     * @returns {BOOL} 
     */
    Call(FaxPortHandle, RoutingGuid, RoutingInfoBuffer, RoutingInfoBufferSize) {
        RoutingGuid := RoutingGuid is String ? StrPtr(RoutingGuid) : RoutingGuid

        RoutingInfoBufferMarshal := RoutingInfoBuffer is VarRef ? "ptr*" : "ptr"
        RoutingInfoBufferSizeMarshal := RoutingInfoBufferSize is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, HANDLE, FaxPortHandle, "ptr", RoutingGuid, RoutingInfoBufferMarshal, RoutingInfoBuffer, RoutingInfoBufferSizeMarshal, RoutingInfoBufferSize, BOOL)
        return result
    }

    /**
     * A PFAXGETROUTINGINFOA that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFAXGETROUTINGINFOA {
        /**
         * Creates a PFAXGETROUTINGINFOA pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, PSTR, "ptr*", "uint*") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, PSTR, "ptr*", "uint*", BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
