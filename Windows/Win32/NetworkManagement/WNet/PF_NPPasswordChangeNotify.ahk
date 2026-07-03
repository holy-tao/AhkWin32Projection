#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.NetworkManagement.WNet
 */
export default struct PF_NPPasswordChangeNotify {
    value : IntPtr

    __value {
        set {
            if (value is PF_NPPasswordChangeNotify) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PWSTR} lpAuthentInfoType 
     * @param {Pointer<Void>} lpAuthentInfo 
     * @param {PWSTR} lpPreviousAuthentInfoType 
     * @param {Pointer<Void>} lpPreviousAuthentInfo 
     * @param {PWSTR} lpStationName 
     * @param {Pointer<Void>} StationHandle 
     * @param {Integer} dwChangeInfo 
     * @returns {Integer} 
     */
    Call(lpAuthentInfoType, lpAuthentInfo, lpPreviousAuthentInfoType, lpPreviousAuthentInfo, lpStationName, StationHandle, dwChangeInfo) {
        lpAuthentInfoType := lpAuthentInfoType is String ? StrPtr(lpAuthentInfoType) : lpAuthentInfoType
        lpPreviousAuthentInfoType := lpPreviousAuthentInfoType is String ? StrPtr(lpPreviousAuthentInfoType) : lpPreviousAuthentInfoType
        lpStationName := lpStationName is String ? StrPtr(lpStationName) : lpStationName

        lpAuthentInfoMarshal := lpAuthentInfo is VarRef ? "ptr" : "ptr"
        lpPreviousAuthentInfoMarshal := lpPreviousAuthentInfo is VarRef ? "ptr" : "ptr"
        StationHandleMarshal := StationHandle is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, "ptr", lpAuthentInfoType, lpAuthentInfoMarshal, lpAuthentInfo, "ptr", lpPreviousAuthentInfoType, lpPreviousAuthentInfoMarshal, lpPreviousAuthentInfo, "ptr", lpStationName, StationHandleMarshal, StationHandle, UInt32, dwChangeInfo, UInt32)
        return result
    }

    /**
     * A PF_NPPasswordChangeNotify that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PF_NPPasswordChangeNotify {
        /**
         * Creates a PF_NPPasswordChangeNotify pointer that invokes the given AHK function when called.
         * @param {Func(PWSTR, "ptr", PWSTR, "ptr", PWSTR, "ptr", UInt32) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 7)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 7 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PWSTR, "ptr", PWSTR, "ptr", PWSTR, "ptr", UInt32, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
