#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.NetworkManagement.WNet
 */
export default struct PF_NPGetUser {
    value : IntPtr

    __value {
        set {
            if (value is PF_NPGetUser) {
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
     * @param {PWSTR} lpUserName 
     * @param {Pointer<Integer>} lpnBufferLen 
     * @returns {Integer} 
     */
    Call(lpName, lpUserName, lpnBufferLen) {
        lpName := lpName is String ? StrPtr(lpName) : lpName
        lpUserName := lpUserName is String ? StrPtr(lpUserName) : lpUserName

        lpnBufferLenMarshal := lpnBufferLen is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, "ptr", lpName, "ptr", lpUserName, lpnBufferLenMarshal, lpnBufferLen, UInt32)
        return result
    }

    /**
     * A PF_NPGetUser that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PF_NPGetUser {
        /**
         * Creates a PF_NPGetUser pointer that invokes the given AHK function when called.
         * @param {Func(PWSTR, PWSTR, "uint*") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PWSTR, PWSTR, "uint*", UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
