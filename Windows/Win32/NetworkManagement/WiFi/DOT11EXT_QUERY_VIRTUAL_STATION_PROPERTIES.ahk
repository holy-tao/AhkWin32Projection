#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11EXT_QUERY_VIRTUAL_STATION_PROPERTIES {
    value : IntPtr

    __value {
        set {
            if (value is DOT11EXT_QUERY_VIRTUAL_STATION_PROPERTIES) {
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
     * @param {Pointer<BOOL>} pbIsVirtualStation 
     * @param {Pointer<Guid>} pgPrimary 
     * @returns {Integer} 
     */
    Call(hDot11SvcHandle, pbIsVirtualStation, pgPrimary) {
        static pvReserved := 0 ;Reserved parameters must always be NULL

        pbIsVirtualStationMarshal := pbIsVirtualStation is VarRef ? "int*" : "ptr"

        result := DllCall(this.value, HANDLE, hDot11SvcHandle, pbIsVirtualStationMarshal, pbIsVirtualStation, Guid.Ptr, pgPrimary, "ptr", pvReserved, UInt32)
        return result
    }

    /**
     * A DOT11EXT_QUERY_VIRTUAL_STATION_PROPERTIES that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends DOT11EXT_QUERY_VIRTUAL_STATION_PROPERTIES {
        /**
         * Creates a DOT11EXT_QUERY_VIRTUAL_STATION_PROPERTIES pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, BOOL, Guid) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, BOOL.Ptr, Guid.Ptr, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
