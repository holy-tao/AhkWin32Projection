#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\LUID.ahk" { LUID }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.NetworkManagement.WNet
 */
export default struct PF_NPLogonNotify {
    value : IntPtr

    __value {
        set {
            if (value is PF_NPLogonNotify) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<LUID>} lpLogonId 
     * @param {PWSTR} lpAuthentInfoType 
     * @param {Pointer<Void>} lpAuthentInfo 
     * @param {PWSTR} lpPreviousAuthentInfoType 
     * @param {Pointer<Void>} lpPreviousAuthentInfo 
     * @param {PWSTR} lpStationName 
     * @param {Pointer<Void>} StationHandle 
     * @param {Pointer<PWSTR>} lpLogonScript 
     * @returns {Integer} 
     */
    Call(lpLogonId, lpAuthentInfoType, lpAuthentInfo, lpPreviousAuthentInfoType, lpPreviousAuthentInfo, lpStationName, StationHandle, lpLogonScript) {
        lpAuthentInfoType := lpAuthentInfoType is String ? StrPtr(lpAuthentInfoType) : lpAuthentInfoType
        lpPreviousAuthentInfoType := lpPreviousAuthentInfoType is String ? StrPtr(lpPreviousAuthentInfoType) : lpPreviousAuthentInfoType
        lpStationName := lpStationName is String ? StrPtr(lpStationName) : lpStationName

        lpAuthentInfoMarshal := lpAuthentInfo is VarRef ? "ptr" : "ptr"
        lpPreviousAuthentInfoMarshal := lpPreviousAuthentInfo is VarRef ? "ptr" : "ptr"
        StationHandleMarshal := StationHandle is VarRef ? "ptr" : "ptr"
        lpLogonScriptMarshal := lpLogonScript is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, LUID.Ptr, lpLogonId, "ptr", lpAuthentInfoType, lpAuthentInfoMarshal, lpAuthentInfo, "ptr", lpPreviousAuthentInfoType, lpPreviousAuthentInfoMarshal, lpPreviousAuthentInfo, "ptr", lpStationName, StationHandleMarshal, StationHandle, lpLogonScriptMarshal, lpLogonScript, UInt32)
        return result
    }

    /**
     * A PF_NPLogonNotify that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PF_NPLogonNotify {
        /**
         * Creates a PF_NPLogonNotify pointer that invokes the given AHK function when called.
         * @param {Func(LUID, PWSTR, "ptr", PWSTR, "ptr", PWSTR, "ptr", PWSTR) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 8)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 8 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [LUID.Ptr, PWSTR, "ptr", PWSTR, "ptr", PWSTR, "ptr", PWSTR.Ptr, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
