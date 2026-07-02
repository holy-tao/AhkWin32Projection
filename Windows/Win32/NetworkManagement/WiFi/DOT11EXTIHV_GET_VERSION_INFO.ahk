#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DOT11_IHV_VERSION_INFO.ahk" { DOT11_IHV_VERSION_INFO }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11EXTIHV_GET_VERSION_INFO {
    value : IntPtr

    __value {
        set {
            if (value is DOT11EXTIHV_GET_VERSION_INFO) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DOT11_IHV_VERSION_INFO>} pDot11IHVVersionInfo 
     * @returns {Integer} 
     */
    Call(pDot11IHVVersionInfo) {
        result := DllCall(this.value, DOT11_IHV_VERSION_INFO.Ptr, pDot11IHVVersionInfo, UInt32)
        return result
    }

    /**
     * A DOT11EXTIHV_GET_VERSION_INFO that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends DOT11EXTIHV_GET_VERSION_INFO {
        /**
         * Creates a DOT11EXTIHV_GET_VERSION_INFO pointer that invokes the given AHK function when called.
         * @param {Func(DOT11_IHV_VERSION_INFO) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DOT11_IHV_VERSION_INFO.Ptr, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
