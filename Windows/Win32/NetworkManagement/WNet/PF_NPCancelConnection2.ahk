#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.NetworkManagement.WNet
 */
export default struct PF_NPCancelConnection2 {
    value : IntPtr

    __value {
        set {
            if (value is PF_NPCancelConnection2) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PWSTR} lpName 
     * @param {BOOL} fForce 
     * @param {Integer} dwFlags 
     * @returns {Integer} 
     */
    Call(lpName, fForce, dwFlags) {
        lpName := lpName is String ? StrPtr(lpName) : lpName

        result := DllCall(this.value, "ptr", lpName, BOOL, fForce, UInt32, dwFlags, UInt32)
        return result
    }

    /**
     * A PF_NPCancelConnection2 that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PF_NPCancelConnection2 {
        /**
         * Creates a PF_NPCancelConnection2 pointer that invokes the given AHK function when called.
         * @param {Func(PWSTR, BOOL, UInt32) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PWSTR, BOOL, UInt32, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
