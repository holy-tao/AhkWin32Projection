#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Devices.Fax
 * @charset Unicode
 */
export default struct PFAXSETROUTINGINFOW {
    value : IntPtr

    __value {
        set {
            if (value is PFAXSETROUTINGINFOW) {
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
     * @param {Pointer<Integer>} RoutingInfoBuffer 
     * @param {Integer} RoutingInfoBufferSize 
     * @returns {BOOL} 
     */
    Call(FaxPortHandle, RoutingGuid, RoutingInfoBuffer, RoutingInfoBufferSize) {
        RoutingGuid := RoutingGuid is String ? StrPtr(RoutingGuid) : RoutingGuid

        RoutingInfoBufferMarshal := RoutingInfoBuffer is VarRef ? "char*" : "ptr"

        result := DllCall(this.value, HANDLE, FaxPortHandle, "ptr", RoutingGuid, RoutingInfoBufferMarshal, RoutingInfoBuffer, UInt32, RoutingInfoBufferSize, BOOL)
        return result
    }

    /**
     * A PFAXSETROUTINGINFOW that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFAXSETROUTINGINFOW {
        /**
         * Creates a PFAXSETROUTINGINFOW pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, PWSTR, "char*", UInt32) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, PWSTR, "char*", UInt32, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
