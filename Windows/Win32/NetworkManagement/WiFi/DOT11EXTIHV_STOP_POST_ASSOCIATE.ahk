#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11EXTIHV_STOP_POST_ASSOCIATE {
    value : IntPtr

    __value {
        set {
            if (value is DOT11EXTIHV_STOP_POST_ASSOCIATE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HANDLE} hIhvExtAdapter 
     * @param {Pointer<Pointer<Integer>>} pPeer 
     * @param {Integer} dot11AssocStatus 
     * @returns {Integer} 
     */
    Call(hIhvExtAdapter, pPeer, dot11AssocStatus) {
        pPeerMarshal := pPeer is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, HANDLE, hIhvExtAdapter, pPeerMarshal, pPeer, UInt32, dot11AssocStatus, UInt32)
        return result
    }

    /**
     * A DOT11EXTIHV_STOP_POST_ASSOCIATE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends DOT11EXTIHV_STOP_POST_ASSOCIATE {
        /**
         * Creates a DOT11EXTIHV_STOP_POST_ASSOCIATE pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, "ptr*", UInt32) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, "ptr*", UInt32, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
