#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\DOT11EXT_VIRTUAL_STATION_AP_PROPERTY.ahk" { DOT11EXT_VIRTUAL_STATION_AP_PROPERTY }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11EXT_SET_VIRTUAL_STATION_AP_PROPERTIES {
    value : IntPtr

    __value {
        set {
            if (value is DOT11EXT_SET_VIRTUAL_STATION_AP_PROPERTIES) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HANDLE} hDot11SvcHandle 
     * @param {HANDLE} hConnectSession 
     * @param {Integer} dwNumProperties 
     * @param {Pointer<DOT11EXT_VIRTUAL_STATION_AP_PROPERTY>} pProperties 
     * @returns {Integer} 
     */
    Call(hDot11SvcHandle, hConnectSession, dwNumProperties, pProperties) {
        static pvReserved := 0 ;Reserved parameters must always be NULL

        result := DllCall(this.value, HANDLE, hDot11SvcHandle, HANDLE, hConnectSession, UInt32, dwNumProperties, DOT11EXT_VIRTUAL_STATION_AP_PROPERTY.Ptr, pProperties, "ptr", pvReserved, UInt32)
        return result
    }

    /**
     * A DOT11EXT_SET_VIRTUAL_STATION_AP_PROPERTIES that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends DOT11EXT_SET_VIRTUAL_STATION_AP_PROPERTIES {
        /**
         * Creates a DOT11EXT_SET_VIRTUAL_STATION_AP_PROPERTIES pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, HANDLE, UInt32, DOT11EXT_VIRTUAL_STATION_AP_PROPERTY) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, HANDLE, UInt32, DOT11EXT_VIRTUAL_STATION_AP_PROPERTY.Ptr, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
