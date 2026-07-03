#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DOT11EXT_VIRTUAL_STATION_APIS.ahk" { DOT11EXT_VIRTUAL_STATION_APIS }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11EXTIHV_INIT_VIRTUAL_STATION {
    value : IntPtr

    __value {
        set {
            if (value is DOT11EXTIHV_INIT_VIRTUAL_STATION) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DOT11EXT_VIRTUAL_STATION_APIS>} pDot11ExtVSAPI 
     * @returns {Integer} 
     */
    Call(pDot11ExtVSAPI) {
        static pvReserved := 0 ;Reserved parameters must always be NULL

        result := DllCall(this.value, DOT11EXT_VIRTUAL_STATION_APIS.Ptr, pDot11ExtVSAPI, "ptr", pvReserved, UInt32)
        return result
    }

    /**
     * A DOT11EXTIHV_INIT_VIRTUAL_STATION that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends DOT11EXTIHV_INIT_VIRTUAL_STATION {
        /**
         * Creates a DOT11EXTIHV_INIT_VIRTUAL_STATION pointer that invokes the given AHK function when called.
         * @param {Func(DOT11EXT_VIRTUAL_STATION_APIS) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DOT11EXT_VIRTUAL_STATION_APIS.Ptr, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
