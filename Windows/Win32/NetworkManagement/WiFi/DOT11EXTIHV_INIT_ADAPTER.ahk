#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\DOT11_ADAPTER.ahk" { DOT11_ADAPTER }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11EXTIHV_INIT_ADAPTER {
    value : IntPtr

    __value {
        set {
            if (value is DOT11EXTIHV_INIT_ADAPTER) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DOT11_ADAPTER>} pDot11Adapter 
     * @param {HANDLE} hDot11SvcHandle 
     * @param {Pointer<HANDLE>} phIhvExtAdapter 
     * @returns {Integer} 
     */
    Call(pDot11Adapter, hDot11SvcHandle, phIhvExtAdapter) {
        result := DllCall(this.value, DOT11_ADAPTER.Ptr, pDot11Adapter, HANDLE, hDot11SvcHandle, HANDLE.Ptr, phIhvExtAdapter, UInt32)
        return result
    }

    /**
     * A DOT11EXTIHV_INIT_ADAPTER that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends DOT11EXTIHV_INIT_ADAPTER {
        /**
         * Creates a DOT11EXTIHV_INIT_ADAPTER pointer that invokes the given AHK function when called.
         * @param {Func(DOT11_ADAPTER, HANDLE, HANDLE) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DOT11_ADAPTER.Ptr, HANDLE, HANDLE.Ptr, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
