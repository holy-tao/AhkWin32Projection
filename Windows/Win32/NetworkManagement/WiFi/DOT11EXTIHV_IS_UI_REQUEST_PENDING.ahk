#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11EXTIHV_IS_UI_REQUEST_PENDING {
    value : IntPtr

    __value {
        set {
            if (value is DOT11EXTIHV_IS_UI_REQUEST_PENDING) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Guid} guidUIRequest 
     * @param {Pointer<BOOL>} pbIsRequestPending 
     * @returns {Integer} 
     */
    Call(guidUIRequest, pbIsRequestPending) {
        pbIsRequestPendingMarshal := pbIsRequestPending is VarRef ? "int*" : "ptr"

        result := DllCall(this.value, Guid, guidUIRequest, pbIsRequestPendingMarshal, pbIsRequestPending, UInt32)
        return result
    }

    /**
     * A DOT11EXTIHV_IS_UI_REQUEST_PENDING that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends DOT11EXTIHV_IS_UI_REQUEST_PENDING {
        /**
         * Creates a DOT11EXTIHV_IS_UI_REQUEST_PENDING pointer that invokes the given AHK function when called.
         * @param {Func(Guid, BOOL) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [Guid, BOOL.Ptr, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
