#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DOT11EXT_APIS.ahk" { DOT11EXT_APIS }
#Import ".\DOT11EXT_IHV_HANDLERS.ahk" { DOT11EXT_IHV_HANDLERS }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11EXTIHV_INIT_SERVICE {
    value : IntPtr

    __value {
        set {
            if (value is DOT11EXTIHV_INIT_SERVICE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} dwVerNumUsed 
     * @param {Pointer<DOT11EXT_APIS>} pDot11ExtAPI 
     * @param {Pointer<DOT11EXT_IHV_HANDLERS>} pDot11IHVHandlers 
     * @returns {Integer} 
     */
    Call(dwVerNumUsed, pDot11ExtAPI, pDot11IHVHandlers) {
        static pvReserved := 0 ;Reserved parameters must always be NULL

        result := DllCall(this.value, UInt32, dwVerNumUsed, DOT11EXT_APIS.Ptr, pDot11ExtAPI, "ptr", pvReserved, DOT11EXT_IHV_HANDLERS.Ptr, pDot11IHVHandlers, UInt32)
        return result
    }

    /**
     * A DOT11EXTIHV_INIT_SERVICE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends DOT11EXTIHV_INIT_SERVICE {
        /**
         * Creates a DOT11EXTIHV_INIT_SERVICE pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, DOT11EXT_APIS, DOT11EXT_IHV_HANDLERS) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, DOT11EXT_APIS.Ptr, DOT11EXT_IHV_HANDLERS.Ptr, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
